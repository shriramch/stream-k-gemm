// SME GEMM Implementation
// A: column-major (M x K), B: row-major (K x N), D: row-major (M x N)
// D = alpha * A * B + gamma (beta hardcoded to 0 for now)

#include <omp.h>

#include <chrono>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <type_traits>

#include "utils.hpp"
#include "hbm_alloc.hpp"

#ifndef WITERS
#define WITERS 1
#endif

#ifndef ITERS
#define ITERS 1
#endif

#ifndef NUM_THREADS
#define NUM_THREADS 38
#endif

// Define SKIP_VERIFY to disable naive kernel and verification
// #define SKIP_VERIFY

// =============================================================================
// GEMM class: D = alpha * A * B + gamma (beta=0 hardcoded)
// A: column-major (M x K), B: row-major (K x N), D: row-major (M x N)
// Uses all 8 ZA tiles for f64: ZA_TILE_M = 2*SVCNT, ZA_TILE_N = 4*SVCNT
// =============================================================================

template <typename T>
class gemm {
 public:
  static constexpr int SVCNT = SVL / sizeof(T);
  // For f64: 2 rows x 4 cols = 8 tiles
  static constexpr int ZA_TILE_M = 2 * SVCNT;  // 2 vectors of A
  static constexpr int ZA_TILE_N = 4 * SVCNT;  // 4 vectors of B

  using vec_t = svfloat64_t;
  using pred_t = svbool_t;

  // =========================================================================
  // Thread-local tile computation kernel (has ZA state)
  // Each thread calls this, spinning up its OWN ZA array and streaming mode.
  // =========================================================================
  static __forceinline void compute_tile_inner(
      const int M, const int N, const int K, const int tm, const int tiles_n,
      const T* __restrict__ ptr_a, const T* __restrict__ ptr_b,
      T* __restrict__ ptr_d, const T alpha, const T gamma,
      const pred_t ptrue) __arm_streaming
#ifndef __arm_sim
      __arm_inout("za")
#endif
  {
    for (int tn = 0; tn < tiles_n; ++tn) {
      // Running pointers for A and B
      const T* a_ptr = ptr_a + tm * ZA_TILE_M;
      const T* b_ptr = ptr_b + tn * ZA_TILE_N;

      // Zero all ZA tiles
      svzero_za();

      // K loop with running pointers
#pragma unroll 4
      for (int k = 0; k < K; ++k) {
        // Load 2 vectors from A column
        vec_t a0 = svld1_vnum(ptrue, a_ptr, 0);
        vec_t a1 = svld1_vnum(ptrue, a_ptr, 1);

        // Load 4 vectors from B row
        vec_t b0 = svld1_vnum(ptrue, b_ptr, 0);
        vec_t b1 = svld1_vnum(ptrue, b_ptr, 1);
        vec_t b2 = svld1_vnum(ptrue, b_ptr, 2);
        vec_t b3 = svld1_vnum(ptrue, b_ptr, 3);

        // 8 outer products
        svmopa_za64_f64_m(0, ptrue, ptrue, a0, b0);
        svmopa_za64_f64_m(1, ptrue, ptrue, a0, b1);
        svmopa_za64_f64_m(2, ptrue, ptrue, a0, b2);
        svmopa_za64_f64_m(3, ptrue, ptrue, a0, b3);
        svmopa_za64_f64_m(4, ptrue, ptrue, a1, b0);
        svmopa_za64_f64_m(5, ptrue, ptrue, a1, b1);
        svmopa_za64_f64_m(6, ptrue, ptrue, a1, b2);
        svmopa_za64_f64_m(7, ptrue, ptrue, a1, b3);

        a_ptr += M;
        b_ptr += N;
      }

      // Output tile base - use running pointer
      T* d_ptr = ptr_d + tm * ZA_TILE_M * N + tn * ZA_TILE_N;

      // Store first row block (tiles 0-3)
      for (int i = 0; i < SVCNT; ++i) {
        vec_t r0, r1, r2, r3;
        r0 = svread_hor_za64_f64_m(r0, ptrue, 0, i);
        r1 = svread_hor_za64_f64_m(r1, ptrue, 1, i);
        r2 = svread_hor_za64_f64_m(r2, ptrue, 2, i);
        r3 = svread_hor_za64_f64_m(r3, ptrue, 3, i);
        r0 = svadd_z(ptrue, svmulx_z(ptrue, r0, alpha), gamma);
        r1 = svadd_z(ptrue, svmulx_z(ptrue, r1, alpha), gamma);
        r2 = svadd_z(ptrue, svmulx_z(ptrue, r2, alpha), gamma);
        r3 = svadd_z(ptrue, svmulx_z(ptrue, r3, alpha), gamma);
        svst1_vnum(ptrue, d_ptr, 0, r0);
        svst1_vnum(ptrue, d_ptr, 1, r1);
        svst1_vnum(ptrue, d_ptr, 2, r2);
        svst1_vnum(ptrue, d_ptr, 3, r3);
        d_ptr += N;
      }

      // Store second row block (tiles 4-7)
      for (int i = 0; i < SVCNT; ++i) {
        vec_t r0, r1, r2, r3;
        r0 = svread_hor_za64_f64_m(r0, ptrue, 4, i);
        r1 = svread_hor_za64_f64_m(r1, ptrue, 5, i);
        r2 = svread_hor_za64_f64_m(r2, ptrue, 6, i);
        r3 = svread_hor_za64_f64_m(r3, ptrue, 7, i);
        r0 = svadd_z(ptrue, svmulx_z(ptrue, r0, alpha), gamma);
        r1 = svadd_z(ptrue, svmulx_z(ptrue, r1, alpha), gamma);
        r2 = svadd_z(ptrue, svmulx_z(ptrue, r2, alpha), gamma);
        r3 = svadd_z(ptrue, svmulx_z(ptrue, r3, alpha), gamma);
        svst1_vnum(ptrue, d_ptr, 0, r0);
        svst1_vnum(ptrue, d_ptr, 1, r1);
        svst1_vnum(ptrue, d_ptr, 2, r2);
        svst1_vnum(ptrue, d_ptr, 3, r3);
        d_ptr += N;
      }
    }
  }

