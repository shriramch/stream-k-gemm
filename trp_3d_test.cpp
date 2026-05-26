// Test for SME TRP GEMM with 3D Cache Blocking
// Grid-packed input → Band-packed output (direct, no conversions, no scaling)

#include <omp.h>

#include <chrono>
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "include/hbm_alloc.hpp"
#include "include/sme_trp_3d.hpp"

#ifndef NUM_THREADS
#define NUM_THREADS 38
#endif

#ifndef WITERS
#define WITERS 3
#endif

#ifndef ITERS
#define ITERS 10
#endif

// =============================================================================
// Pack/Unpack utilities
// =============================================================================

template <typename T>
T grid_packed_get(const T* data, int Nd, int nb, int g, int b) {
  return data[(g / 16) * nb * 16 + b * 16 + g % 16];
}

template <typename T>
void grid_packed_set(T* data, int Nd, int nb, int g, int b, T val) {
  data[(g / 16) * nb * 16 + b * 16 + g % 16] = val;
}

template <typename T>
T band_packed_get(const T* data, int Nd, int nb, int g, int b) {
  return data[(b / 16) * Nd * 16 + g * 16 + b % 16];
}

template <typename T>
void band_packed_set(T* data, int Nd, int nb, int g, int b, T val) {
  data[(b / 16) * Nd * 16 + g * 16 + b % 16] = val;
}

// =============================================================================
// Reference implementation (no scaling)
// =============================================================================

template <typename T>
void compute_reference(int Nd, int nb, const T* A_grid, const T* B, T* D_band) {
  for (int g = 0; g < Nd; ++g) {
    for (int bp = 0; bp < nb; ++bp) {
      T sum = 0;
      for (int b = 0; b < nb; ++b) {
        sum += grid_packed_get(A_grid, Nd, nb, g, b) * B[b * nb + bp];
      }
      band_packed_set(D_band, Nd, nb, g, bp, sum);
    }
  }
}

// =============================================================================
// Verification
// =============================================================================

template <typename T>
bool verify(int Nd, int nb, const T* ref, const T* actual, T tol) {
  T max_err = 0;
  T max_rel_err = 0;
  int err_count = 0;

  for (int bt = 0; bt < nb / 16; ++bt) {
    for (int g = 0; g < Nd; ++g) {
      for (int b_local = 0; b_local < 16; ++b_local) {
        int idx = bt * Nd * 16 + g * 16 + b_local;
        T err = std::abs(ref[idx] - actual[idx]);
        T ref_abs = std::abs(ref[idx]) + 1e-10;
        T rel_err = err / ref_abs;

        if (err > max_err) max_err = err;
        if (rel_err > max_rel_err) max_rel_err = rel_err;

        if (rel_err > tol) {
          if (err_count < 5) {
            int b = bt * 16 + b_local;
            printf(
                "  Mismatch at g=%d, b=%d: ref=%.10f, actual=%.10f, "
                "rel_err=%.2e\n",
                g, b, (double)ref[idx], (double)actual[idx], (double)rel_err);
          }
          err_count++;
        }
      }
    }
  }

  printf("  Max abs error: %.6e, max rel error: %.6e, mismatches: %d/%d\n",
         (double)max_err, (double)max_rel_err, err_count, Nd * nb);

  return max_rel_err < tol;
}

// =============================================================================
// Test correctness
// =============================================================================

template <typename T>
bool test_correctness(int Nd, int nb) {
  printf("Correctness test: Nd=%d, nb=%d\n", Nd, nb);

  const int g_tiles = Nd / 16;
  const int b_tiles = nb / 16;

  T* A_grid = hbm_alloc<T>(g_tiles * nb * 16);
  T* B = hbm_alloc<T>(nb * nb);
  T* D_sme = hbm_alloc<T>(b_tiles * Nd * 16);
  T* D_ref = hbm_alloc<T>(b_tiles * Nd * 16);

  // Initialize A (grid-packed)
  for (int g = 0; g < Nd; ++g) {
    for (int b = 0; b < nb; ++b) {
      grid_packed_set(A_grid, Nd, nb, g, b,
                      static_cast<T>((g + 1) * 0.001 + (b + 1) * 0.01));
    }
  }

  // Initialize B (row-major)
  for (int b = 0; b < nb; ++b) {
    for (int bp = 0; bp < nb; ++bp) {
      B[b * nb + bp] = static_cast<T>((b + 1) * 0.01 + (bp + 1) * 0.001);
    }
  }

  std::memset(D_sme, 0, b_tiles * Nd * 16 * sizeof(T));
  std::memset(D_ref, 0, b_tiles * Nd * 16 * sizeof(T));

  // Reference
  compute_reference(Nd, nb, A_grid, B, D_ref);

  // SME 3D blocked
  sme_gemm_trp_3d<T>::compute(Nd, nb, A_grid, B, D_sme);

  // Verify
  bool pass = verify(Nd, nb, D_ref, D_sme, static_cast<T>(1e-9));
  printf("  Result: %s\n\n", pass ? "PASSED" : "FAILED");

  hbm_free(A_grid);
  hbm_free(B);
  hbm_free(D_sme);
  hbm_free(D_ref);

  return pass;
}

