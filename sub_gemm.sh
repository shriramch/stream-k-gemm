#!/bin/bash
#DSUB --mpi hmpi
#DSUB -x job
#DSUB -q q_xlsdft
#DSUB -n gemm_sweep
#DSUB -rpn 1
#DSUB -nn 1
#DSUB -oo out.%A
#DSUB -eo err.%A

/work_ssd/software/performance_tune/root_proxy hugepage.sh 0 0 0 0 0 0 0 0
source /work_ssd/software/HPCKit/25.2.1/setvars.sh

log_file=gemm_sweep_results.csv
rm -f $log_file

BINROOT=/home/share/zhangyu/Shriramch/chefsi-gemm
cd $BINROOT

export UCX_RC_VERBS_ROCE_LOCAL_SUBNET=y
export UCX_UD_VERBS_ROCE_LOCAL_SUBNET=y
export OMP_PROC_BIND=CLOSE
export OMP_PLACES=cores

# Target: projection GEMM hp = psi^T * h_psi
# M=N=nstates (616), K=Nd (175616)
M=616
N=616
K=175616

echo "MC,NC,KC,M,N,K,time_us,GFLOP/s" > $log_file

# MC: rows of A per block
# NC: columns of B per block
# KC: K-dimension blocking
for mc in 32 64 128 256; do
    for nc in 64 128 256 512; do
        for kc in 256 512 1024 2048 4096; do
            echo "Building MC=$mc NC=$nc KC=$kc..."
            sme++ -O3 -fopenmp -I./include -DMC=$mc -DNC=$nc -DKC=$kc -DSKIP_VERIFY \
                -DITERS=3 gemm_crsp.cpp -o gemm_sweep 2>&1

            if [ $? -eq 0 ]; then
                OMP_NUM_THREADS=38 mpirun -np 1 --map-by ppr:1:numa:PE=38 \
                    numactl --cpunodebind=0 --membind=1 \
                    ./gemm_sweep $M $N $K >> $log_file 2>&1
            else
                echo "$mc,$nc,$kc,$M,$N,$K,BUILD_FAILED,0" >> $log_file
            fi
        done
    done
done

echo ""
echo "Projection GEMM sweep complete. Results in $log_file"
