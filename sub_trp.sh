#!/bin/bash
#DSUB --mpi hmpi
#DSUB -x job
#DSUB -q q_xlsdft
#DSUB -n gemm_trp
#DSUB -rpn 1
#DSUB -nn 1
#DSUB -oo out.%A
#DSUB -eo err.%A

/work_ssd/software/performance_tune/root_proxy hugepage.sh 0 0 0 0 0 0 0 0
source /work_ssd/software/HPCKit/25.2.1/setvars.sh

log_file=trp_sweep_results.csv
rm -f $log_file

BINROOT=/home/share/zhangyu/Shriramch/chefsi-gemm
cd $BINROOT

export UCX_RC_VERBS_ROCE_LOCAL_SUBNET=y
export UCX_UD_VERBS_ROCE_LOCAL_SUBNET=y
export OMP_PROC_BIND=CLOSE
export OMP_PLACES=cores

# CSV header
echo "MC,NC,KC,M,N,K,time_us,GFLOP/s" > $log_file

# Tile size sweep
# MC: 32, 64, 128, 256, 512
# NC: 32, 64, 128, 256
# KC: 64, 128, 256, 512, 1024

for mc in 32 64 128 256 512; do
    for nc in 32 64 128 256; do
        for kc in 64 128 256 512 1024; do
            echo "Building MC=$mc NC=$nc KC=$kc..."
            sme++ trp.cpp -I./include -L../libxsmm/lib -lxsmm -ldl \
                -DMC=$mc -DNC=$nc -DKC=$kc -DSKIP_VERIFY -o trp_sweep 2>&1
            
            if [ $? -eq 0 ]; then
                LD_LIBRARY_PATH=../libxsmm/lib OMP_NUM_THREADS=38 \
                    mpirun -np 1 --map-by ppr:1:numa:PE=38 \
                    numactl --cpunodebind=0 --membind=1 \
                    ./trp_sweep 4096 64 175616 >> $log_file 2>&1
            else
                echo "$mc,$nc,$kc,4096,64,175616,BUILD_FAILED,0" >> $log_file
            fi
        done
    done
done

echo ""
echo "Sweep complete. Results in $log_file"
echo "Total configurations: $(wc -l < $log_file) (including header)"
