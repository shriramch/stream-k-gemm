// SME GEMM with In-Place 8x8 Block Transpose
// Input: A in 16-column packed format [M/16][K][16], B (KxN row-major)
// Packed format: A_packed[(tm * K + k) * 16 + ml] for row tm*16+ml at col k
//
// Step 1: Transpose each 8x8 block of A in-place using ZA (stride=16)
//         Within each band tile tm, we have K rows x 16 columns
// Step 2: Run SME GEMM accessing transposed packed data
//
// For f64: SVCNT=8, ZA tile = 8x8
// Transpose: svld1_hor_za64() loads row, svst1_ver_za64() stores column
//
// After 8x8 transpose on packed format (stride 16):
//   - Band bi*8+mi at grid bk*8+ki: address = base + mi*16 + ki
//   - 8 consecutive ki values at same mi are contiguous
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

// =============================================================================
// Cache blocking parameters
// =============================================================================
#ifndef KC
#define KC 64
#endif

#ifndef NC
#define NC 64
#endif

#ifndef MC
#define MC 64
#endif

constexpr int PF_DIST = 8;

// =============================================================================
// GEMM class with in-place transpose
// =============================================================================

template <typename T>
class gemm {
 public:
  static constexpr int SVCNT = SVL / sizeof(T);  // 8 for f64
  static constexpr int ZA_TILE_M = 2 * SVCNT;    // 16 for f64
  static constexpr int ZA_TILE_N = 4 * SVCNT;    // 32 for f64
  static constexpr int BLOCK_SIZE = SVCNT;       // 8 for f64 (transpose block)

  using vec_t = svfloat64_t;
  using pred_t = svbool_t;

  // =========================================================================
  // In-place 8x8 block transpose using ZA tile 0
  // Load rows horizontally, store columns vertically
  // A is column-major: element (i,k) at A + i + k*stride
  // =========================================================================
  static __forceinline void transpose_8x8_inplace(
      T* __restrict__ ptr, const int64_t stride,
      const pred_t ptrue) __arm_streaming
#ifndef __arm_sim
      __arm_inout("za")
#endif
  {
    // Load 8 rows into ZA tile 0 (horizontal slices)
    // Row i of matrix (stride elements apart) -> ZA tile 0, slice i
    svld1_hor_za64(0, 0, ptrue, ptr + 0 * stride);
    svld1_hor_za64(0, 1, ptrue, ptr + 1 * stride);
    svld1_hor_za64(0, 2, ptrue, ptr + 2 * stride);
    svld1_hor_za64(0, 3, ptrue, ptr + 3 * stride);
    svld1_hor_za64(0, 4, ptrue, ptr + 4 * stride);
    svld1_hor_za64(0, 5, ptrue, ptr + 5 * stride);
    svld1_hor_za64(0, 6, ptrue, ptr + 6 * stride);
    svld1_hor_za64(0, 7, ptrue, ptr + 7 * stride);

    // Store 8 columns vertically (columns become rows = transpose)
    // ZA tile 0, vertical slice i -> row i of output
    svst1_ver_za64(0, 0, ptrue, ptr + 0 * stride);
    svst1_ver_za64(0, 1, ptrue, ptr + 1 * stride);
    svst1_ver_za64(0, 2, ptrue, ptr + 2 * stride);
    svst1_ver_za64(0, 3, ptrue, ptr + 3 * stride);
    svst1_ver_za64(0, 4, ptrue, ptr + 4 * stride);
    svst1_ver_za64(0, 5, ptrue, ptr + 5 * stride);
    svst1_ver_za64(0, 6, ptrue, ptr + 6 * stride);
    svst1_ver_za64(0, 7, ptrue, ptr + 7 * stride);
  }

  // =========================================================================
  // Transpose wrapper with streaming mode
  // =========================================================================
#ifndef __arm_sim
  __arm_new("za")
#endif
      __arm_locally_streaming static void transpose_block_8x8(
          T* __restrict__ ptr, const int64_t stride) {
    pred_t ptrue = svptrue_b64();
    transpose_8x8_inplace(ptr, stride, ptrue);
  }

