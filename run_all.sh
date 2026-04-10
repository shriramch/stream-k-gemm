#!/bin/bash
# SME GEMM Benchmark Suite for 38-thread Grace CPU
# Run all variants and compare performance

set -e

echo "=========================================="
echo "SME GEMM Benchmark Suite"
echo "38 threads, f64, 8 ZA tiles (2x4)"
echo "=========================================="
echo ""

# Compile if needed (with native target on real HW)
# sme++ uses -march=armv9-a+sme by default
# On real HW, you may want: clang++ -O3 -march=native -fopenmp ...

VARIANTS="gemm_cr gemm_crb gemm_crbp gemm_crg gemm_crgp gemm_crs gemm_crsp"

echo "=== Variant Summary ==="
echo "gemm_cr    : Basic 8-tile, M-split parallelization"
echo "gemm_crb   : Cache-blocked (KC=2048, NC=64), M-split"
echo "gemm_crbp  : Packed A/B, cache-blocked, M-split"
echo "gemm_crg   : Gather prefetch, cache-blocked, M-split"
echo "gemm_crgp  : Packed + linear prefetch, cache-blocked, M-split"
echo "gemm_crs   : Stream-K (K-split), gather prefetch [RECOMMENDED for large K]"
echo "gemm_crsp  : Stream-K (K-split), packed + linear prefetch [RECOMMENDED]"
echo ""

echo "=== Running Tests ==="
for v in $VARIANTS; do
    echo ""
    echo "--- $v ---"
    ./$v 2>&1 | tail -20
done

echo ""
echo "=========================================="
echo "Summary"
echo "=========================================="
echo ""
echo "For CheFSI workload (M=608, N=608, K=175616):"
echo "  - Use gemm_crsp or gemm_crs for Stream-K (K-split)"
echo "  - Stream-K: 175616/38 = ~4621 K per thread"
echo "  - Each thread reads A/B exactly once"
echo "  - Reduction overhead: 38 × 608 × 608 × 8B = ~114MB"
echo ""
echo "For spatial (M-split) variants, prefer:"
echo "  - gemm_crg for non-packed input (gather prefetch)"
echo "  - gemm_crgp for packed input (linear prefetch)"
