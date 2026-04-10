#!/bin/bash
#DSUB --mpi hmpi
#DSUB -x job
#DSUB -q q_ky_debug
#DSUB -n gemm_sme
#DSUB -rpn 16
#DSUB -nn 1
#DSUB -oo out.%A
#DSUB -eo err.%A

/work_ssd/software/performance_tune/root_proxy hugepage.sh 0 0 0 0 0 0 0 0
source /work_ssd/software/HPCKit/25.2.1/setvars.sh

log_file=gemm_benchmark.log
rm -f $log_file

BINROOT=/home/share/zhangyu/Shriramch/chefsi_gemm
# Alternatively: BINROOT=$(pwd)

export UCX_RC_VERBS_ROCE_LOCAL_SUBNET=y
export UCX_UD_VERBS_ROCE_LOCAL_SUBNET=y
export OMP_PROC_BIND=CLOSE
export OMP_PLACES=cores

echo "=========================================="  >> $log_file
echo "SME GEMM Benchmark Suite"                   >> $log_file
echo "38 threads, f64, 8 ZA tiles (2x4)"          >> $log_file
echo "=========================================="  >> $log_file
echo ""                                            >> $log_file

# Run all variants
for variant in gemm_cr gemm_crb gemm_crbp gemm_crg gemm_crgp gemm_crs gemm_crsp
do
    echo ""                                        >> $log_file
    echo "=== $variant ==="                        >> $log_file
    OMP_NUM_THREADS=38 $BINROOT/$variant           >> $log_file 2>&1
done

echo ""                                            >> $log_file
echo "=========================================="  >> $log_file
echo "Benchmark Complete"                          >> $log_file
echo "=========================================="  >> $log_file
