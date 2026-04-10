#!/bin/bash -i

# Expand aliases defined in the shell ~/.bashrc
shopt -s expand_aliases

sme++ gemm_cr.cpp -o gemm_cr
llvm-objdump-18 gemm_cr -d -h > gemm_cr.S
armie64 ./gemm_cr
rm gemm_cr

sme++ gemm_crb.cpp -o gemm_crb
llvm-objdump-18 gemm_crb -d -h > gemm_crb.S
armie64 ./gemm_crb
rm gemm_crb

sme++ gemm_crbp.cpp -o gemm_crbp
llvm-objdump-18 gemm_crbp -d -h > gemm_crbp.S
armie64 ./gemm_crbp
rm gemm_crbp

sme++ gemm_crg.cpp -o gemm_crg
llvm-objdump-18 gemm_crg -d -h > gemm_crg.S
armie64 ./gemm_crg
rm gemm_crg

sme++ gemm_crgp.cpp -o gemm_crgp
llvm-objdump-18 gemm_crgp -d -h > gemm_crgp.S
armie64 ./gemm_crgp
rm gemm_crgp