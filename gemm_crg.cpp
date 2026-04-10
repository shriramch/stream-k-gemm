// SME GEMM with Cache Blocking and Gather Prefetch
// NON-PACKED input: A column-major, B row-major (strided access)
// Uses gather prefetch to hide memory latency for strided K access
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
#define NUM_THREADS 2
#endif

// =============================================================================
// Cache blocking and prefetch parameters
// =============================================================================
constexpr int KC = 2048;     // K block size
constexpr int NC = 64;       // N block size
constexpr int K_UNROLL = 8;  // Unroll factor (matches SVE 512-bit = 8 f64)
constexpr int PF_DIST = 16;  // Prefetch distance in K iterations

// =============================================================================
// GEMM class with gather prefetch
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
  // Micro-kernel with gather prefetch for strided A/B
  // A: column-major, stride M between K iterations
  // B: row-major, stride N between K iterations
  // Uses svprfd_gather_index (requires FEAT_FA64 in streaming mode)
  // =========================================================================
  static __forceinline void microkernel_gather(
      const int M, const int N, const int k_len, const T* __restrict__ a_ptr,
      const T* __restrict__ b_ptr, const pred_t ptrue) __arm_streaming
#ifndef __arm_sim
      __arm_inout("za")
#endif
  {
    // Build index vectors for gather prefetch: [0,1,2,3,4,5,6,7] scaled by
    // stride svindex creates [base, base+step, base+2*step, ...]
    const svint64_t idx_a = svindex_s64(PF_DIST * (int64_t)M,
                                        M);  // [PF_DIST*M, (PF_DIST+1)*M, ...]
    const svint64_t idx_b = svindex_s64(PF_DIST * (int64_t)N,
                                        N);  // [PF_DIST*N, (PF_DIST+1)*N, ...]

    // Main loop - unrolled by K_UNROLL
    int k = 0;
    for (; k + K_UNROLL <= k_len; k += K_UNROLL) {
      // Gather prefetch for K steps PF_DIST..PF_DIST+7 ahead
      // Prefetches leading cache line of 8 future A/B panels in one instruction
      if (k + PF_DIST + K_UNROLL <= k_len) {
        svprfd_gather_index(ptrue, a_ptr, idx_a, SV_PLDL1KEEP);
        svprfd_gather_index(ptrue, b_ptr, idx_b, SV_PLDL1KEEP);
      }

      // 8 iterations of pure math
#pragma unroll
      for (int step = 0; step < K_UNROLL; ++step) {
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

        a_ptr += M;
        b_ptr += N;
      }
    }

    // Remainder loop (no prefetch needed)
    for (; k < k_len; ++k) {
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

      a_ptr += M;
      b_ptr += N;
    }
  }

  // =========================================================================
  // Load partial C from row-major
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
  // Store partial C to row-major
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
  // Store final C with scaling
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
  // Main GEMM with cache blocking and gather prefetch
  // =========================================================================
  static __forceinline void compute(const int M, const int N, const int K,
                                    const T* __restrict__ ptr_a,
                                    const T* __restrict__ ptr_b,
                                    T* __restrict__ ptr_d, const T alpha,
                                    const T gamma) __arm_streaming
#ifndef __arm_sim
      __arm_inout("za")
#endif
  {
    const int tiles_m = M / ZA_TILE_M;
    const int tiles_n = N / ZA_TILE_N;
    constexpr int nc_tiles = NC / ZA_TILE_N;

    pred_t ptrue = svptrue_b64();

    for (int kc = 0; kc < K; kc += KC) {
      const int k_len = (kc + KC <= K) ? KC : (K - kc);
      const bool is_first = (kc == 0);
      const bool is_last = (kc + KC >= K);

      for (int nc = 0; nc < tiles_n; nc += nc_tiles) {
        const int tn_end =
            (nc + nc_tiles <= tiles_n) ? nc_tiles : (tiles_n - nc);

#pragma omp parallel for
        for (int tm = 0; tm < tiles_m; ++tm) {
          for (int tn_local = 0; tn_local < tn_end; ++tn_local) {
            const int tn = nc + tn_local;

            // Non-packed pointers with strides M and N
            const T* a_ptr = ptr_a + tm * ZA_TILE_M + kc * M;
            const T* b_ptr = ptr_b + tn * ZA_TILE_N + kc * N;
            T* c_ptr = ptr_d + tm * ZA_TILE_M * N + tn * ZA_TILE_N;

            if (is_first) {
              svzero_za();
            } else {
              load_partial_c(N, c_ptr, ptrue);
            }

            microkernel_gather(M, N, k_len, a_ptr, b_ptr, ptrue);

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

  // Test wrapper
#ifndef __arm_sim
  __arm_new("za")
#endif
      __arm_locally_streaming static void compute_test(
          const int M, const int N, const int K, const T* ptr_a, const T* ptr_b,
          T* ptr_d, const T alpha, const T gamma) {
    compute(M, N, K, ptr_a, ptr_b, ptr_d, alpha, gamma);
  }

  // Benchmark wrapper
#ifndef __arm_sim
  __arm_new("za")
#endif
      __arm_locally_streaming static double compute_benchmark(
          const int M, const int N, const int K, const T* ptr_a, const T* ptr_b,
          T* ptr_d, const T alpha, const T gamma) {
    for (int i = 0; i < WITERS; ++i) {
      compute(M, N, K, ptr_a, ptr_b, ptr_d, alpha, gamma);
    }

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
  printf("Testing GEMM<%s> GATHER: M=%d N=%d K=%d alpha=%.2f gamma=%.2f\n",
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
  printf("SME GEMM - Gather Prefetch (Non-Packed)\n");
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
