#!/bin/bash
#DSUB --mpi hmpi
#DSUB -x job
#DSUB -q q_xlsdft
#DSUB -n syrk_sweep
#DSUB -rpn 1
#DSUB -nn 1
#DSUB -oo out.%A
#DSUB -eo err.%A

/work_ssd/software/performance_tune/root_proxy hugepage.sh 0 0 0 0 0 0 0 0
source /work_ssd/software/HPCKit/25.2.1/setvars.sh

log_file=syrk_sweep_results.csv
rm -f $log_file

BINROOT=/home/share/zhangyu/Shriramch/chefsi-gemm
cd $BINROOT

export UCX_RC_VERBS_ROCE_LOCAL_SUBNET=y
export UCX_UD_VERBS_ROCE_LOCAL_SUBNET=y
export OMP_PROC_BIND=CLOSE
export OMP_PLACES=cores

# Target: projection SYRK mp = psi^T * psi
# M=nstates (616), K=Nd (175616)
M=616
K=175616

echo "MC_SYRK,NC_SYRK,KC_SYRK,M,K,time_us,GFLOP/s" > $log_file

for mc in 32 64 128 256; do
    for nc in 32 64 128 256; do
        for kc in 64 128 256 512 1024 2048; do
            echo "Building MC_SYRK=$mc NC_SYRK=$nc KC_SYRK=$kc..."
            sme++ -O3 -fopenmp -I./include -DMC_SYRK_VAL=$mc -DNC_SYRK_VAL=$nc \
                -DKC_SYRK_VAL=$kc syrk_crsp.cpp -o syrk_sweep 2>&1

            if [ $? -eq 0 ]; then
                OMP_NUM_THREADS=38 mpirun -np 1 --map-by ppr:1:numa:PE=38 \
                    numactl --cpunodebind=0 --membind=1 \
                    ./syrk_sweep $M $K >> $log_file 2>&1
            else
                echo "$mc,$nc,$kc,$M,$K,BUILD_FAILED,0" >> $log_file
            fi
        done
    done
done

echo ""
echo "Projection SYRK sweep complete. Results in $log_file"
