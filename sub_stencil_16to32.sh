#!/bin/bash
#DSUB --mpi hmpi
#DSUB -x job
#DSUB -q q_xlsdft
#DSUB -n stencil_16to32
#DSUB -rpn 1
#DSUB -nn 1
#DSUB -oo out.%A
#DSUB -eo err.%A

/work_ssd/software/performance_tune/root_proxy hugepage.sh 0 0 0 0 0 0 0 0
source /work_ssd/software/HPCKit/25.2.1/setvars.sh

log_file=stencil_16to32_results.csv
rm -f $log_file

BINROOT=/home/share/zhangyu/Shriramch/chefsi-gemm
cd $BINROOT

export UCX_RC_VERBS_ROCE_LOCAL_SUBNET=y
export UCX_UD_VERBS_ROCE_LOCAL_SUBNET=y
export OMP_PROC_BIND=CLOSE
export OMP_PLACES=cores

# Target: H*Psi stencil for projection (16-packed in → 32-packed out)
NI=56
NJ=56
NK=56
NB=616

echo "TI,TJ,TB,ni,nj,nk,nb,mode,time_us,GFLOP/s,GB/s" > $log_file

# 3D cache blocking sweep: TI (i-dim), TJ (j-dim), TB (band-dim)
for ti in 8 16 28 56; do
    for tj in 8 16 28 56; do
        for tb in 16 32 64 128 256 9999; do
            echo "Building TI=$ti TJ=$tj TB=$tb..."
            sme++ -O3 -fopenmp -I./include -DMODE=32 -DITERS=3 \
                -DSTENCIL_TI=$ti -DSTENCIL_TJ=$tj -DSTENCIL_TB=$tb \
                stencil_extended_bench.cpp -o stencil_16to32_bench 2>&1

            if [ $? -eq 0 ]; then
                OMP_NUM_THREADS=38 mpirun -np 1 --map-by ppr:1:numa:PE=38 \
                    numactl --cpunodebind=0 --membind=1 \
                    ./stencil_16to32_bench $NI $NJ $NK $NB >> $log_file 2>&1
            else
                echo "$ti,$tj,$tb,$NI,$NJ,$NK,$NB,32,BUILD_FAILED,0,0" >> $log_file
            fi
        done
    done
done

echo ""
echo "Stencil 16→32 sweep complete. Results in $log_file"