  // =========================================================================
  // Thread-local wrapper: creates ZA and enables streaming mode
  // =========================================================================
#ifndef __arm_sim
  __arm_new("za")
#endif
      __arm_locally_streaming static void compute_thread_block(
          const int M, const int N, const int K, const int tm,
          const int tiles_n, const T* __restrict__ ptr_a,
          const T* __restrict__ ptr_b, T* __restrict__ ptr_d, const T alpha,
          const T gamma) {
    pred_t ptrue = svptrue_b64();
    compute_tile_inner(M, N, K, tm, tiles_n, ptr_a, ptr_b, ptr_d, alpha, gamma,
                       ptrue);
  }

  // =========================================================================
  // Main GEMM (NO SME attributes here - handles OpenMP threading)
  // =========================================================================
  static void compute(int M, int N, int K, const T* __restrict__ ptr_a,
                      const T* __restrict__ ptr_b, T* __restrict__ ptr_d,
                      T alpha, T gamma) {
    const int tiles_m = M / ZA_TILE_M;
    const int tiles_n = N / ZA_TILE_N;

#pragma omp parallel for
    for (int tm = 0; tm < tiles_m; ++tm) {
      compute_thread_block(M, N, K, tm, tiles_n, ptr_a, ptr_b, ptr_d, alpha,
                           gamma);
    }
  }

  // Test wrapper (NO SME attributes)
  static void compute_test(int M, int N, int K, const T* __restrict__ ptr_a,
                           const T* __restrict__ ptr_b, T* __restrict__ ptr_d,
                           T alpha, T gamma) {
    compute(M, N, K, ptr_a, ptr_b, ptr_d, alpha, gamma);
  }

  // Benchmark wrapper (NO SME attributes)
  static double compute_benchmark(int M, int N, int K, const T* ptr_a,
                                  const T* ptr_b, T* ptr_d, T alpha, T gamma) {
    for (int it = 0; it < WITERS; ++it) {
      compute(M, N, K, ptr_a, ptr_b, ptr_d, alpha, gamma);
    }
    auto t0 = std::chrono::high_resolution_clock::now();
    for (int it = 0; it < ITERS; ++it) {
      compute(M, N, K, ptr_a, ptr_b, ptr_d, alpha, gamma);
    }
    auto t1 = std::chrono::high_resolution_clock::now();
    return std::chrono::duration<double, std::nano>(t1 - t0).count();
  }
};

// =============================================================================
// Naive reference GEMM for verification
// =============================================================================

template <typename T>
void naive_gemm(int M, int N, int K, const T* __restrict__ ptr_a,
                const T* __restrict__ ptr_b, T* __restrict__ ptr_d, T alpha,
                T gamma) {
  for (int i = 0; i < M; ++i) {
    for (int j = 0; j < N; ++j) {
      T sum = T(0);
      for (int k = 0; k < K; ++k) {
        // A column-major: A[i,k] = ptr_a[k*M + i]
        // B row-major: B[k,j] = ptr_b[k*N + j]
        T a_val = ptr_a[k * M + i];
        T b_val = ptr_b[k * N + j];
        sum += a_val * b_val;
      }
      ptr_d[i * N + j] = alpha * sum + gamma;
    }
  }
}

// =============================================================================
// Test harness
// =============================================================================

