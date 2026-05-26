// SME GEMM - Optimized Dense GEMM
// Based on gemm_crgp with instruction interleaving from gemm_crsp0
//
// Optimizations:
// 1. M-tile parallelization (no reduction overhead)
// 2. 3-level cache blocking: MC×KC and KC×NC fit in L2 (1MB)
// 3. Interleaved loads/FMOPAs to hide memory latency
// 4. Single smstart/smstop per thread
//
// D = alpha * A * B + gamma

#include <omp.h>

#include <chrono>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <type_traits>

#include "hbm_alloc.hpp"
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

// #define SKIP_VERIFY

#ifndef KC
#define KC 256
#endif

#ifndef NC
#define NC 128
#endif

#ifndef MC
#define MC 64
#endif

constexpr int PF_DIST = 12;  // Prefetch distance (tuned for KC=256)

// =============================================================================
// GEMM class with cache blocking and interleaved microkernel
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
  // Interleaved microkernel: loads interleaved with FMOPAs
  // This hides load latency by computing while next data arrives
  // A_packed: [K][ZA_TILE_M], B_packed: [K][ZA_TILE_N]
  // =========================================================================
  static __forceinline void microkernel_interleaved(
      const int k_len, const T* __restrict__ a_ptr, const T* __restrict__ b_ptr,
      const pred_t ptrue) __arm_streaming
#ifndef __arm_sim
      __arm_inout("za")
#endif
  {
    // Main loop with interleaved loads and computes
    for (int k = 0; k < k_len; ++k) {
      // Prefetch PF_DIST iterations ahead (linear in packed layout)
      if (k + PF_DIST < k_len) {
        __builtin_prefetch(a_ptr + PF_DIST * ZA_TILE_M, 0, 3);
        __builtin_prefetch(b_ptr + PF_DIST * ZA_TILE_N, 0, 3);
        __builtin_prefetch(b_ptr + PF_DIST * ZA_TILE_N + 128, 0,
                           3);  // 2nd cacheline
      }

      // Load A vectors (always needed first)
      vec_t a0 = svld1_vnum(ptrue, a_ptr, 0);
      vec_t a1 = svld1_vnum(ptrue, a_ptr, 1);

      // Interleaved pattern: load B, compute immediately
      // This allows OOO execution to overlap next load with current compute
      vec_t b0 = svld1_vnum(ptrue, b_ptr, 0);
      svmopa_za64_f64_m(0, ptrue, ptrue, a0, b0);
      svmopa_za64_f64_m(4, ptrue, ptrue, a1, b0);

      vec_t b1 = svld1_vnum(ptrue, b_ptr, 1);
      svmopa_za64_f64_m(1, ptrue, ptrue, a0, b1);
      svmopa_za64_f64_m(5, ptrue, ptrue, a1, b1);

      vec_t b2 = svld1_vnum(ptrue, b_ptr, 2);
      svmopa_za64_f64_m(2, ptrue, ptrue, a0, b2);
      svmopa_za64_f64_m(6, ptrue, ptrue, a1, b2);

      vec_t b3 = svld1_vnum(ptrue, b_ptr, 3);
      svmopa_za64_f64_m(3, ptrue, ptrue, a0, b3);
      svmopa_za64_f64_m(7, ptrue, ptrue, a1, b3);

      a_ptr += ZA_TILE_M;
      b_ptr += ZA_TILE_N;
    }
  }

  // =========================================================================
  // Load partial C from row-major memory
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
  // Store partial C to row-major memory (no scaling)
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
  // Store final C with alpha/gamma scaling
  // =========================================================================
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
  // Thread-local blocked computation: processes M tiles with L2 blocking
  // Loop order: kc → mc → nc → tm/tn (K outer keeps A panel hot in L2)
  //
  // Cache efficiency analysis for KC=256, MC=64, NC=128:
  // - A block: 64 × 256 × 8 = 128 KB (fits in L2)
  // - B block: 256 × 128 × 8 = 256 KB (fits in L2)
  // - C block: 64 × 128 × 8 = 64 KB (fits in L2)
  // - Total working set: ~448 KB < 1 MB L2
  // =========================================================================
  static __forceinline void compute_blocked(
      const int M, const int N, const int K, const int tm_start,
      const int tm_end, const T* __restrict__ A_packed,
      const T* __restrict__ B_packed, T* __restrict__ D, const T alpha,
      const T gamma, const pred_t ptrue) __arm_streaming
#ifndef __arm_sim
      __arm_inout("za")
