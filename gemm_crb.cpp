// SME GEMM Implementation with Cache Blocking
// A: column-major (M x K), B: row-major (K x N), D: row-major (M x N)
// D = alpha * A * B + gamma
//
// Cache blocking strategy (L2 shared by 2 cores):
//   KC = 2048 (K block) → 128 C partial writes for K=262144
//   NC = 64   (N block, 2 micro-tiles)
//   MC = 16   (implicit, 1 micro-tile)
//
// Loop order: kc → nc → tm (parallel) → tn_local
// B panel [KC, NC] = 1024KB shared in L2
// A panel [MC, KC] = 256KB per core

#include <omp.h>

#include <chrono>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <type_traits>

#include "utils.hpp"

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
// Cache blocking parameters
// =============================================================================
constexpr int KC = 2048;  // K block size (L2 level)
constexpr int NC = 64;    // N block size (2 micro-tiles)

// =============================================================================
// GEMM class with cache blocking
// =============================================================================

template <typename T>
class gemm {
 public:
  static constexpr int SVCNT = SVL / sizeof(T);
  static constexpr int ZA_TILE_M = 2 * SVCNT;  // 16 for f64
  static constexpr int ZA_TILE_N = 4 * SVCNT;  // 32 for f64

  using vec_t = svfloat64_t;
  using pred_t = svbool_t;

