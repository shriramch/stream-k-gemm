// SME GEMM with Stream-K Parallelization (Packed Input)
// Stream-K: Split K across threads, each thread computes partial C
// Final reduction combines all partial sums
//
// Key advantage: Each thread loads its K-slice of A and B exactly once
// Eliminates bandwidth multiplication from spatial partitioning
//
// D = alpha * A * B + gamma

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

// =============================================================================
// Stream-K parameters
// =============================================================================
constexpr int KC = 2048;     // K block size for cache blocking within K-slice
constexpr int PF_DIST = 16;  // Prefetch distance

// =============================================================================
// GEMM class with Stream-K parallelization (packed input)
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
  // Micro-kernel with linear prefetch for contiguous packed A/B
  // =========================================================================
  static __forceinline void microkernel_prefetch(
      const int k_len, const T* __restrict__ a_ptr, const T* __restrict__ b_ptr,
      const pred_t ptrue) __arm_streaming
#ifndef __arm_sim
      __arm_inout("za")
#endif
  {
    for (int k = 0; k < k_len; ++k) {
      // Linear prefetch PF_DIST iterations ahead
      if (k + PF_DIST < k_len) {
        __builtin_prefetch(a_ptr + PF_DIST * ZA_TILE_M, 0, 3);
        __builtin_prefetch(b_ptr + PF_DIST * ZA_TILE_N, 0, 3);
      }

      vec_t a0 = svld1_vnum(ptrue, a_ptr, 0);
      vec_t a1 = svld1_vnum(ptrue, a_ptr, 1);

      vec_t b0 = svld1_vnum(ptrue, b_ptr, 0);
      vec_t b1 = svld1_vnum(ptrue, b_ptr, 1);
      vec_t b2 = svld1_vnum(ptrue, b_ptr, 2);
      vec_t b3 = svld1_vnum(ptrue, b_ptr, 3);

      svmopa_za64_f64_m(0, ptrue, ptrue, a0, b0);
      svmopa_za64_f64_m(1, ptrue, ptrue, a0, b1);
      svmopa_za64_f64_m(2, ptrue, ptrue, a0, b2);
      svmopa_za64_f64_m(3, ptrue, ptrue, a0, b3);
      svmopa_za64_f64_m(4, ptrue, ptrue, a1, b0);
      svmopa_za64_f64_m(5, ptrue, ptrue, a1, b1);
      svmopa_za64_f64_m(6, ptrue, ptrue, a1, b2);
      svmopa_za64_f64_m(7, ptrue, ptrue, a1, b3);

      a_ptr += ZA_TILE_M;
      b_ptr += ZA_TILE_N;
    }
  }

  // =========================================================================
  // Load partial C from thread-local workspace (row-major, stride N)
  // =========================================================================
  static __forceinline void load_partial_c(const int N,
                                           const T* __restrict__ c_ptr,
                                           const pred_t ptrue) __arm_streaming
#ifndef __arm_sim
      __arm_inout("za")