#endif
  {
    const int tiles_n = N / ZA_TILE_N;
    constexpr int mc_tiles = MC / ZA_TILE_M;
    constexpr int nc_tiles = NC / ZA_TILE_N;

    // 1. K-Blocking (OUTER): Process K in chunks to keep A/B panels in L2
    for (int kc = 0; kc < K; kc += KC) {
      const int k_len = (kc + KC <= K) ? KC : (K - kc);
      const bool is_first = (kc == 0);
      const bool is_last = (kc + KC >= K);

      // 3. N-Blocking: Process N in NC-sized chunks (B panel reuse)
      for (int nc = 0; nc < tiles_n; nc += nc_tiles) {
        const int nc_end = (nc + nc_tiles <= tiles_n) ? nc + nc_tiles : tiles_n;

        // 2. M-Blocking: Process assigned M tiles in MC-sized chunks
        for (int mc = tm_start; mc < tm_end; mc += mc_tiles) {
          const int mc_end = (mc + mc_tiles <= tm_end) ? mc + mc_tiles : tm_end;

          // 4. Process M×N tile block
          for (int tn = nc; tn < nc_end; ++tn) {
            for (int tm = mc; tm < mc_end; ++tm) {
              // Packed pointers with kc offset
              const T* a_ptr = A_packed + (tm * K + kc) * ZA_TILE_M;
              const T* b_ptr = B_packed + (tn * K + kc) * ZA_TILE_N;
              T* c_ptr = D + tm * ZA_TILE_M * N + tn * ZA_TILE_N;

              if (is_first) {
                svzero_za();
              } else {
                load_partial_c(N, c_ptr, ptrue);
              }

              microkernel_interleaved(k_len, a_ptr, b_ptr, ptrue);

              if (is_last) {
                store_final_c(N, c_ptr, alpha, gamma, ptrue);
              } else {
                store_partial_c(N, c_ptr, ptrue);
              }
            }
          }
        }
      }
    }
  }

  // =========================================================================
  // Thread wrapper: single smstart/smstop per thread
  // =========================================================================
#ifndef __arm_sim
  __arm_new("za")
#endif
      __arm_locally_streaming static void compute_thread_block(
          const int M, const int N, const int K, const int tm_start,
          const int tm_end, const T* __restrict__ A_packed,
          const T* __restrict__ B_packed, T* __restrict__ D, const T alpha,
          const T gamma) {
    pred_t ptrue = svptrue_b64();
    compute_blocked(M, N, K, tm_start, tm_end, A_packed, B_packed, D, alpha,
                    gamma, ptrue);
  }

  // =========================================================================
  // Main GEMM: packed A/B, row-major C, M-tile parallelization
  // =========================================================================
  static void compute_packed(const int M, const int N, const int K,
                             const T* __restrict__ A_packed,
                             const T* __restrict__ B_packed, T* __restrict__ D,
                             const T alpha, const T gamma) {
    const int tiles_m = M / ZA_TILE_M;
    const int num_threads = omp_get_max_threads();

    // Distribute M tiles across threads (contiguous for cache locality)
    const int tiles_per_thread = (tiles_m + num_threads - 1) / num_threads;

#pragma omp parallel
    {
      const int tid = omp_get_thread_num();
      const int tm_start = tid * tiles_per_thread;
      const int tm_end = (tm_start + tiles_per_thread <= tiles_m)
                             ? tm_start + tiles_per_thread
                             : tiles_m;

      if (tm_start < tiles_m) {
        compute_thread_block(M, N, K, tm_start, tm_end, A_packed, B_packed, D,
                             alpha, gamma);
      }
    }
  }

  // =========================================================================
  // Pack A: column-major → packed [tiles_m][K][ZA_TILE_M]
  // =========================================================================
  static void pack_A(const int M, const int K, const T* A_colmajor,
                     T* A_packed) {
    const int tiles_m = M / ZA_TILE_M;
#pragma omp parallel for collapse(2)
    for (int tm = 0; tm < tiles_m; ++tm) {
      for (int k = 0; k < K; ++k) {
        for (int i = 0; i < ZA_TILE_M; ++i) {
          A_packed[(tm * K + k) * ZA_TILE_M + i] =
              A_colmajor[(tm * ZA_TILE_M + i) + k * M];
        }
      }
    }
  }

  // =========================================================================
  // Pack B: row-major → packed [tiles_n][K][ZA_TILE_N]
  // =========================================================================
  static void pack_B(const int N, const int K, const T* B_rowmajor,
                     T* B_packed) {
    const int tiles_n = N / ZA_TILE_N;
#pragma omp parallel for collapse(2)
    for (int tn = 0; tn < tiles_n; ++tn) {
      for (int k = 0; k < K; ++k) {
        for (int j = 0; j < ZA_TILE_N; ++j) {
          B_packed[(tn * K + k) * ZA_TILE_N + j] =
              B_rowmajor[k * N + (tn * ZA_TILE_N + j)];
        }
      }
    }
  }

  // =========================================================================
  // Test wrapper
  // =========================================================================
  static void compute_test(const int M, const int N, const int K,
                           const T* A_colmajor, const T* B_rowmajor, T* D,
                           const T alpha, const T gamma) {
    const int tiles_m = M / ZA_TILE_M;
    const int tiles_n = N / ZA_TILE_N;

    T* A_packed = hbm_alloc<T>(tiles_m * K * ZA_TILE_M);
    T* B_packed = hbm_alloc<T>(tiles_n * K * ZA_TILE_N);

    pack_A(M, K, A_colmajor, A_packed);
    pack_B(N, K, B_rowmajor, B_packed);

    compute_packed(M, N, K, A_packed, B_packed, D, alpha, gamma);

    hbm_free(A_packed);
    hbm_free(B_packed);
  }

  // =========================================================================
  // Benchmark wrapper
  // =========================================================================
  static double compute_benchmark(const int M, const int N, const int K,
                                  const T* A_colmajor, const T* B_rowmajor,
                                  T* D, const T alpha, const T gamma) {
    const int tiles_m = M / ZA_TILE_M;
    const int tiles_n = N / ZA_TILE_N;

    T* A_packed = hbm_alloc<T>(tiles_m * K * ZA_TILE_M);
    T* B_packed = hbm_alloc<T>(tiles_n * K * ZA_TILE_N);

    pack_A(M, K, A_colmajor, A_packed);
    pack_B(N, K, B_rowmajor, B_packed);

    // Warmup
    for (int i = 0; i < WITERS; ++i) {
      compute_packed(M, N, K, A_packed, B_packed, D, alpha, gamma);
    }

    auto start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < ITERS; ++i) {
      compute_packed(M, N, K, A_packed, B_packed, D, alpha, gamma);
    }
    auto end = std::chrono::high_resolution_clock::now();

    hbm_free(A_packed);
    hbm_free(B_packed);

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
  printf("Testing GEMM<%s> OPTIMIZED: M=%d N=%d K=%d alpha=%.2f gamma=%.2f\n",
         type_name, M, N, K, alpha, gamma);

  omp_set_num_threads(NUM_THREADS);

  T* A = hbm_alloc<T>(M * K);
  T* B = hbm_alloc<T>(K * N);
  T* D = hbm_alloc<T>(M * N);

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
  hbm_free(A);
  hbm_free(B);
  hbm_free(D);
  return true;
