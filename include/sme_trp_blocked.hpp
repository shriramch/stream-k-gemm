// SME TRP GEMM with Cache Blocking
// Rotation: Psi_new = Psi * Q
//
// Input A:  grid-packed [K/16, nb, 16] - 16 grids contiguous per band
// Input B:  row-major [nb, nb]
// Output D: band-packed [nb/16, K, 16] - 16 bands contiguous per grid
//
// Cache Blocking Strategy:
// - K-blocking: block inner reduction (input bands) to fit B in L2
// - Loop order: bp → g_tile to maximize B reuse
// - Zero intermediate buffers. Zero format conversions.

#pragma once

#include <arm_sme.h>
#include <arm_sve.h>
#include <omp.h>

#ifndef SVL
#define SVL 64
#endif

#ifndef __forceinline
#define __forceinline inline __attribute__((always_inline))
#endif

// Cache blocking parameters
#ifndef MC
#define MC 128
#endif

#ifndef NC
#define NC 128
#endif

#ifndef KC
#define KC 128
#endif

template <typename T>
class sme_gemm_trp_blocked {
 public:
  static constexpr int SVCNT = SVL / sizeof(T);  // 8 for f64
  static constexpr int TILE_G = 16;              // 16 grids per tile
  static constexpr int TILE_BP = 32;             // 32 output bands per tile
  static constexpr int KB = K_BLOCK;             // K-block size

  using vec_t = svfloat64_t;
  using pred_t = svbool_t;

  // Microkernel with K-blocking: accumulate over [k_start, k_end)
  // first_k: if true, zero ZA; if false, accumulate
  static __forceinline void microkernel_blocked(
      const int K, const int nb, const int g_tile, const int bp_base,
      const int k_start, const int k_end, const bool first_k,
      const T* __restrict__ A, const T* __restrict__ B,
      const pred_t ptrue) __arm_streaming
#ifndef __arm_sim
      __arm_inout("za")
#endif
  {
    if (first_k) {
      svzero_za();
    }

    const T* a_tile_base = A + g_tile * nb * 16;

    for (int b = k_start; b < k_end; ++b) {
      const T* a_ptr = a_tile_base + b * 16;
      vec_t a0 = svld1(ptrue, a_ptr);
      vec_t a1 = svld1(ptrue, a_ptr + 8);

      const T* b_ptr = B + b * nb + bp_base;
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
    }
  }

  // Store 16×32 tile directly to band-packed format
  // D: [nb/16, K, 16] - 16 bands contiguous per grid point
  static __forceinline void store_tile_band_packed(
      const int K, const int nb, const int g_tile, const int bp_base,
      T* __restrict__ D, const T alpha, const T gamma,
      const pred_t ptrue) __arm_streaming
#ifndef __arm_sim
      __arm_inout("za")
#endif
  {
    // 32 output bands span 2 band-tiles
    const int bt0 = bp_base / 16;
    const int bt1 = bt0 + 1;

    // Broadcast scalars to vectors
    vec_t v_alpha = svdup_f64(alpha);
    vec_t v_gamma = svdup_f64(gamma);

    // First 8 grids (ZA0,1,2,3)
    for (int r = 0; r < SVCNT; ++r) {
      const int g = g_tile * 16 + r;

      vec_t row0, row1;
      row0 = svread_hor_za64_f64_m(row0, ptrue, 0, r);
      row1 = svread_hor_za64_f64_m(row1, ptrue, 1, r);
      row0 = svadd_f64_x(ptrue, svmul_f64_x(ptrue, row0, v_alpha), v_gamma);
      row1 = svadd_f64_x(ptrue, svmul_f64_x(ptrue, row1, v_alpha), v_gamma);
      T* d_ptr0 = D + bt0 * K * 16 + g * 16;
      svst1(ptrue, d_ptr0, row0);
      svst1(ptrue, d_ptr0 + 8, row1);

      vec_t row2, row3;
      row2 = svread_hor_za64_f64_m(row2, ptrue, 2, r);
      row3 = svread_hor_za64_f64_m(row3, ptrue, 3, r);
      row2 = svadd_f64_x(ptrue, svmul_f64_x(ptrue, row2, v_alpha), v_gamma);
      row3 = svadd_f64_x(ptrue, svmul_f64_x(ptrue, row3, v_alpha), v_gamma);
      T* d_ptr1 = D + bt1 * K * 16 + g * 16;
      svst1(ptrue, d_ptr1, row2);
      svst1(ptrue, d_ptr1 + 8, row3);
    }

    // Next 8 grids (ZA4,5,6,7)
    for (int r = 0; r < SVCNT; ++r) {
      const int g = g_tile * 16 + 8 + r;

      vec_t row4, row5;
      row4 = svread_hor_za64_f64_m(row4, ptrue, 4, r);
      row5 = svread_hor_za64_f64_m(row5, ptrue, 5, r);
      row4 = svadd_f64_x(ptrue, svmul_f64_x(ptrue, row4, v_alpha), v_gamma);
      row5 = svadd_f64_x(ptrue, svmul_f64_x(ptrue, row5, v_alpha), v_gamma);
      T* d_ptr0 = D + bt0 * K * 16 + g * 16;
      svst1(ptrue, d_ptr0, row4);
      svst1(ptrue, d_ptr0 + 8, row5);

      vec_t row6, row7;
      row6 = svread_hor_za64_f64_m(row6, ptrue, 6, r);
      row7 = svread_hor_za64_f64_m(row7, ptrue, 7, r);
      row6 = svadd_f64_x(ptrue, svmul_f64_x(ptrue, row6, v_alpha), v_gamma);
      row7 = svadd_f64_x(ptrue, svmul_f64_x(ptrue, row7, v_alpha), v_gamma);
      T* d_ptr1 = D + bt1 * K * 16 + g * 16;
      svst1(ptrue, d_ptr1, row6);
      svst1(ptrue, d_ptr1 + 8, row7);
    }
  }