  // =========================================================================
  // Transpose entire matrix A (packed format) in-place
  // Packed format: [M/16][K][16] - for each band tile, K rows x 16 columns
  // Process 8x8 blocks within each band tile: 2 column blocks (bi=0,1)
  // =========================================================================
  static void transpose_A_inplace(const int M, const int K, T* A) {
    const int tiles_m = M / ZA_TILE_M;  // Number of band tiles (16 bands each)
    const int blocks_k = K / BLOCK_SIZE;  // K blocks within each tile

#pragma omp parallel for collapse(3)
    for (int tm = 0; tm < tiles_m; ++tm) {
      for (int bk = 0; bk < blocks_k; ++bk) {
        for (int bi = 0; bi < 2; ++bi) {  // 2 column blocks of 8 within the 16
          // Block (bk, bi) within band tile tm
          // Packed base: A + tm * K * 16
          // Block start: base + bk*8*16 + bi*8
          T* block_ptr = A + tm * K * ZA_TILE_M + bk * BLOCK_SIZE * ZA_TILE_M +
                         bi * BLOCK_SIZE;
          transpose_block_8x8(block_ptr, ZA_TILE_M);  // stride = 16
        }
      }
    }
  }

  // =========================================================================
  // Micro-kernel with interleaved loads/FMOPAs (packed format)
  // After transpose on packed format (stride 16):
  //   - Band bi*8+mi at grid bk*8+ki: base + mi*16 + ki
  // Use gather load to get 8 bands at same k
  // =========================================================================
  static __forceinline void microkernel_interleaved(
      const int K, const T* __restrict__ a_base1, const T* __restrict__ a_base2,
      const T* __restrict__ b_ptr, const int64_t b_stride,
      const pred_t ptrue) __arm_streaming
#ifndef __arm_sim
      __arm_inout("za")
#endif
  {
    svint64_t idx = svindex_s64(0, ZA_TILE_M);  // 0, 16, 32, ...
    const int k_blocks = K / SVCNT;

    for (int bk = 0; bk < k_blocks; ++bk) {
      for (int ki = 0; ki < SVCNT; ++ki) {
        // After transpose: element at mi*16 + ki within block
        const T* a1 = a_base1 + bk * SVCNT * ZA_TILE_M + ki;  // bi=0 block
        const T* a2 = a_base2 + bk * SVCNT * ZA_TILE_M + ki;  // bi=1 block

        // Gather load: 8 bands at stride 16
        vec_t a0 = svld1_gather_index(ptrue, a1, idx);
        vec_t a1v = svld1_gather_index(ptrue, a2, idx);

        // Load B and compute
        vec_t b0 = svld1(ptrue, b_ptr);
        svmopa_za64_f64_m(0, ptrue, ptrue, a0, b0);
        svmopa_za64_f64_m(4, ptrue, ptrue, a1v, b0);

        vec_t b1 = svld1(ptrue, b_ptr + SVCNT);
        svmopa_za64_f64_m(1, ptrue, ptrue, a0, b1);
        svmopa_za64_f64_m(5, ptrue, ptrue, a1v, b1);

        vec_t b2 = svld1(ptrue, b_ptr + 2 * SVCNT);
        svmopa_za64_f64_m(2, ptrue, ptrue, a0, b2);
        svmopa_za64_f64_m(6, ptrue, ptrue, a1v, b2);

        vec_t b3 = svld1(ptrue, b_ptr + 3 * SVCNT);
        svmopa_za64_f64_m(3, ptrue, ptrue, a0, b3);
        svmopa_za64_f64_m(7, ptrue, ptrue, a1v, b3);

        b_ptr += b_stride;
      }
    }
  }