// =============================================================================
// Performance benchmark
// =============================================================================

template <typename T>
void benchmark(int Nd, int nb) {
  printf("Performance: Nd=%d, nb=%d\n", Nd, nb);

  const int g_tiles = Nd / 16;
  const int b_tiles = nb / 16;

  T* A_grid = hbm_alloc<T>(g_tiles * nb * 16);
  T* B = hbm_alloc<T>(nb * nb);
  T* D_band = hbm_alloc<T>(b_tiles * Nd * 16);

  for (int i = 0; i < g_tiles * nb * 16; ++i) A_grid[i] = static_cast<T>(0.01);
  for (int i = 0; i < nb * nb; ++i) B[i] = static_cast<T>(0.01);

  // Warmup
  for (int i = 0; i < WITERS; ++i) {
    sme_gemm_trp_3d<T>::compute(Nd, nb, A_grid, B, D_band);
  }

  // Benchmark
  auto start = std::chrono::high_resolution_clock::now();
  for (int i = 0; i < ITERS; ++i) {
    sme_gemm_trp_3d<T>::compute(Nd, nb, A_grid, B, D_band);
  }
  auto end = std::chrono::high_resolution_clock::now();

  double elapsed_ms =
      std::chrono::duration<double, std::milli>(end - start).count();
  double avg_ms = elapsed_ms / ITERS;

  double flops = 2.0 * Nd * nb * nb;
  double gflops = (flops / avg_ms) / 1e6;

  double bytes = (2.0 * Nd * nb + nb * nb) * sizeof(T);
  double gbps = (bytes / avg_ms) / 1e6;

  printf("  Time: %.3f ms, GFLOPS: %.2f, BW: %.2f GB/s\n\n", avg_ms, gflops,
         gbps);

  hbm_free(A_grid);
  hbm_free(B);
  hbm_free(D_band);
}

// =============================================================================
// Main
// =============================================================================

int main(int argc, char** argv) {
  printf("=== SME TRP GEMM with 3D Blocking ===\n");
  printf("Grid-packed input -> Band-packed output (direct, no scaling)\n");
  printf("SVL=%d, TRP_MC=%d, TRP_NC=%d, TRP_KC=%d, Threads=%d\n\n", SVL, TRP_MC,
         TRP_NC, TRP_KC, NUM_THREADS);

  omp_set_num_threads(NUM_THREADS);

  using T = double;

  // Benchmark mode: ./trp_3d_test Nd nb
  if (argc == 3) {
    int Nd = std::atoi(argv[1]);
    int nb = std::atoi(argv[2]);
    benchmark<T>(Nd, nb);
    // CSV-friendly output: TRP_MC,TRP_NC,TRP_KC,Nd,nb,time_ms,GFLOPS
    return 0;
  }

  printf("--- Correctness Tests ---\n");
  struct TestCase {
    int Nd;
    int nb;
  };
  TestCase tests[] = {
      {64, 32}, {256, 64}, {512, 128}, {1024, 256}, {2048, 128}, {4096, 128},
  };

  int passed = 0;
  int total = sizeof(tests) / sizeof(tests[0]);

  for (int t = 0; t < total; ++t) {
    if (test_correctness<T>(tests[t].Nd, tests[t].nb)) {
      passed++;
    }
  }

  printf("=== Correctness: %d/%d passed ===\n\n", passed, total);

  if (passed != total) {
    printf("STOPPING: Correctness failures\n");
    return 1;
  }

  printf("--- Performance Benchmarks ---\n");
  benchmark<T>(1024, 128);
  benchmark<T>(2048, 128);
  benchmark<T>(4096, 128);
  benchmark<T>(8192, 128);
  benchmark<T>(16384, 128);  // 64x64x64 grid

  printf("=== Done ===\n");
  return 0;
}
