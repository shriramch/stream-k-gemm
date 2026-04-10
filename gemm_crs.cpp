// SME GEMM with Stream-K Parallelization (Non-Packed Input)
// Stream-K: Split K across threads, each thread computes partial C
// Uses gather prefetch for strided A/B access
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

// Define SKIP_VERIFY to disable naive kernel and verification
// #define SKIP_VERIFY

// =============================================================================
// Stream-K parameters
// =============================================================================
constexpr int KC = 2048;     // K block size for cache blocking
constexpr int NC = 64;       // N block size (2 micro-tiles)
constexpr int K_UNROLL = 8;  // Unroll factor
constexpr int PF_DIST = 16;  // Prefetch distance

// =============================================================================
// GEMM class with Stream-K parallelization (non-packed input)
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
  // Uses svprfd_gather_index (requires FEAT_FA64 in streaming mode)
  // =========================================================================
  static __forceinline void microkernel_gather(
      const int M, const int N, const int k_len, const T* __restrict__ a_ptr,
      const T* __restrict__ b_ptr, const pred_t ptrue) __arm_streaming
#ifndef __arm_sim
      __arm_inout("za")
#endif
  {
    // Build index vectors for gather prefetch
    const svint64_t idx_a = svindex_s64(PF_DIST * (int64_t)M, M);
    const svint64_t idx_b = svindex_s64(PF_DIST * (int64_t)N, N);

    // Main loop - unrolled by K_UNROLL
    int k = 0;
    for (; k + K_UNROLL <= k_len; k += K_UNROLL) {
      // Gather prefetch for K steps PF_DIST ahead
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

    // Remainder loop
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
  // Non-packed: A is column-major, B is row-major
  // L2-blocked: kc/nc on OUTSIDE to keep A/B panels hot in cache
  // =========================================================================
  static __forceinline void compute_tile_streamk(
      const int M, const int N, const int K, const int k_start, const int k_end,
      const T* __restrict__ A, const T* __restrict__ B,
      T* __restrict__ C_local) __arm_streaming
#ifndef __arm_sim
      __arm_inout("za")
#endif
  {
    const int tiles_m = M / ZA_TILE_M;
    const int tiles_n = N / ZA_TILE_N;
    constexpr int nc_tiles = NC / ZA_TILE_N;
    const int k_len = k_end - k_start;

    pred_t ptrue = svptrue_b64();

    // 1. K-Blocking on the OUTSIDE (keeps A panel hot in L2)
    for (int kc = 0; kc < k_len; kc += KC) {
      const int kb_len = (kc + KC <= k_len) ? KC : (k_len - kc);
      const bool is_first = (kc == 0);

      // 2. N-Blocking to keep B panel in L2 cache
      for (int nc = 0; nc < tiles_n; nc += nc_tiles) {
        const int tn_end =
            (nc + nc_tiles <= tiles_n) ? nc_tiles : (tiles_n - nc);

        // 3. Process the M/N tiles that fit within this L2 block
        for (int tm = 0; tm < tiles_m; ++tm) {
          for (int tn_local = 0; tn_local < tn_end; ++tn_local) {
            const int tn = nc + tn_local;

            // Pointers offset by k_start AND the current kc block
            // A: column-major [M][K], B: row-major [K][N]
            const T* a_ptr = A + tm * ZA_TILE_M + (k_start + kc) * M;
            const T* b_ptr = B + (k_start + kc) * N + tn * ZA_TILE_N;
            T* c_ptr = C_local + tm * ZA_TILE_M * N + tn * ZA_TILE_N;

            if (is_first) {
              svzero_za();
            } else {
              load_partial_c(N, c_ptr, ptrue);
            }

            microkernel_gather(M, N, kb_len, a_ptr, b_ptr, ptrue);

            // Always store partials to workspace
            // alpha/gamma scaling happens in the OpenMP reduction later
            store_partial_c(N, c_ptr, ptrue);
          }
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
          const int k_end, const T* __restrict__ A, const T* __restrict__ B,
          T* __restrict__ C_local) {
    compute_tile_streamk(M, N, K, k_start, k_end, A, B, C_local);
  }

  // =========================================================================
  // Main Stream-K GEMM: Non-Packed A/B (with pre-allocated workspace)
  // =========================================================================
  static void compute_streamk_core(const int M, const int N, const int K,
                                   const T* __restrict__ A,
                                   const T* __restrict__ B, T* __restrict__ D,
                                   const T alpha, const T gamma, T** C_local) {
    const int num_threads = omp_get_max_threads();
    const int k_chunk = (K + num_threads - 1) / num_threads;

#pragma omp parallel
    {
      int tid = omp_get_thread_num();
      int k_start = tid * k_chunk;
      int k_end = (k_start + k_chunk <= K) ? (k_start + k_chunk) : K;

      if (k_start < K) {
        compute_thread_streamk(M, N, K, k_start, k_end, A, B, C_local[tid]);
      }
    }

    // SVE-accelerated reduction: combine partial sums with alpha/gamma scaling
    const vec_t v_alpha = svdup_f64(alpha);
    const vec_t v_gamma = svdup_f64(gamma);

#pragma omp parallel for
    for (int i = 0; i < M; ++i) {
      const pred_t ptrue = svptrue_b64();
      int j = 0;

      // SVE vectorized reduction (SVCNT elements at a time)
      for (; j + SVCNT <= N; j += SVCNT) {
        vec_t sum = svdup_f64(0.0);
        for (int t = 0; t < num_threads; ++t) {
          vec_t c_vec = svld1_f64(ptrue, &C_local[t][i * N + j]);
          sum = svadd_f64_x(ptrue, sum, c_vec);
        }
        // D[i,j] = alpha * sum + gamma
        vec_t result = svmla_f64_x(ptrue, v_gamma, sum, v_alpha);
        svst1_f64(ptrue, &D[i * N + j], result);
      }

      // Scalar remainder (if N not multiple of SVCNT)
      for (; j < N; ++j) {
        T sum = 0;
        for (int t = 0; t < num_threads; ++t) {
          sum += C_local[t][i * N + j];
        }
        D[i * N + j] = alpha * sum + gamma;
      }
    }
  }

  // =========================================================================
  // Main Stream-K GEMM: Self-allocating wrapper for correctness tests
  // =========================================================================
  static void compute_streamk(const int M, const int N, const int K,
                              const T* __restrict__ A, const T* __restrict__ B,
                              T* __restrict__ D, const T alpha, const T gamma) {
    const int num_threads = omp_get_max_threads();

    // Allocate per-thread partial C workspaces
    T** C_local = new T*[num_threads];
    for (int t = 0; t < num_threads; ++t) {
      C_local[t] = new T[M * N]();
    }

    compute_streamk_core(M, N, K, A, B, D, alpha, gamma, C_local);

    // Cleanup
    for (int t = 0; t < num_threads; ++t) {
      delete[] C_local[t];
    }
    delete[] C_local;
  }

  // Test wrapper (NO SME attributes)
  static void compute_test(const int M, const int N, const int K, const T* A,
                           const T* B, T* D, const T alpha, const T gamma) {
    compute_streamk(M, N, K, A, B, D, alpha, gamma);
  }

  // Benchmark wrapper
  static double compute_benchmark(const int M, const int N, const int K,
                                  const T* A, const T* B, T* D, const T alpha,
                                  const T gamma) {
    const int num_threads = omp_get_max_threads();

    // Pre-allocate workspace ONCE, outside timing loop
    T** C_local = new T*[num_threads];
    for (int t = 0; t < num_threads; ++t) {
      C_local[t] = new T[M * N];
    }

    // Warmup
    for (int i = 0; i < WITERS; ++i) {
      compute_streamk_core(M, N, K, A, B, D, alpha, gamma, C_local);
    }

    auto start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < ITERS; ++i) {
      compute_streamk_core(M, N, K, A, B, D, alpha, gamma, C_local);
    }
    auto end = std::chrono::high_resolution_clock::now();

    // Cleanup
    for (int t = 0; t < num_threads; ++t) {
      delete[] C_local[t];
    }
    delete[] C_local;

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
  printf("Testing GEMM<%s> STREAM-K: M=%d N=%d K=%d alpha=%.2f gamma=%.2f\n",
         type_name, M, N, K, alpha, gamma);

  omp_set_num_threads(NUM_THREADS);

  T* A = new T[M * K];
  T* B = new T[K * N];
  T* D = new T[M * N];

  // A: column-major [M][K]
  for (int j = 0; j < K; ++j) {
    for (int i = 0; i < M; ++i) {
      A[i + j * M] = static_cast<T>((i + 1) * 0.01 + (j + 1) * 0.001);
    }
  }
  // B: row-major [K][N]
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
  // Reference: A column-major, B row-major
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

int main(int argc, char* argv[]) {
  printf("SME GEMM - Stream-K (Non-Packed, Gather Prefetch)\n");
  printf("SVL=%d, ZA_TILE_M=%d, ZA_TILE_N=%d\n", SVL, gemm<double>::ZA_TILE_M,
         gemm<double>::ZA_TILE_N);
  printf("KC=%d, K_UNROLL=%d, PF_DIST=%d\n", KC, K_UNROLL, PF_DIST);
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
  if (argc == 4) {
    M = std::atoi(argv[1]);
    N = std::atoi(argv[2]);
    K = std::atoi(argv[3]);
  }
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