#endif
  {
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
  // Store partial C to thread-local workspace (no scaling yet)
  // =========================================================================
  static __forceinline void store_partial_c(const int N, T* __restrict__ c_ptr,
                                            const pred_t ptrue) __arm_streaming
#ifndef __arm_sim
      __arm_inout("za")
#endif
  {
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
  // Stream-K: Each thread processes its K-slice for ALL M,N tiles
  // Thread-local C accumulator avoids race conditions
  // =========================================================================
  static __forceinline void compute_tile_streamk(
      const int M, const int N, const int K, const int k_start, const int k_end,
      const T* __restrict__ A_packed, const T* __restrict__ B_packed,
      T* __restrict__ C_local) __arm_streaming
#ifndef __arm_sim
      __arm_inout("za")
#endif
  {
    const int tiles_m = M / ZA_TILE_M;
    const int tiles_n = N / ZA_TILE_N;
    const int k_len = k_end - k_start;

    pred_t ptrue = svptrue_b64();

    // Process all M,N tiles for this thread's K-slice
    for (int tm = 0; tm < tiles_m; ++tm) {
      for (int tn = 0; tn < tiles_n; ++tn) {
        // Packed pointers for this thread's K-slice
        const T* a_ptr = A_packed + (tm * K + k_start) * ZA_TILE_M;
        const T* b_ptr = B_packed + (tn * K + k_start) * ZA_TILE_N;
        T* c_ptr = C_local + tm * ZA_TILE_M * N + tn * ZA_TILE_N;

        // For K-blocked processing within the K-slice
        bool first_block = true;
        for (int kc = 0; kc < k_len; kc += KC) {
          const int kb_len = (kc + KC <= k_len) ? KC : (k_len - kc);

          if (first_block) {
            svzero_za();
            first_block = false;
          } else {
            load_partial_c(N, c_ptr, ptrue);
          }

          microkernel_prefetch(kb_len, a_ptr, b_ptr, ptrue);

          store_partial_c(N, c_ptr, ptrue);

          a_ptr += kb_len * ZA_TILE_M;
          b_ptr += kb_len * ZA_TILE_N;
        }
      }
    }
  }

  // =========================================================================
  // Per-thread streaming wrapper for compute_tile_streamk
  // =========================================================================
#ifndef __arm_sim
  __arm_new("za")
#endif
      __arm_locally_streaming static void compute_thread_streamk(
          const int M, const int N, const int K, const int k_start,
          const int k_end, const T* __restrict__ A_packed,
          const T* __restrict__ B_packed, T* __restrict__ C_local) {
    compute_tile_streamk(M, N, K, k_start, k_end, A_packed, B_packed, C_local);
  }

  // =========================================================================
  // Main Stream-K GEMM: Packed A/B
  // =========================================================================
  static void compute_streamk_packed(const int M, const int N, const int K,
                                     const T* __restrict__ A_packed,
                                     const T* __restrict__ B_packed,
                                     T* __restrict__ D, const T alpha,
                                     const T gamma) {
    const int num_threads = omp_get_max_threads();

    // Allocate per-thread partial C workspaces
    T** C_local = new T*[num_threads];
    for (int t = 0; t < num_threads; ++t) {
      C_local[t] = new T[M * N];
      std::memset(C_local[t], 0, M * N * sizeof(T));
    }

    // Stream-K: each thread gets a contiguous K-slice
    const int k_chunk = (K + num_threads - 1) / num_threads;

#pragma omp parallel
    {
      int tid = omp_get_thread_num();
      int k_start = tid * k_chunk;
      int k_end = (k_start + k_chunk <= K) ? (k_start + k_chunk) : K;

      if (k_start < K) {
        compute_thread_streamk(M, N, K, k_start, k_end, A_packed, B_packed,
                               C_local[tid]);
      }
    }

    // Reduction phase: combine partial sums with alpha/gamma scaling
#pragma omp parallel for collapse(2)
    for (int i = 0; i < M; ++i) {
      for (int j = 0; j < N; ++j) {
        T sum = 0;
        for (int t = 0; t < num_threads; ++t) {
          sum += C_local[t][i * N + j];
        }
        D[i * N + j] = alpha * sum + gamma;
      }
    }

    // Cleanup
    for (int t = 0; t < num_threads; ++t) {
      delete[] C_local[t];
    }
    delete[] C_local;
  }

  // =========================================================================
  // Pack routines
  // =========================================================================
  static void pack_A(const int M, const int K, const T* A_colmajor,
                     T* A_packed) {
    const int tiles_m = M / ZA_TILE_M;
    for (int tm = 0; tm < tiles_m; ++tm) {
      for (int k = 0; k < K; ++k) {
        for (int i = 0; i < ZA_TILE_M; ++i) {
          A_packed[(tm * K + k) * ZA_TILE_M + i] =
              A_colmajor[(tm * ZA_TILE_M + i) + k * M];
        }
      }
    }
  }

  static void pack_B(const int N, const int K, const T* B_rowmajor,
                     T* B_packed) {
    const int tiles_n = N / ZA_TILE_N;
    for (int tn = 0; tn < tiles_n; ++tn) {
      for (int k = 0; k < K; ++k) {
        for (int j = 0; j < ZA_TILE_N; ++j) {
          B_packed[(tn * K + k) * ZA_TILE_N + j] =
              B_rowmajor[k * N + (tn * ZA_TILE_N + j)];
        }
      }
    }
  }

  // Test wrapper with packing
#ifndef __arm_sim
  __arm_new("za")
#endif
      __arm_locally_streaming static void compute_test(
          const int M, const int N, const int K, const T* A_colmajor,
          const T* B_rowmajor, T* D, const T alpha, const T gamma) {
    const int tiles_m = M / ZA_TILE_M;
    const int tiles_n = N / ZA_TILE_N;

    T* A_packed = new T[tiles_m * K * ZA_TILE_M];
    T* B_packed = new T[tiles_n * K * ZA_TILE_N];

    pack_A(M, K, A_colmajor, A_packed);
    pack_B(N, K, B_rowmajor, B_packed);

    compute_streamk_packed(M, N, K, A_packed, B_packed, D, alpha, gamma);

    delete[] A_packed;
    delete[] B_packed;
  }

  // Benchmark wrapper
  static double compute_benchmark(const int M, const int N, const int K,
                                  const T* A_colmajor, const T* B_rowmajor,
                                  T* D, const T alpha, const T gamma) {
    const int tiles_m = M / ZA_TILE_M;
    const int tiles_n = N / ZA_TILE_N;

    T* A_packed = new T[tiles_m * K * ZA_TILE_M];
    T* B_packed = new T[tiles_n * K * ZA_TILE_N];

    pack_A(M, K, A_colmajor, A_packed);
    pack_B(N, K, B_rowmajor, B_packed);

    // Warmup
    for (int i = 0; i < WITERS; ++i) {
      compute_streamk_packed(M, N, K, A_packed, B_packed, D, alpha, gamma);
    }

    auto start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < ITERS; ++i) {
      compute_streamk_packed(M, N, K, A_packed, B_packed, D, alpha, gamma);
    }
    auto end = std::chrono::high_resolution_clock::now();

    delete[] A_packed;
    delete[] B_packed;

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
  printf(
      "Testing GEMM<%s> STREAM-K PACKED: M=%d N=%d K=%d alpha=%.2f "
      "gamma=%.2f\n",
      type_name, M, N, K, alpha, gamma);

  omp_set_num_threads(NUM_THREADS);

  T* A = new T[M * K];
  T* B = new T[K * N];
  T* D = new T[M * N];
  T* D_ref = new T[M * N];

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
  std::memset(D_ref, 0, M * N * sizeof(T));

  // Reference
  for (int i = 0; i < M; ++i) {
    for (int j = 0; j < N; ++j) {
      T sum = 0;
      for (int k = 0; k < K; ++k) {
        sum += A[i + k * M] * B[k * N + j];
      }
      D_ref[i * N + j] = alpha * sum + gamma;
    }
  }

  gemm<T>::compute_test(M, N, K, A, B, D, alpha, gamma);

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
}

int main() {
  printf("SME GEMM - Stream-K (Packed Input)\n");
  printf("SVL=%d, ZA_TILE_M=%d, ZA_TILE_N=%d\n", SVL, gemm<double>::ZA_TILE_M,
         gemm<double>::ZA_TILE_N);
  printf("KC=%d, PF_DIST=%d\n", KC, PF_DIST);
  printf("Threads=%d\n\n", NUM_THREADS);

  int passed = 0;

  printf("=== Test 1: Small K ===\n");
  if (test_gemm<double>(32, 64, 128, 1.0, 0.0)) passed++;

  printf("\n=== Test 2: K > KC ===\n");
  if (test_gemm<double>(32, 64, 4096, 1.0, 0.0)) passed++;

  printf("\n=== Test 3: With scaling ===\n");
  if (test_gemm<double>(32, 64, 4096, 2.0, 0.5)) passed++;

  printf("\n=== Test 4: Larger M, N ===\n");
  if (test_gemm<double>(64, 128, 2048, 1.0, 0.0)) passed++;

  printf("\n=== Summary: %d/4 tests passed ===\n\n", passed);

  // Benchmark
  printf("=== Benchmark ===\n");
  int M = 64, N = 128, K = 4096;
  int k_blocks = (K + KC - 1) / KC;
  printf("M=%d N=%d K=%d (K blocks=%d)\n", M, N, K, k_blocks);

  omp_set_num_threads(NUM_THREADS);
  double* A = new double[M * K];
  double* B = new double[K * N];
  double* D = new double[M * N];

  for (int i = 0; i < M * K; ++i) A[i] = 0.001 * i;
  for (int i = 0; i < K * N; ++i) B[i] = 0.001 * i;
  std::memset(D, 0, M * N * sizeof(double));

  double time_ns = gemm<double>::compute_benchmark(M, N, K, A, B, D, 1.0, 0.0);
  double time_us = time_ns / 1000.0;
  double flops = 2.0 * M * N * K;
  double gflops = flops / time_ns;

  printf("  Time: %.2f us, %.2f GFLOP/s\n", time_us, gflops);

  delete[] A;
  delete[] B;
  delete[] D;

  return 0;
}