  // Compute one tile with K-blocking
  static __forceinline void compute_tile_blocked(
      const int K, const int nb, const int g_tile, const int bp_base,
      const T* __restrict__ A, const T* __restrict__ B, T* __restrict__ D,
      const T alpha, const T gamma, const pred_t ptrue) __arm_streaming
#ifndef __arm_sim
      __arm_inout("za")
#endif
  {
    // K-blocked reduction
    bool first_k = true;
    for (int kb = 0; kb < nb; kb += KB) {
      int k_end = kb + KB;
      if (k_end > nb) k_end = nb;
      microkernel_blocked(K, nb, g_tile, bp_base, kb, k_end, first_k, A, B,
                          ptrue);
      first_k = false;
    }
    store_tile_band_packed(K, nb, g_tile, bp_base, D, alpha, gamma, ptrue);
  }

  // Thread worker with optimal loop order: bp outer for B reuse
#ifndef __arm_sim
  __arm_new("za")
#endif
      __arm_locally_streaming static void compute_thread(
          const int K, const int nb, const int g_tile_start,
          const int g_tile_end, const T* __restrict__ A,
          const T* __restrict__ B, T* __restrict__ D, const T alpha,
          const T gamma) {
    pred_t ptrue = svptrue_b64();

    // bp OUTER: reuse B[0:nb, bp:bp+32] across all g_tiles
    for (int bp = 0; bp < nb; bp += TILE_BP) {
      for (int g_tile = g_tile_start; g_tile < g_tile_end; ++g_tile) {
        compute_tile_blocked(K, nb, g_tile, bp, A, B, D, alpha, gamma, ptrue);
      }
    }
  }

  // Main entry point
  // A: grid-packed [K/16, nb, 16]
  // B: row-major [nb, nb]
  // D: band-packed [nb/16, K, 16]
  static void compute(const int K, const int nb, const T* __restrict__ A,
                      const T* __restrict__ B, T* __restrict__ D, const T alpha,
                      const T gamma) {
    const int g_tiles = K / TILE_G;
    const int num_threads = omp_get_max_threads();
    const int tiles_per_thread = (g_tiles + num_threads - 1) / num_threads;

#pragma omp parallel
    {
      const int tid = omp_get_thread_num();
      const int g_tile_start = tid * tiles_per_thread;
      int g_tile_end = g_tile_start + tiles_per_thread;
      if (g_tile_end > g_tiles) g_tile_end = g_tiles;

      if (g_tile_start < g_tiles) {
        compute_thread(K, nb, g_tile_start, g_tile_end, A, B, D, alpha, gamma);
      }
    }
  }
};

// Convenience wrapper matching old interface name
template <typename T>
using sme_gemm_trp = sme_gemm_trp_blocked<T>;
