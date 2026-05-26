// Test for SME TRP GEMM with cache blocking
// Grid-packed input → Band-packed output (direct, no conversions)

#include <omp.h>

#include <chrono>
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "include/hbm_alloc.hpp"
#include "include/sme_trp_blocked.hpp"

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
// Pack/Unpack utilities for testing
// =============================================================================

// Band-packed: [nb/16, K, 16] - 16 bands contiguous per grid
// Access: Psi[b, g] = data[(b/16) * K * 16 + g * 16 + b % 16]
template <typename T>
T band_packed_get(const T* data, int K, int nb, int g, int b) {
  return data[(b / 16) * K * 16 + g * 16 + b % 16];
}

template <typename T>
void band_packed_set(T* data, int K, int nb, int g, int b, T val) {
  data[(b / 16) * K * 16 + g * 16 + b % 16] = val;
}

// Grid-packed: [K/16, nb, 16] - 16 grids contiguous per band
// Access: Psi[g, b] = data[(g/16) * nb * 16 + b * 16 + g % 16]
template <typename T>
T grid_packed_get(const T* data, int K, int nb, int g, int b) {
  return data[(g / 16) * nb * 16 + b * 16 + g % 16];
}

template <typename T>
void grid_packed_set(T* data, int K, int nb, int g, int b, T val) {
  data[(g / 16) * nb * 16 + b * 16 + g % 16] = val;
}

// =============================================================================
// Reference implementation
// =============================================================================

template <typename T>
void compute_reference(int K, int nb,
                       const T* A_grid,  // grid-packed [K/16, nb, 16]
                       const T* B,       // row-major [nb, nb]
                       T* D_band,        // band-packed [nb/16, K, 16]
                       T alpha, T gamma) {
  // D[g, bp] = alpha * sum_b(A[g, b] * B[b, bp]) + gamma
  for (int g = 0; g < K; ++g) {
    for (int bp = 0; bp < nb; ++bp) {
      T sum = 0;
      for (int b = 0; b < nb; ++b) {
        T a_val = grid_packed_get(A_grid, K, nb, g, b);
        T b_val = B[b * nb + bp];
        sum += a_val * b_val;
      }
      band_packed_set(D_band, K, nb, g, bp, alpha * sum + gamma);
    }
  }
}

// =============================================================================
// Verification
// =============================================================================