  // =========================================================================
  // Load partial C into ZA (for KC accumulation)
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
  // Store partial C from ZA (without scaling, for KC accumulation)
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
  // Store C with alpha/gamma scaling
  // =========================================================================
  static __forceinline void store_c(const int N, T* __restrict__ c_ptr,
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
  // Compute one M×N tile from transposed packed A and row-major B
  // A: packed format [M/16][K][16], transposed 8x8 blocks
  // B: row-major
  // =========================================================================
  static __forceinline void compute_tile(
      const int M, const int N, const int K, const int tm, const int tn,
      const T* __restrict__ A, const T* __restrict__ B, T* __restrict__ D,
      const T alpha, const T gamma, const pred_t ptrue) __arm_streaming
#ifndef __arm_sim
      __arm_inout("za")
#endif
  {
    svzero_za();

    // Packed format: A + tm * K * 16 + bi * 8 for band block bi
    const T* a_ptr1 = A + tm * K * ZA_TILE_M;          // bi=0: bands 0-7
    const T* a_ptr2 = A + tm * K * ZA_TILE_M + SVCNT;  // bi=1: bands 8-15
    const T* b_ptr = B + tn * ZA_TILE_N;               // Start of B tile
    T* c_ptr = D + tm * ZA_TILE_M * N + tn * ZA_TILE_N;

    microkernel_interleaved(K, a_ptr1, a_ptr2, b_ptr, N, ptrue);

    store_c(N, c_ptr, alpha, gamma, ptrue);
  }

  // =========================================================================
  // Micro-kernel with k range for KC blocking (packed format)
  // After transpose on packed format (stride 16):
  //   - Band bi*8+mi at grid bk*8+ki: base + mi*16 + ki
  //   - For 8 bands at same k: load 8 elements at stride 16
  //   - For same band across 8 k: contiguous at mi*16 + 0..7
  // Strategy: load 8 k values at each band, transpose in ZA to get 8 bands
  // =========================================================================
  static __forceinline void microkernel_kc(const int K, const int k_start,
                                           const int k_len,
                                           const T* __restrict__ a_base1,
                                           const T* __restrict__ a_base2,
                                           const T* __restrict__ b_ptr,
                                           const int64_t b_stride,
                                           const pred_t ptrue) __arm_streaming
#ifndef __arm_sim
      __arm_inout("za")
#endif
  {
    const int k_end = k_start + k_len;
    for (int k = k_start; k < k_end; ++k) {
      const int bk = k / SVCNT;
      const int ki = k % SVCNT;
      // After transpose on packed (stride 16): element at mi*16 + ki
      // For 8 bands (mi=0..7) at same k: stride 16 between them
      // Use gather load with stride 16
      const T* a1 = a_base1 + bk * SVCNT * ZA_TILE_M + ki;  // bi=0 block
      const T* a2 = a_base2 + bk * SVCNT * ZA_TILE_M + ki;  // bi=1 block

      // Gather load: 8 bands at stride 16
      svint64_t idx =
          svindex_s64(0, ZA_TILE_M);  // 0, 16, 32, 48, 64, 80, 96, 112
      vec_t a0 = svld1_gather_index(ptrue, a1, idx);
      vec_t a1v = svld1_gather_index(ptrue, a2, idx);

      vec_t b0 = svld1(ptrue, b_ptr);
      svmopa_za64_f64_m(0, ptrue, ptrue, a0, b0);
      svmopa_za64_f64_m(4, ptrue, ptrue, a1v, b0);

      vec_t b1 = svld1(ptrue, b_ptr + SVCNT);
      svmopa_za64_f64_m(1, ptrue, ptrue, a0, b1);
      svmopa_za64_f64_m(5, ptrue, ptrue, a1v, b1);

      vec_t b2 = svld1(ptrue, b_ptr + 2 * SVCNT);
      svmopa_za64_f64_m(2, ptrue, ptrue, a0, b2);
      svmopa_za64_f64_m(6, ptrue, ptrue, a1v, b2);

      vec_t b3 = svld1(ptrue, b_ptr + 3 * SVCNT);
      svmopa_za64_f64_m(3, ptrue, ptrue, a0, b3);
      svmopa_za64_f64_m(7, ptrue, ptrue, a1v, b3);

      b_ptr += b_stride;
    }
  }

  // =========================================================================
  // Compute one tile with KC blocking
  // =========================================================================
  static __forceinline void compute_tile_kc(
      const int M, const int N, const int K, const int tm, const int tn,
      const int k_start, const int k_len, const bool is_first,
      const bool is_last, const T* __restrict__ A, const T* __restrict__ B,
      T* __restrict__ D, const T alpha, const T gamma,
      const pred_t ptrue) __arm_streaming
#ifndef __arm_sim
      __arm_inout("za")
#endif
  {
    T* c_ptr = D + tm * ZA_TILE_M * N + tn * ZA_TILE_N;

    if (is_first) {
      svzero_za();
    } else {
      load_partial_c(N, c_ptr, ptrue);
    }

    // Packed format: A + tm * K * 16 + bi * 8 for band block bi
    const T* a_ptr1 = A + tm * K * ZA_TILE_M;          // bi=0: bands 0-7
    const T* a_ptr2 = A + tm * K * ZA_TILE_M + SVCNT;  // bi=1: bands 8-15
    const T* b_ptr = B + k_start * N + tn * ZA_TILE_N;

    microkernel_kc(K, k_start, k_len, a_ptr1, a_ptr2, b_ptr, N, ptrue);

    if (is_last) {
      store_c(N, c_ptr, alpha, gamma, ptrue);
    } else {
      store_partial_c(N, c_ptr, ptrue);
    }
  }

  // =========================================================================
  // Thread wrapper with MC/NC/KC cache blocking
  // =========================================================================
#ifndef __arm_sim
  __arm_new("za")
#endif
      __arm_locally_streaming static void compute_tiles_blocked(
          const int M, const int N, const int K, const int tm_start,
          const int tm_end, const T* __restrict__ A, const T* __restrict__ B,
          T* __restrict__ D, const T alpha, const T gamma) {
    pred_t ptrue = svptrue_b64();
    const int tiles_n = N / ZA_TILE_N;
    constexpr int mc_tiles = MC / ZA_TILE_M;
    constexpr int nc_tiles = NC / ZA_TILE_N;

    // KC blocking: outer loop over K
    for (int kc = 0; kc < K; kc += KC) {
      const int k_len = (kc + KC <= K) ? KC : (K - kc);
      const bool is_first = (kc == 0);
      const bool is_last = (kc + KC >= K);

      // MC blocking within this thread's tile range
      for (int mc = tm_start; mc < tm_end; mc += mc_tiles) {
        const int tm_blk_end =
            (mc + mc_tiles <= tm_end) ? mc + mc_tiles : tm_end;

        // NC blocking
        for (int nc = 0; nc < tiles_n; nc += nc_tiles) {
          const int tn_blk_end =
              (nc + nc_tiles <= tiles_n) ? nc + nc_tiles : tiles_n;

          // Process tiles within MC/NC block
          for (int tm = mc; tm < tm_blk_end; ++tm) {
            for (int tn = nc; tn < tn_blk_end; ++tn) {
              compute_tile_kc(M, N, K, tm, tn, kc, k_len, is_first, is_last, A,
                              B, D, alpha, gamma, ptrue);
            }
          }
        }
      }
    }
  }

  // =========================================================================
  // Thread wrapper (no cache blocking, for backward compat)
  // =========================================================================
#ifndef __arm_sim
  __arm_new("za")
#endif
      __arm_locally_streaming static void compute_tiles_thread(
          const int M, const int N, const int K, const int tm_start,
          const int tm_end, const T* __restrict__ A, const T* __restrict__ B,
          T* __restrict__ D, const T alpha, const T gamma) {
    pred_t ptrue = svptrue_b64();
    const int tiles_n = N / ZA_TILE_N;

    for (int tm = tm_start; tm < tm_end; ++tm) {
      for (int tn = 0; tn < tiles_n; ++tn) {
        compute_tile(M, N, K, tm, tn, A, B, D, alpha, gamma, ptrue);
      }
    }
  }

  // =========================================================================
  // Main compute: transpose A in-place, then GEMM with cache blocking
  // =========================================================================
  static void compute(const int M, const int N, const int K, T* __restrict__ A,
                      const T* __restrict__ B, T* __restrict__ D, const T alpha,
                      const T gamma) {
    // Step 1: In-place 8x8 block transpose of A
    transpose_A_inplace(M, K, A);

    // Step 2: GEMM on transposed A with cache blocking
    const int tiles_m = M / ZA_TILE_M;
    const int num_threads = omp_get_max_threads();
    const int tiles_per_thread = (tiles_m + num_threads - 1) / num_threads;

#pragma omp parallel
    {
      const int tid = omp_get_thread_num();
      const int tm_start = tid * tiles_per_thread;
      const int tm_end = (tm_start + tiles_per_thread <= tiles_m)
                             ? tm_start + tiles_per_thread
                             : tiles_m;

      if (tm_start < tiles_m) {
        compute_tiles_blocked(M, N, K, tm_start, tm_end, A, B, D, alpha, gamma);
      }
    }
  }

  // =========================================================================
  // Benchmark wrapper
  // =========================================================================
  static double compute_benchmark(const int M, const int N, const int K,
                                  T* __restrict__ A_orig,
                                  const T* __restrict__ B, T* __restrict__ D,
                                  const T alpha, const T gamma) {
    // Make a copy of A for each iteration (since transpose is in-place)
    T* A = hbm_alloc<T>(M * K);

    // Warmup
    for (int i = 0; i < WITERS; ++i) {
      compute(M, N, K, A, B, D, alpha, gamma);
    }

    auto start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < ITERS; ++i) {
      compute(M, N, K, A, B, D, alpha, gamma);
    }
    auto end = std::chrono::high_resolution_clock::now();

    hbm_free(A);

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
  printf("Testing GEMM<%s> TRP (packed input): M=%d N=%d K=%d\n", type_name, M,
         N, K);

  omp_set_num_threads(NUM_THREADS);

  const int tiles_m = M / gemm<T>::ZA_TILE_M;  // M/16

  // A is packed format [M/16][K][16], B is row-major KxN
  T* A_packed = hbm_alloc<T>(M * K);
  T* B = hbm_alloc<T>(K * N);
  T* D = hbm_alloc<T>(M * N);

  // Initialize A in packed format: A_packed[(tm * K + k) * 16 + ml] =
  // A[tm*16+ml, k]
  for (int tm = 0; tm < tiles_m; ++tm) {
    for (int k = 0; k < K; ++k) {
      for (int ml = 0; ml < gemm<T>::ZA_TILE_M; ++ml) {
        int row = tm * gemm<T>::ZA_TILE_M + ml;
        A_packed[(tm * K + k) * gemm<T>::ZA_TILE_M + ml] =
            static_cast<T>((row + 1) * 0.01 + (k + 1) * 0.001);
      }
    }
  }
  // Initialize B (row-major)
  for (int k = 0; k < K; ++k) {
    for (int j = 0; j < N; ++j) {
      B[k * N + j] = static_cast<T>((k + 1) * 0.001 + (j + 1) * 0.01);
    }
  }
  std::memset(D, 0, M * N * sizeof(T));

  // Make a copy of A since compute modifies it in-place
  T* A_copy = hbm_alloc<T>(M * K);
  std::memcpy(A_copy, A_packed, M * K * sizeof(T));

  gemm<T>::compute(M, N, K, A_copy, B, D, alpha, gamma);

#ifdef SKIP_VERIFY
  printf("  SKIPPED verification (SKIP_VERIFY defined)\n");
  hbm_free(A_packed);
  hbm_free(A_copy);
  hbm_free(B);
  hbm_free(D);
  return true;
#else
  // Reference (naive kernel on packed A)
  T* D_ref = hbm_alloc<T>(M * N);
  std::memset(D_ref, 0, M * N * sizeof(T));
  for (int i = 0; i < M; ++i) {
    int tm = i / gemm<T>::ZA_TILE_M;
    int ml = i % gemm<T>::ZA_TILE_M;
    for (int j = 0; j < N; ++j) {
      T sum = 0;
      for (int k = 0; k < K; ++k) {
        // Packed format: A[i, k] = A_packed[(tm * K + k) * 16 + ml]
        sum += A_packed[(tm * K + k) * gemm<T>::ZA_TILE_M + ml] * B[k * N + j];
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

  hbm_free(A_packed);
  hbm_free(A_copy);
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
  printf("SME GEMM with In-Place 8x8 Block Transpose (Packed Input)\n");
  printf("SVL=%d, BLOCK_SIZE=%d, ZA_TILE_M=%d, ZA_TILE_N=%d\n", SVL,
         gemm<double>::BLOCK_SIZE, gemm<double>::ZA_TILE_M,
         gemm<double>::ZA_TILE_N);
  printf("Packed format: A[tm][k][16] for row tm*16+ml at col k\n");
  printf("Cache blocking: MC=%d, NC=%d, KC=%d\n", MC, NC, KC);
  printf("Threads=%d\n\n", NUM_THREADS);

#ifndef SKIP_VERIFY
  int passed = 0, total = 0;

  // Test 1: Basic small test
  printf("=== Test 1: Small (M=16, K=8, N=32) ===\n");
  if (test_gemm<double>(16, 32, 8, 1.0, 0.0)) passed++;
  total++;

  // Test 2: Larger K
  printf("\n=== Test 2: M=32, K=64, N=64 ===\n");
  if (test_gemm<double>(32, 64, 64, 1.0, 0.0)) passed++;
  total++;

  // Test 3: Target case
  printf("\n=== Test 3: M=4096, K=64, N=64 (target) ===\n");
  if (test_gemm<double>(4096, 64, 64, 1.0, 0.0)) passed++;
  total++;

  // Test 4: With scaling
  printf("\n=== Test 4: M=4096, K=64, N=64 with alpha/gamma ===\n");
  if (test_gemm<double>(4096, 64, 64, 2.0, 0.5)) passed++;
  total++;

  printf("\n=== Summary: %d/%d tests passed ===\n", passed, total);
  if (passed != total) return 1;
#endif

  // Benchmark
  int M = 4096, N = 64, K = 64;
  if (argc == 4) {
    M = std::atoi(argv[1]);
    N = std::atoi(argv[2]);
    K = std::atoi(argv[3]);
  }

  printf("\n=== Benchmark: M=%d N=%d K=%d ===\n", M, N, K);

  const int tiles_m = M / gemm<double>::ZA_TILE_M;
  double* A_packed = hbm_alloc<double>(M * K);
  double* B = hbm_alloc<double>(K * N);
  double* D = hbm_alloc<double>(M * N);

  // Initialize A in packed format
  for (int tm = 0; tm < tiles_m; ++tm) {
    for (int k = 0; k < K; ++k) {
      for (int ml = 0; ml < gemm<double>::ZA_TILE_M; ++ml) {
        int idx = (tm * K + k) * gemm<double>::ZA_TILE_M + ml;
        A_packed[idx] = 0.001 * (idx % 1000);
      }
    }
  }
  for (int i = 0; i < K * N; ++i) B[i] = 0.001 * (i % 1000);
  std::memset(D, 0, M * N * sizeof(double));

  omp_set_num_threads(NUM_THREADS);
  double time_ns =
      gemm<double>::compute_benchmark(M, N, K, A_packed, B, D, 1.0, 0.0);
  double time_us = time_ns / 1000.0;
  double flops = 2.0 * M * N * K;
  double gflops = flops / time_ns;

  // CSV output: MC,NC,KC,M,N,K,time_us,GFLOP/s
  printf("%d,%d,%d,%d,%d,%d,%.2f,%.2f\n", MC, NC, KC, M, N, K, time_us, gflops);

  hbm_free(A_packed);
  hbm_free(B);
  hbm_free(D);

  return 0;
}