template <typename T>
bool test_gemm(int M, int N, int K, T alpha, T gamma) {
  printf("Testing GEMM<%s>: M=%d N=%d K=%d alpha=%.2f gamma=%.2f\n",
         std::is_same_v<T, float> ? "float" : "double", M, N, K, (double)alpha,
         (double)gamma);

  omp_set_num_threads(NUM_THREADS);

  // Allocate matrices
  T* A = hbm_alloc<T>(M * K);
  T* B = hbm_alloc<T>(K * N);
  T* D = hbm_alloc<T>(M * N);

  // Initialize A (column-major), B (row-major), D
  for (int k = 0; k < K; ++k) {
    for (int i = 0; i < M; ++i) {
      A[k * M + i] = static_cast<T>((i + 1) * 0.01 + (k + 1) * 0.001);
    }
  }
  for (int k = 0; k < K; ++k) {
    for (int j = 0; j < N; ++j) {
      B[k * N + j] = static_cast<T>((k + 1) * 0.01 + (j + 1) * 0.001);
    }
  }
  for (int i = 0; i < M; ++i) {
    for (int j = 0; j < N; ++j) {
      D[i * N + j] = static_cast<T>(0.0);
    }
  }

  // Run SME GEMM (via compute_test wrapper)
  gemm<T>::compute_test(M, N, K, A, B, D, alpha, gamma);

#ifdef SKIP_VERIFY
  printf("  SKIPPED verification (SKIP_VERIFY defined)\n");
  hbm_free(A);
  hbm_free(B);
  hbm_free(D);
  return true;
#else
  // Reference
  T* D_ref = hbm_alloc<T>(M * N);
  for (int i = 0; i < M * N; ++i) D_ref[i] = static_cast<T>(0.0);
  naive_gemm<T>(M, N, K, A, B, D_ref, alpha, gamma);

  // Verify
  bool passed = true;
  T max_err = T(0);
  int err_idx = -1;
  for (int i = 0; i < M * N; ++i) {
    T err = (D[i] > D_ref[i]) ? (D[i] - D_ref[i]) : (D_ref[i] - D[i]);
    T rel = (D_ref[i] != T(0)) ? err / ((D_ref[i] > 0) ? D_ref[i] : -D_ref[i])
                               : err;
    if (rel > T(1e-4)) {
      if (err > max_err) {
        max_err = err;
        err_idx = i;
      }
      passed = false;
    }
  }

  if (passed) {
    printf("  PASSED!\n");
  } else {
    printf("  FAILED! max_err=%.6e at idx=%d (got=%.6f ref=%.6f)\n",
           (double)max_err, err_idx, (double)D[err_idx],
           (double)D_ref[err_idx]);
  }

  hbm_free(A);
  hbm_free(B);
  hbm_free(D);
  hbm_free(D_ref);

  return passed;
#endif
}

template <typename T>
void benchmark_gemm(int M, int N, int K, T alpha, T gamma) {
  printf("Benchmarking GEMM<%s>: M=%d N=%d K=%d, threads=%d\n",
         std::is_same_v<T, float> ? "float" : "double", M, N, K, NUM_THREADS);

  omp_set_num_threads(NUM_THREADS);

  // Each thread gets its own A, B, D (for now, simple parallel over outputs)
  T* A = hbm_alloc<T>(M * K);
  T* B = hbm_alloc<T>(K * N);
  T* D = hbm_alloc<T>(M * N);

  for (int i = 0; i < M * K; ++i) A[i] = static_cast<T>(i * 0.0001);
  for (int i = 0; i < K * N; ++i) B[i] = static_cast<T>(i * 0.0001);
  for (int i = 0; i < M * N; ++i) D[i] = T(0);

  // Timed runs
  double total_ns = gemm<T>::compute_benchmark(M, N, K, A, B, D, alpha, gamma);

  // Average across threads and iterations
  double avg_ns = total_ns / ITERS;
  double flops = 2.0 * M * N * K;
  double gflops = flops / avg_ns;

  printf("  avg=%.3f ns, %.2f gflop/s\n", avg_ns, gflops);
  printf("  throughput per thread: %.2f gflop/s\n", gflops / NUM_THREADS);

  hbm_free(A);
  hbm_free(B);
  hbm_free(D);
}

int main(int argc, char** argv) {
  hbm_init();
  printf("SME GEMM Test - SVL=%d bytes, SVCNT=%d, ZA_TILE_M=%d, ZA_TILE_N=%d\n",
         SVL, gemm<TYPE>::SVCNT, gemm<TYPE>::ZA_TILE_M, gemm<TYPE>::ZA_TILE_N);

  // Default: M/N must be multiples of ZA_TILE_M/ZA_TILE_N
  int M = gemm<TYPE>::ZA_TILE_M;   // 16 for SVL=64 (2*8)
  int N = gemm<TYPE>::ZA_TILE_N;   // 32 (4*8)
  int K = gemm<TYPE>::SVCNT * 16;  // Large K

  if (argc >= 4) {
    M = atoi(argv[1]);
    N = atoi(argv[2]);
    K = atoi(argv[3]);
  }

  printf("\n=== Testing with M=%d N=%d K=%d ===\n", M, N, K);

  bool ok_f64 = test_gemm<TYPE>(M, N, K, 1.0, 0.0);

  printf("\n=== Additional tests with scaling ===\n");
  bool ok_scale_f64 = test_gemm<TYPE>(M, N, K, 2.0, 0.1);

  printf("\n=== Benchmarks ===\n");
  benchmark_gemm<TYPE>(M, N, K, 1.0, 0.0);

  int total_passed = (ok_f64 ? 1 : 0) + (ok_scale_f64 ? 1 : 0);
  printf("\n=== Summary: %d/2 tests passed ===\n", total_passed);

  return (total_passed == 2) ? 0 : 1;
}