  // =========================================================================
  // Micro-kernel: compute one 16x32 tile for k_len iterations
  // Accumulates into ZA (caller must zero or load partial C first)
  // =========================================================================
  static __forceinline void microkernel(const int M, const int N,
                                        const int k_len,
                                        const T* __restrict__ a_ptr,
                                        const T* __restrict__ b_ptr,
                                        const pred_t ptrue) __arm_streaming
#ifndef __arm_sim
      __arm_inout("za")
#endif
  {
    // #pragma unroll 4
    for (int k = 0; k < k_len; ++k) {
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
  }

  // =========================================================================
  // Load partial C tile into ZA (for accumulation across K blocks)
  // =========================================================================
  static __forceinline void load_partial_c(const int N,
                                           const T* __restrict__ c_ptr,
                                           const pred_t ptrue) __arm_streaming
#ifndef __arm_sim
      __arm_inout("za")
#endif
  {
    // Load first row block (tiles 0-3)
    for (int i = 0; i < SVCNT; ++i) {
      vec_t r0 = svld1_vnum(ptrue, c_ptr, 0);
      vec_t r1 = svld1_vnum(ptrue, c_ptr, 1);
      vec_t r2 = svld1_vnum(ptrue, c_ptr, 2);
      vec_t r3 = svld1_vnum(ptrue, c_ptr, 3);
      svwrite_hor_za64_f64_m(0, i, ptrue, r0);
      svwrite_hor_za64_f64_m(1, i, ptrue, r1);
      svwrite_hor_za64_f64_m(2, i, ptrue, r2);
      svwrite_hor_za64_f64_m(3, i, ptrue, r3);
      c_ptr += N;
    }

    // Load second row block (tiles 4-7)
    for (int i = 0; i < SVCNT; ++i) {
      vec_t r0 = svld1_vnum(ptrue, c_ptr, 0);
      vec_t r1 = svld1_vnum(ptrue, c_ptr, 1);
      vec_t r2 = svld1_vnum(ptrue, c_ptr, 2);
      vec_t r3 = svld1_vnum(ptrue, c_ptr, 3);
      svwrite_hor_za64_f64_m(4, i, ptrue, r0);
      svwrite_hor_za64_f64_m(5, i, ptrue, r1);
      svwrite_hor_za64_f64_m(6, i, ptrue, r2);
      svwrite_hor_za64_f64_m(7, i, ptrue, r3);
      c_ptr += N;
    }
  }

  // =========================================================================
  // Store partial C tile (no scaling, just raw accumulator)
  // =========================================================================
  static __forceinline void store_partial_c(const int N, T* __restrict__ c_ptr,
                                            const pred_t ptrue) __arm_streaming
#ifndef __arm_sim
      __arm_inout("za")
#endif
  {
    // Store first row block
    for (int i = 0; i < SVCNT; ++i) {
      vec_t r0, r1, r2, r3;
      r0 = svread_hor_za64_f64_m(r0, ptrue, 0, i);
      r1 = svread_hor_za64_f64_m(r1, ptrue, 1, i);
      r2 = svread_hor_za64_f64_m(r2, ptrue, 2, i);
      r3 = svread_hor_za64_f64_m(r3, ptrue, 3, i);
      svst1_vnum(ptrue, c_ptr, 0, r0);
      svst1_vnum(ptrue, c_ptr, 1, r1);
      svst1_vnum(ptrue, c_ptr, 2, r2);
      svst1_vnum(ptrue, c_ptr, 3, r3);
      c_ptr += N;
    }

    // Store second row block
    for (int i = 0; i < SVCNT; ++i) {
      vec_t r0, r1, r2, r3;
      r0 = svread_hor_za64_f64_m(r0, ptrue, 4, i);
      r1 = svread_hor_za64_f64_m(r1, ptrue, 5, i);
      r2 = svread_hor_za64_f64_m(r2, ptrue, 6, i);
      r3 = svread_hor_za64_f64_m(r3, ptrue, 7, i);
      svst1_vnum(ptrue, c_ptr, 0, r0);
      svst1_vnum(ptrue, c_ptr, 1, r1);
      svst1_vnum(ptrue, c_ptr, 2, r2);
      svst1_vnum(ptrue, c_ptr, 3, r3);
      c_ptr += N;
    }
  }

  // =========================================================================
  // Store final C tile with scaling: D = alpha * ZA + gamma
  // =========================================================================
  static __forceinline void store_final_c(const int N, T* __restrict__ c_ptr,
                                          const T alpha, const T gamma,
                                          const pred_t ptrue) __arm_streaming
#ifndef __arm_sim
      __arm_inout("za")
#endif
  {
    // Store first row block
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
      svst1_vnum(ptrue, c_ptr, 0, r0);
      svst1_vnum(ptrue, c_ptr, 1, r1);
      svst1_vnum(ptrue, c_ptr, 2, r2);
      svst1_vnum(ptrue, c_ptr, 3, r3);
      c_ptr += N;
    }

    // Store second row block
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
      svst1_vnum(ptrue, c_ptr, 0, r0);
      svst1_vnum(ptrue, c_ptr, 1, r1);
      svst1_vnum(ptrue, c_ptr, 2, r2);
      svst1_vnum(ptrue, c_ptr, 3, r3);
      c_ptr += N;
    }
  }

  // =========================================================================
  // Thread-local execution: processes ALL kc/nc for this thread's M tile
  // Only ONE smstart/smstop per thread per GEMM call
  // =========================================================================
  static __forceinline void compute_all_tiles_for_tm(
      const int M, const int N, const int K, const int tiles_n, const int tm,
      const T* __restrict__ ptr_a, const T* __restrict__ ptr_b,
      T* __restrict__ ptr_d, const T alpha, const T gamma,
      const pred_t ptrue) __arm_streaming
#ifndef __arm_sim
      __arm_inout("za")
#endif
  {
    constexpr int nc_tiles = NC / ZA_TILE_N;

    for (int kc = 0; kc < K; kc += KC) {
      const int k_len = (kc + KC <= K) ? KC : (K - kc);
      const bool is_first = (kc == 0);
      const bool is_last = (kc + KC >= K);

      for (int nc = 0; nc < tiles_n; nc += nc_tiles) {
        const int tn_end =
            (nc + nc_tiles <= tiles_n) ? nc_tiles : (tiles_n - nc);

        for (int tn_local = 0; tn_local < tn_end; ++tn_local) {
          const int tn = nc + tn_local;

          const T* a_ptr = ptr_a + tm * ZA_TILE_M + kc * M;
          const T* b_ptr = ptr_b + tn * ZA_TILE_N + kc * N;
          T* c_ptr = ptr_d + tm * ZA_TILE_M * N + tn * ZA_TILE_N;

          if (is_first) {
            svzero_za();
          } else {
            load_partial_c(N, c_ptr, ptrue);
          }

          microkernel(M, N, k_len, a_ptr, b_ptr, ptrue);

          if (is_last) {
            store_final_c(N, c_ptr, alpha, gamma, ptrue);
          } else {
            store_partial_c(N, c_ptr, ptrue);
          }
        }
      }
    }
  }

  // =========================================================================
  // Thread-local wrapper: creates ZA ONCE and enables streaming mode ONCE
  // =========================================================================