#else
  T* D_ref = hbm_alloc<T>(M * N);
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

  hbm_free(A);
  hbm_free(B);
  hbm_free(D);
  hbm_free(D_ref);

  return pass;
#endif
}

// =============================================================================
// Main
// =============================================================================

int main(int argc, char** argv) {
  hbm_init();

#ifndef SKIP_VERIFY
  // Run verification tests only if SKIP_VERIFY is not defined
  int passed = 0;
  if (test_gemm<double>(32, 64, 128, 1.0, 0.0)) passed++;
  if (test_gemm<double>(32, 64, 4096, 1.0, 0.0)) passed++;
  if (test_gemm<double>(32, 64, 4096, 2.0, 0.5)) passed++;
  if (test_gemm<double>(64, 128, 2048, 1.0, 0.0)) passed++;
  if (passed != 4) {
    printf("FAIL: %d/4 tests passed\n", passed);
    return 1;
  }
#endif

  // Benchmark - concise output for sweep scripts
  int M = 616, N = 616, K = 175616;
  if (argc == 4) {
    M = std::atoi(argv[1]);
    N = std::atoi(argv[2]);
    K = std::atoi(argv[3]);
  }

  omp_set_num_threads(NUM_THREADS);
  double* A = hbm_alloc<double>(M * K);
  double* B = hbm_alloc<double>(K * N);
  double* D = hbm_alloc<double>(M * N);

  for (int i = 0; i < M * K; ++i) A[i] = 0.001 * i;
  for (int i = 0; i < K * N; ++i) B[i] = 0.001 * i;
  std::memset(D, 0, M * N * sizeof(double));

  double time_ns = gemm<double>::compute_benchmark(M, N, K, A, B, D, 1.0, 0.0);
  double time_us = time_ns / 1000.0;
  double flops = 2.0 * M * N * K;
  double gflops = flops / time_ns;

  // CSV-style output: MC,NC,KC,M,N,K,time_us,GFLOP/s
  printf("%d,%d,%d,%d,%d,%d,%.2f,%.2f\n", MC, NC, KC, M, N, K, time_us, gflops);

  hbm_free(A);
  hbm_free(B);
  hbm_free(D);

  return 0;
}