template <typename T>
bool verify(int K, int nb, const T* ref, const T* actual, T tol) {
  T max_err = 0;
  T max_rel_err = 0;
  int err_count = 0;

  for (int bt = 0; bt < nb / 16; ++bt) {
    for (int g = 0; g < K; ++g) {
      for (int b_local = 0; b_local < 16; ++b_local) {
        int idx = bt * K * 16 + g * 16 + b_local;
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
         (double)max_err, (double)max_rel_err, err_count, K * nb);

  return max_rel_err < tol;
}

// =============================================================================
// Test correctness
// =============================================================================

template <typename T>
bool test_correctness(int K, int nb, T alpha, T gamma) {
  printf("Correctness test: K=%d, nb=%d, alpha=%.2f, gamma=%.2f\n", K, nb,
         (double)alpha, (double)gamma);

  const int g_tiles = K / 16;
  const int b_tiles = nb / 16;

  T* A_grid = hbm_alloc<T>(g_tiles * nb * 16);
  T* B = hbm_alloc<T>(nb * nb);
  T* D_sme = hbm_alloc<T>(b_tiles * K * 16);
  T* D_ref = hbm_alloc<T>(b_tiles * K * 16);

  // Initialize A (grid-packed): A[g, b] = (g+1)*0.001 + (b+1)*0.01
  for (int g = 0; g < K; ++g) {
    for (int b = 0; b < nb; ++b) {
      grid_packed_set(A_grid, K, nb, g, b,
                      static_cast<T>((g + 1) * 0.001 + (b + 1) * 0.01));
    }
  }

  // Initialize B (row-major): B[b, bp] = (b+1)*0.01 + (bp+1)*0.001
  for (int b = 0; b < nb; ++b) {
    for (int bp = 0; bp < nb; ++bp) {
      B[b * nb + bp] = static_cast<T>((b + 1) * 0.01 + (bp + 1) * 0.001);
    }
  }

  std::memset(D_sme, 0, b_tiles * K * 16 * sizeof(T));
  std::memset(D_ref, 0, b_tiles * K * 16 * sizeof(T));

  // Reference
  compute_reference(K, nb, A_grid, B, D_ref, alpha, gamma);

  // SME blocked
  sme_gemm_trp_blocked<T>::compute(K, nb, A_grid, B, D_sme, alpha, gamma);

  // Verify
  bool pass = verify(K, nb, D_ref, D_sme, static_cast<T>(1e-9));
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
void benchmark(int K, int nb, T alpha, T gamma) {
  printf("Performance: K=%d, nb=%d\n", K, nb);

  const int g_tiles = K / 16;
  const int b_tiles = nb / 16;

  T* A_grid = hbm_alloc<T>(g_tiles * nb * 16);
  T* B = hbm_alloc<T>(nb * nb);
  T* D_band = hbm_alloc<T>(b_tiles * K * 16);

  // Initialize
  for (int i = 0; i < g_tiles * nb * 16; ++i) A_grid[i] = static_cast<T>(0.01);
  for (int i = 0; i < nb * nb; ++i) B[i] = static_cast<T>(0.01);

  // Warmup
  for (int i = 0; i < WITERS; ++i) {
    sme_gemm_trp_blocked<T>::compute(K, nb, A_grid, B, D_band, alpha, gamma);
  }

  // Benchmark
  auto start = std::chrono::high_resolution_clock::now();
  for (int i = 0; i < ITERS; ++i) {
    sme_gemm_trp_blocked<T>::compute(K, nb, A_grid, B, D_band, alpha, gamma);
  }
  auto end = std::chrono::high_resolution_clock::now();

  double elapsed_ms =
      std::chrono::duration<double, std::milli>(end - start).count();
  double avg_ms = elapsed_ms / ITERS;

  // FLOPs: K * nb * nb * 2 (mul + add per element)
  double flops = 2.0 * K * nb * nb;
  double gflops = (flops / avg_ms) / 1e6;

  // Bandwidth: read A (K*nb), read B (nb*nb), write D (K*nb)
  double bytes = (2.0 * K * nb + nb * nb) * sizeof(T);
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

int main() {
  printf("=== SME TRP GEMM with Cache Blocking ===\n");
  printf("Grid-packed input -> Band-packed output (direct)\n");
  printf("SVL=%d, K_BLOCK=%d, Threads=%d\n\n", SVL, K_BLOCK, NUM_THREADS);

  omp_set_num_threads(NUM_THREADS);

  using T = double;

  // Correctness tests
  printf("--- Correctness Tests ---\n");
  struct TestCase {
    int K;
    int nb;
  };

  TestCase tests[] = {
      {64, 32},     // Small
      {256, 64},    // Medium
      {512, 128},   // Large
      {1024, 256},  // XL
      {2048, 128},  // Wide K
  };

  int passed = 0;
  int total = sizeof(tests) / sizeof(tests[0]);

  for (int t = 0; t < total; ++t) {
    if (test_correctness<T>(tests[t].K, tests[t].nb, 1.0, 0.0)) {
      passed++;
    }
  }

  // Test with alpha/gamma
  if (test_correctness<T>(512, 128, 2.5, 0.1)) {
    passed++;
  }
  total++;

  printf("=== Correctness: %d/%d passed ===\n\n", passed, total);

  if (passed != total) {
    printf("STOPPING: Correctness failures detected\n");
    return 1;
  }

  // Performance tests
  printf("--- Performance Benchmarks ---\n");
  benchmark<T>(1024, 128, 1.0, 0.0);
  benchmark<T>(2048, 128, 1.0, 0.0);
  benchmark<T>(4096, 128, 1.0, 0.0);
  benchmark<T>(8192, 128, 1.0, 0.0);
  benchmark<T>(16384, 128, 1.0, 0.0);  // 64x64x64 grid, 128 bands

  printf("=== Done ===\n");
  return 0;
}
