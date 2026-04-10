// SME GEMM with Cache Blocking and Linear Prefetch
// PACKED input: A_packed[tiles_m][K][ZA_TILE_M],
// B_packed[tiles_n][K][ZA_TILE_N] Uses simple linear prefetch (data is
// contiguous in K dimension)
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

// Define SKIP_VERIFY to disable naive kernel and verification
// #define SKIP_VERIFY

// =============================================================================
// Cache blocking and prefetch parameters
// =============================================================================
constexpr int KC = 2048;     // K block size
constexpr int NC = 64;       // N block size
constexpr int K_UNROLL = 8;  // Unroll factor
constexpr int PF_DIST = 16;  // Prefetch distance in K iterations

// =============================================================================
// GEMM class with linear prefetch for packed input
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
  // A_packed: contiguous [K][ZA_TILE_M], stride = ZA_TILE_M = 128 bytes
  // B_packed: contiguous [K][ZA_TILE_N], stride = ZA_TILE_N = 256 bytes
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
  // Load/Store C from/to row-major (same as non-packed version)
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

  static __forceinline void store_final_c(const int N, T* __restrict__ c_ptr,
                                          const T alpha, const T gamma,
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
      const T* __restrict__ A_packed, const T* __restrict__ B_packed,
      T* __restrict__ D, const T alpha, const T gamma,
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

          // Packed pointers
          const T* a_ptr = A_packed + (tm * K + kc) * ZA_TILE_M;
          const T* b_ptr = B_packed + (tn * K + kc) * ZA_TILE_N;
          T* c_ptr = D + tm * ZA_TILE_M * N + tn * ZA_TILE_N;

          if (is_first) {
            svzero_za();
          } else {
            load_partial_c(N, c_ptr, ptrue);
          }

          microkernel_prefetch(k_len, a_ptr, b_ptr, ptrue);

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
          const int tm, const T* __restrict__ A_packed,
          const T* __restrict__ B_packed, T* __restrict__ D, const T alpha,
          const T gamma) {
    pred_t ptrue = svptrue_b64();
    compute_all_tiles_for_tm(M, N, K, tiles_n, tm, A_packed, B_packed, D, alpha,
                             gamma, ptrue);
  }

  // =========================================================================
  // Main GEMM: packed A/B with prefetch, row-major C (NO SME attributes)
  // =========================================================================
  static void compute_packed(const int M, const int N, const int K,
                             const T* __restrict__ A_packed,
                             const T* __restrict__ B_packed, T* __restrict__ D,
                             const T alpha, const T gamma) {
    const int tiles_m = M / ZA_TILE_M;
    const int tiles_n = N / ZA_TILE_N;

    // Each thread handles ALL kc/nc for its assigned M tile
#pragma omp parallel for
    for (int tm = 0; tm < tiles_m; ++tm) {
      compute_thread_block(M, N, K, tiles_n, tm, A_packed, B_packed, D, alpha,
                           gamma);
    }
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

  // Test wrapper (NO SME attributes)
  static void compute_test(const int M, const int N, const int K,
                           const T* A_colmajor, const T* B_rowmajor, T* D,
                           const T alpha, const T gamma) {
    const int tiles_m = M / ZA_TILE_M;
    const int tiles_n = N / ZA_TILE_N;

    T* A_packed = new T[tiles_m * K * ZA_TILE_M];
    T* B_packed = new T[tiles_n * K * ZA_TILE_N];

    pack_A(M, K, A_colmajor, A_packed);
    pack_B(N, K, B_rowmajor, B_packed);

    compute_packed(M, N, K, A_packed, B_packed, D, alpha, gamma);

    delete[] A_packed;
    delete[] B_packed;
  }

  // Benchmark wrapper (NO SME attributes)
  static double compute_benchmark(const int M, const int N, const int K,
                                  const T* A_colmajor, const T* B_rowmajor,
                                  T* D, const T alpha, const T gamma) {
    const int tiles_m = M / ZA_TILE_M;
    const int tiles_n = N / ZA_TILE_N;

    T* A_packed = new T[tiles_m * K * ZA_TILE_M];
    T* B_packed = new T[tiles_n * K * ZA_TILE_N];

    pack_A(M, K, A_colmajor, A_packed);
    pack_B(N, K, B_rowmajor, B_packed);

    for (int i = 0; i < WITERS; ++i) {
      compute_packed(M, N, K, A_packed, B_packed, D, alpha, gamma);
    }

    auto start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < ITERS; ++i) {
      compute_packed(M, N, K, A_packed, B_packed, D, alpha, gamma);
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
      "Testing GEMM<%s> PACKED+PREFETCH: M=%d N=%d K=%d alpha=%.2f "
      "gamma=%.2f\n",
      type_name, M, N, K, alpha, gamma);

  omp_set_num_threads(NUM_THREADS);

  T* A = new T[M * K];
  T* B = new T[K * N];
  T* D = new T[M * N];

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

  gemm<T>::compute_test(M, N, K, A, B, D, alpha, gamma);

#ifdef SKIP_VERIFY
  printf("  SKIPPED verification (SKIP_VERIFY defined)\n");
  delete[] A;
  delete[] B;
  delete[] D;
  return true;
#else
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

int main() {
  printf("SME GEMM - Packed + Linear Prefetch\n");
  printf("SVL=%d, ZA_TILE_M=%d, ZA_TILE_N=%d\n", SVL, gemm<double>::ZA_TILE_M,
         gemm<double>::ZA_TILE_N);
  printf("KC=%d, NC=%d, K_UNROLL=%d, PF_DIST=%d\n", KC, NC, K_UNROLL, PF_DIST);
  printf("Threads=%d\n\n", NUM_THREADS);

  int passed = 0, total = 0;

  printf("=== Test 1: Small K ===\n");
  if (test_gemm<double>(32, 64, 128, 1.0, 0.0)) passed++;
  total++;

  printf("\n=== Test 2: K > KC ===\n");
  if (test_gemm<double>(32, 64, 4096, 1.0, 0.0)) passed++;
  total++;

  printf("\n=== Test 3: With scaling ===\n");
  if (test_gemm<double>(32, 64, 4096, 2.0, 0.5)) passed++;
  total++;

  printf("\n=== Test 4: Larger M, N ===\n");
  if (test_gemm<double>(64, 128, 2048, 1.0, 0.0)) passed++;
  total++;

  printf("\n=== Summary: %d/%d tests passed ===\n", passed, total);

  printf("\n=== Benchmark ===\n");
  {
    const int M = 64, N = 128, K = 4096;
    double* A = new double[M * K];
    double* B = new double[K * N];
    double* D = new double[M * N];
    std::memset(A, 0, M * K * sizeof(double));
    std::memset(B, 0, K * N * sizeof(double));
    std::memset(D, 0, M * N * sizeof(double));

    printf("M=%d N=%d K=%d (K blocks=%d)\n", M, N, K, (K + KC - 1) / KC);

    omp_set_num_threads(NUM_THREADS);
    double ns = gemm<double>::compute_benchmark(M, N, K, A, B, D, 1.0, 0.0);
    double gflops = (2.0 * M * N * K) / ns;
    printf("  Time: %.2f us, %.2f GFLOP/s\n", ns / 1000.0, gflops);

    delete[] A;
    delete[] B;
    delete[] D;
  }

  return (passed == total) ? 0 : 1;
}
