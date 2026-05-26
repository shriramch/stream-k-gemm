#!/bin/bash
#DSUB --mpi hmpi
#DSUB -x job
#DSUB -q q_xlsdft
#DSUB -n stencil_packed
#DSUB -rpn 1
#DSUB -nn 1
#DSUB -oo out.%A
#DSUB -eo err.%A

/work_ssd/software/performance_tune/root_proxy hugepage.sh 0 0 0 0 0 0 0 0
source /work_ssd/software/HPCKit/25.2.1/setvars.sh

log_file=stencil_sweep_results.csv
rm -f $log_file

BINROOT=/home/share/zhangyu/Shriramch/chefsi-gemm
cd $BINROOT

export UCX_RC_VERBS_ROCE_LOCAL_SUBNET=y
export UCX_UD_VERBS_ROCE_LOCAL_SUBNET=y
export OMP_PROC_BIND=CLOSE
export OMP_PLACES=cores

# CSV header
echo "TI,TJ,TK,ni,nj,nk,nb,time_us,GFLOP/s" > $log_file

# Target problem size
NI=56
NJ=56
NK=56
NB=616

# Tile size sweep
# TI: 8, 16, 32, 64, 128
# TJ: 4, 8, 16, 32
# TK: 4, 8, 16, 32

for ti in 8 16 32 64 128; do
    for tj in 4 8 16 32; do
        for tk in 4 8 16 32; do
            echo "Building TI=$ti TJ=$tj TK=$tk..."
            sme++ stencil_packed.cpp -I./include \
                -DTI=$ti -DTJ=$tj -DTK=$tk -DSKIP_VERIFY -o stencil_sweep 2>&1
            
            if [ $? -eq 0 ]; then
                OMP_NUM_THREADS=38 \
                    mpirun -np 1 --map-by ppr:1:numa:PE=38 \
                    numactl --cpunodebind=0 --membind=1 \
                    ./stencil_sweep $NI $NJ $NK $NB >> $log_file 2>&1
            else
                echo "$ti,$tj,$tk,$NI,$NJ,$NK,$NB,BUILD_FAILED,0" >> $log_file
            fi
        done
    done
done

echo ""
echo "Sweep complete. Results in $log_file"
echo "Total configurations: $(wc -l < $log_file) (including header)"