#ifndef __arm_sim
  __arm_new("za")
#endif
      __arm_locally_streaming static void compute_thread_block(
          const int M, const int N, const int K, const int tiles_n,
          const int tm, const T* __restrict__ ptr_a,
          const T* __restrict__ ptr_b, T* __restrict__ ptr_d, const T alpha,
          const T gamma) {
    pred_t ptrue = svptrue_b64();
    compute_all_tiles_for_tm(M, N, K, tiles_n, tm, ptr_a, ptr_b, ptr_d, alpha,
                             gamma, ptrue);
  }

  // =========================================================================
  // Main GEMM with cache blocking (NO SME attributes here)
  // =========================================================================
  static void compute(const int M, const int N, const int K,
                      const T* __restrict__ ptr_a, const T* __restrict__ ptr_b,
                      T* __restrict__ ptr_d, const T alpha, const T gamma) {
    const int tiles_m = M / ZA_TILE_M;
    const int tiles_n = N / ZA_TILE_N;

    // Each thread handles ALL kc/nc for its assigned M tile
#pragma omp parallel for
    for (int tm = 0; tm < tiles_m; ++tm) {
      compute_thread_block(M, N, K, tiles_n, tm, ptr_a, ptr_b, ptr_d, alpha,
                           gamma);
    }
  }

  // Test wrapper (NO SME attributes)
  static void compute_test(const int M, const int N, const int K,
                           const T* __restrict__ ptr_a,
                           const T* __restrict__ ptr_b, T* __restrict__ ptr_d,
                           const T alpha, const T gamma) {
    compute(M, N, K, ptr_a, ptr_b, ptr_d, alpha, gamma);
  }

  // Benchmark wrapper (NO SME attributes)
  static double compute_benchmark(const int M, const int N, const int K,
                                  const T* __restrict__ ptr_a,
                                  const T* __restrict__ ptr_b,
                                  T* __restrict__ ptr_d, const T alpha,
                                  const T gamma) {
    // Warmup
    for (int i = 0; i < WITERS; ++i) {
      compute(M, N, K, ptr_a, ptr_b, ptr_d, alpha, gamma);
    }

    // Timed run
    auto start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < ITERS; ++i) {
      compute(M, N, K, ptr_a, ptr_b, ptr_d, alpha, gamma);
    }
    auto end = std::chrono::high_resolution_clock::now();

    return std::chrono::duration<double, std::nano>(end - start).count() /
           ITERS;
  }
};

// =============================================================================
// Test harness
// =============================================================================

