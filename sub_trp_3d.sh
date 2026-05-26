#!/bin/bash
#DSUB --mpi hmpi
#DSUB -x job
#DSUB -q q_xlsdft
#DSUB -n trp_3d_sweep
#DSUB -rpn 1
#DSUB -nn 1
#DSUB -oo out.%A
#DSUB -eo err.%A

/work_ssd/software/performance_tune/root_proxy hugepage.sh 0 0 0 0 0 0 0 0
source /work_ssd/software/HPCKit/25.2.1/setvars.sh

log_file=trp_3d_sweep_results.csv
rm -f $log_file

BINROOT=/home/share/zhangyu/Shriramch/chefsi-gemm
cd $BINROOT

export UCX_RC_VERBS_ROCE_LOCAL_SUBNET=y
export UCX_UD_VERBS_ROCE_LOCAL_SUBNET=y
export OMP_PROC_BIND=CLOSE
export OMP_PLACES=cores

# Target: rotation GEMM psi_new = psi * Q
# Nd=175616 (56^3), nb=616
Nd=175616
NB=616

echo "TRP_MC,TRP_NC,TRP_KC,Nd,nb,output" > $log_file

# TRP_MC: grid tiles per M block (grid dimension)
# TRP_NC: output bands per N block
# TRP_KC: input bands per K block
for mc in 16 32 64 128 256; do
    for nc in 32 64 128 256; do
        for kc in 32 64 128 256 512; do
            echo "Building TRP_MC=$mc TRP_NC=$nc TRP_KC=$kc..."
            sme++ -O3 -fopenmp -I./include \
                -DTRP_MC=$mc -DTRP_NC=$nc -DTRP_KC=$kc \
                -DSKIP_VERIFY -DITERS=3 -DWITERS=1 \
                trp_3d_test.cpp -o trp_sweep 2>&1

            if [ $? -eq 0 ]; then
                OMP_NUM_THREADS=38 mpirun -np 1 --map-by ppr:1:numa:PE=38 \
                    numactl --cpunodebind=0 --membind=1 \
                    ./trp_sweep $Nd $NB >> $log_file 2>&1
            else
                echo "$mc,$nc,$kc,$Nd,$NB,BUILD_FAILED" >> $log_file
            fi
        done
    done
done

echo ""
echo "Rotation TRP sweep complete. Results in $log_file"
