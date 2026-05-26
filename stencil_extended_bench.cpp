// Benchmark for extended packed stencil (16→32 and 16→16 variants)
//
// Compile: sme++ -O3 -fopenmp -I./include -DMODE=32 stencil_extended_bench.cpp
// -o stencil_16to32
//          sme++ -O3 -fopenmp -I./include -DMODE=16 stencil_extended_bench.cpp
//          -o stencil_16to16
//
// Run:     armie64 ./stencil_16to32 ni nj nk nb
//          armie64 ./stencil_16to16 ni nj nk nb

#include <arm_sve.h>
#include <omp.h>

#include <chrono>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>

#include "include/stencil_extended_packed.hpp"

#ifndef MODE
#define MODE 32  // 16 or 32
#endif

#ifndef WITERS
#define WITERS 1
#endif

#ifndef ITERS
#define ITERS 3
#endif

int main(int argc, char** argv) {
  int ni = 56, nj = 56, nk = 56, nb = 616;
  if (argc >= 5) {
    ni = std::atoi(argv[1]);
    nj = std::atoi(argv[2]);
    nk = std::atoi(argv[3]);
    nb = std::atoi(argv[4]);
  }

  const int FDn = 6;
  const uint K = ni * nj * nk;
  const uint ni_ex = ni + 2 * FDn;
  const uint nj_ex = nj + 2 * FDn;
  const uint nk_ex = nk + 2 * FDn;
  const uint K_ex = ni_ex * nj_ex * nk_ex;
  const uint num_tiles_16 = (nb + 15) / 16;
  const uint num_tiles_32 = (nb + 31) / 32;

  printf("Stencil 16→%d benchmark: %dx%dx%d x %d bands, FDn=%d\n", MODE, ni, nj,
         nk, nb, FDn);
  printf("Blocking: TI=%d, TJ=%d, TB=%d\n", STENCIL_TI, STENCIL_TJ, STENCIL_TB);
  printf("K=%u, K_ex=%u, tiles_16=%u, tiles_32=%u\n", K, K_ex, num_tiles_16,
         num_tiles_32);

  // Allocate
  double* S_ext = new (std::align_val_t(64)) double[num_tiles_16 * K_ex * 16]();
  double* A_diag = new (std::align_val_t(64)) double[K]();

  // Initialize with random data
  std::mt19937 gen(42);
  std::uniform_real_distribution<double> dist(-1.0, 1.0);
  for (uint64_t i = 0; i < (uint64_t)num_tiles_16 * K_ex * 16; i++)
    S_ext[i] = dist(gen);
  for (uint i = 0; i < K; i++) A_diag[i] = dist(gen);

  double coef_x[7] = {0.0,     -1.0 / 12, 4.0 / 3, -5.0 / 2,
                      4.0 / 3, -1.0 / 12, 0.0};
  double coef_y[7] = {0.0,     -1.0 / 12, 4.0 / 3, -5.0 / 2,
                      4.0 / 3, -1.0 / 12, 0.0};
  double coef_z[7] = {0.0,     -1.0 / 12, 4.0 / 3, -5.0 / 2,
                      4.0 / 3, -1.0 / 12, 0.0};
  double coef_0 = -15.0;

#if MODE == 32
  double* D_out = new (std::align_val_t(64)) double[num_tiles_32 * K * 32]();

  // Warmup
  for (int i = 0; i < WITERS; i++) {
    Stencil_method::Packed::calc_laplacian_extended_packed_16to32(
        S_ext, D_out, A_diag, ni, nj, nk, nb, FDn, coef_x, coef_y, coef_z,
        coef_0);
  }

  auto start = std::chrono::steady_clock::now();
  for (int i = 0; i < ITERS; i++) {
    Stencil_method::Packed::calc_laplacian_extended_packed_16to32(
        S_ext, D_out, A_diag, ni, nj, nk, nb, FDn, coef_x, coef_y, coef_z,
        coef_0);
  }
  auto end = std::chrono::steady_clock::now();
#else
  double* D_out = new (std::align_val_t(64)) double[num_tiles_16 * K * 16]();

  // Warmup
  for (int i = 0; i < WITERS; i++) {
    Stencil_method::Packed::calc_laplacian_extended_packed_16to16(
        S_ext, D_out, A_diag, ni, nj, nk, nb, FDn, coef_x, coef_y, coef_z,
        coef_0);
  }

  auto start = std::chrono::steady_clock::now();
  for (int i = 0; i < ITERS; i++) {
    Stencil_method::Packed::calc_laplacian_extended_packed_16to16(
        S_ext, D_out, A_diag, ni, nj, nk, nb, FDn, coef_x, coef_y, coef_z,
        coef_0);
  }
  auto end = std::chrono::steady_clock::now();
#endif

  double time_us =
      std::chrono::duration<double, std::micro>(end - start).count() / ITERS;
  // FLOPs: per grid per band: coef_0 mult + Vloc add = 2, plus 6 directions *
  // (2 loads + 1 add + 1 fma) ≈ 2 + 6*4 = 26 Simpler: (2 + 4*FDn) * K * nb
  double flops = (2.0 + 4.0 * FDn) * K * nb;
  double gflops = flops / (time_us * 1000.0);

  // Bandwidth: read K_ex*nb (input) + K*nb (A_diag broadcast) + write K*nb
  // (output)
  double bytes_read = (double)num_tiles_16 * K_ex * 16 * 8 + (double)K * 8;
  double bytes_write = (MODE == 32) ? (double)num_tiles_32 * K * 32 * 8
                                    : (double)num_tiles_16 * K * 16 * 8;
  double bw_gbps = (bytes_read + bytes_write) / (time_us * 1000.0);

  printf("%d,%d,%d,%d,%d,%d,%d,%d,%.2f,%.4f,%.4f\n", STENCIL_TI, STENCIL_TJ,
         STENCIL_TB, ni, nj, nk, nb, MODE, time_us, gflops, bw_gbps);

  delete[] S_ext;
  delete[] D_out;
  delete[] A_diag;

  return 0;
}