template <typename T>
bool test_gemm(int M, int N, int K, T alpha, T gamma) {
  const char* type_name = std::is_same<T, float>::value ? "float" : "double";
  printf("Testing GEMM<%s>: M=%d N=%d K=%d alpha=%.2f gamma=%.2f KC=%d NC=%d\n",
         type_name, M, N, K, alpha, gamma, KC, NC);

  omp_set_num_threads(NUM_THREADS);

  // Allocate matrices
  T* A = new T[M * K];  // column-major
  T* B = new T[K * N];  // row-major
  T* D = new T[M * N];  // row-major (output)

  // Initialize
  for (int j = 0; j < K; ++j) {
    for (int i = 0; i < M; ++i) {
      A[i + j * M] = static_cast<T>((i + 1) * 0.01 + (j + 1) * 0.001);
    }
  }
  for (int i = 0; i < K; ++i) {
    for (int j = 0; j < N; ++j) {
      B[i * N + j] = static_cast<T>((i + 1) * 0.001 + (j + 1) * 0.01);
    }
  }
  std::memset(D, 0, M * N * sizeof(T));

  // SME computation
  gemm<T>::compute_test(M, N, K, A, B, D, alpha, gamma);

#ifdef SKIP_VERIFY
  printf("  SKIPPED verification (SKIP_VERIFY defined)\n");
  delete[] A;
  delete[] B;
  delete[] D;
  return true;
#else
  // Reference computation
  T* D_ref = new T[M * N];
  std::memset(D_ref, 0, M * N * sizeof(T));
  for (int i = 0; i < M; ++i) {
    for (int j = 0; j < N; ++j) {
      T sum = 0;
      for (int k = 0; k < K; ++k) {
        sum += A[i + k * M] * B[k * N + j];
      }
      D_ref[i * N + j] = alpha * sum + gamma;
    }
  }

  // Verify
  bool pass = true;
  T max_err = 0;
  for (int i = 0; i < M * N; ++i) {
    T err = std::abs(D[i] - D_ref[i]);
    T rel_err = err / (std::abs(D_ref[i]) + 1e-10);
    if (rel_err > max_err) max_err = rel_err;
    if (rel_err > 1e-6) {
      if (pass) {
        printf("  MISMATCH at %d: got %.10f, expected %.10f (rel_err=%.2e)\n",
               i, D[i], D_ref[i], rel_err);
      }
      pass = false;
    }
  }

  if (pass) {
    printf("  PASSED! (max_rel_err=%.2e)\n", max_err);
  } else {
    printf("  FAILED! (max_rel_err=%.2e)\n", max_err);
  }

  delete[] A;
  delete[] B;
  delete[] D;
  delete[] D_ref;

  return pass;
#endif
}

int main(int argc, char** argv) {
  printf("SME GEMM with Cache Blocking\n");
  printf("SVL=%d bytes, SVCNT=%d\n", SVL, gemm<double>::SVCNT);
  printf("ZA_TILE_M=%d, ZA_TILE_N=%d\n", gemm<double>::ZA_TILE_M,
         gemm<double>::ZA_TILE_N);
  printf("KC=%d, NC=%d\n", KC, NC);
  printf("Threads=%d\n\n", NUM_THREADS);

  int passed = 0, total = 0;

  // Test 1: Small, single K block (K < KC)
  printf("=== Test 1: Small K (single K block) ===\n");
  if (test_gemm<double>(32, 64, 128, 1.0, 0.0)) passed++;
  total++;

  // Test 2: K requires multiple blocks
  printf("\n=== Test 2: K spanning multiple blocks ===\n");
  if (test_gemm<double>(32, 64, 4096, 1.0, 0.0)) passed++;
  total++;

  // Test 3: With scaling
  printf("\n=== Test 3: With alpha and gamma ===\n");
  if (test_gemm<double>(32, 64, 4096, 2.0, 0.5)) passed++;
  total++;

  // Test 4: Larger M, N
  printf("\n=== Test 4: Larger M, N ===\n");
  if (test_gemm<double>(64, 128, 2048, 1.0, 0.0)) passed++;
  total++;

  printf("\n=== Summary: %d/%d tests passed ===\n", passed, total);

  // Benchmark
  printf("\n=== Benchmark ===\n");
  {
    const int M = 64, N = 128, K = 4096;
    if (argc == 4) {
      M = std::atoi(argv[1]);
      N = std::atoi(argv[2]);
      K = std::atoi(argv[3]);
    }
    double* A = new double[M * K];
    double* B = new double[K * N];
    double* D = new double[M * N];
    std::memset(A, 0, M * K * sizeof(double));
    std::memset(B, 0, K * N * sizeof(double));
    std::memset(D, 0, M * N * sizeof(double));

    printf("Benchmarking M=%d N=%d K=%d (K blocks=%d)\n", M, N, K,
           (K + KC - 1) / KC);

    omp_set_num_threads(NUM_THREADS);
    double ns = gemm<double>::compute_benchmark(M, N, K, A, B, D, 1.0, 0.0);
    double gflops = (2.0 * M * N * K) / ns;
    printf("  Time: %.2f ns, %.2f gflop/s\n", ns, gflops);

    delete[] A;
    delete[] B;
    delete[] D;
  }

  return (passed == total) ? 0 : 1;
}
