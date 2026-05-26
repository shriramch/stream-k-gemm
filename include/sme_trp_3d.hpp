// SME TRP GEMM with 3D Cache Blocking
// Rotation: Psi_new = Psi * Q (no alpha/gamma - CheFSI never needs them)
//
// Input A:  grid-packed [Nd/16, nb, 16] - 16 grids contiguous per band
// Input B:  row-major [nb, nb]
// Output D: band-packed [nb/16, Nd, 16] - 16 bands contiguous per grid
//
// 3D Blocking Strategy:
//   MC: grid tiles (A panel, output rows)
//   NC: output bands (B panel columns, output cols)
//   KC: input bands (reduction dimension)
//
// Loop order (outer to inner):
//   NC blocks -> MC blocks -> KC blocks -> microtiles
//
// This maximizes B reuse (NC outer) and A reuse (MC middle)

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

// 3D blocking parameters for TRP (tune for L2/L3)
// TRP_MC * 16 * TRP_KC * 8 bytes = A panel size
// TRP_KC * TRP_NC * 8 bytes = B panel size
// TRP_MC * 16 * TRP_NC * 8 bytes = C panel size
#ifndef TRP_MC
#define TRP_MC 64  // grid tiles per M block (64*16 = 1024 grids)
#endif

#ifndef TRP_NC
#define TRP_NC 128  // output bands per N block
#endif

#ifndef TRP_KC
#define TRP_KC 128  // input bands per K block
#endif

template <typename T>
class sme_gemm_trp_3d {
 public:
  static constexpr int SVCNT = SVL / sizeof(T);  // 8 for f64
  static constexpr int TILE_G = 16;              // 16 grids per microtile
  static constexpr int TILE_BP = 32;  // 32 output bands per microtile

  using vec_t = svfloat64_t;
  using pred_t = svbool_t;

  // Microkernel: accumulate over [k_start, k_end)
  // first_k: if true, zero ZA; if false, accumulate
  static __forceinline void microkernel(const int Nd, const int nb,
                                        const int g_tile, const int bp_base,
                                        const int k_start, const int k_end,
                                        const bool first_k,
                                        const T* __restrict__ A,
                                        const T* __restrict__ B,
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

  // Store 16×32 tile directly to band-packed format (no scaling)
  static __forceinline void store_tile(const int Nd, const int nb,
                                       const int g_tile, const int bp_base,
                                       T* __restrict__ D,
                                       const pred_t ptrue) __arm_streaming
#ifndef __arm_sim
      __arm_inout("za")
#endif
  {
    const int bt0 = bp_base / 16;
    const int bt1 = bt0 + 1;

    // First 8 grids (ZA0,1,2,3)
    for (int r = 0; r < SVCNT; ++r) {
      const int g = g_tile * 16 + r;
      T* d_ptr0 = D + bt0 * Nd * 16 + g * 16;
      T* d_ptr1 = D + bt1 * Nd * 16 + g * 16;

      vec_t row0, row1, row2, row3;
      row0 = svread_hor_za64_f64_m(row0, ptrue, 0, r);
      row1 = svread_hor_za64_f64_m(row1, ptrue, 1, r);
      row2 = svread_hor_za64_f64_m(row2, ptrue, 2, r);
      row3 = svread_hor_za64_f64_m(row3, ptrue, 3, r);

      svst1(ptrue, d_ptr0, row0);
      svst1(ptrue, d_ptr0 + 8, row1);
      svst1(ptrue, d_ptr1, row2);
      svst1(ptrue, d_ptr1 + 8, row3);
    }

    // Next 8 grids (ZA4,5,6,7)
    for (int r = 0; r < SVCNT; ++r) {
      const int g = g_tile * 16 + 8 + r;
      T* d_ptr0 = D + bt0 * Nd * 16 + g * 16;
      T* d_ptr1 = D + bt1 * Nd * 16 + g * 16;

      vec_t row4, row5, row6, row7;
      row4 = svread_hor_za64_f64_m(row4, ptrue, 4, r);
      row5 = svread_hor_za64_f64_m(row5, ptrue, 5, r);
      row6 = svread_hor_za64_f64_m(row6, ptrue, 6, r);
      row7 = svread_hor_za64_f64_m(row7, ptrue, 7, r);

      svst1(ptrue, d_ptr0, row4);
      svst1(ptrue, d_ptr0 + 8, row5);
      svst1(ptrue, d_ptr1, row6);
      svst1(ptrue, d_ptr1 + 8, row7);
    }
  }

  // Compute one microtile with KC-blocked reduction
  static __forceinline void compute_microtile(
      const int Nd, const int nb, const int g_tile, const int bp_base,
      const int kc_start, const int kc_end, const T* __restrict__ A,
      const T* __restrict__ B, T* __restrict__ D,
      const pred_t ptrue) __arm_streaming
#ifndef __arm_sim
      __arm_inout("za")
#endif
  {
    // KC-blocked reduction
    bool first_k = true;
    for (int kb = kc_start; kb < kc_end; kb += TRP_KC) {
      int k_end = kb + TRP_KC;
      if (k_end > kc_end) k_end = kc_end;
      microkernel(Nd, nb, g_tile, bp_base, kb, k_end, first_k, A, B, ptrue);
      first_k = false;
    }
    store_tile(Nd, nb, g_tile, bp_base, D, ptrue);
  }

  // Process one MC×NC block with KC blocking
#ifndef __arm_sim
  __arm_new("za")
#endif
      __arm_locally_streaming static void compute_block(
          const int Nd, const int nb, const int mc_start,
          const int mc_end,                      // grid tile range
          const int nc_start, const int nc_end,  // output band range
          const T* __restrict__ A, const T* __restrict__ B, T* __restrict__ D) {
    pred_t ptrue = svptrue_b64();

    // NC inner (output bands) - reuse B[kc_start:kc_end, nc_start:nc_end]
    for (int bp = nc_start; bp < nc_end; bp += TILE_BP) {
      // MC innermost (grid tiles) - reuse A[mc_start:mc_end, kc_start:kc_end]
      for (int gt = mc_start; gt < mc_end; ++gt) {
        // Full reduction over all K (KC blocks handled inside)
        compute_microtile(Nd, nb, gt, bp, 0, nb, A, B, D, ptrue);
      }
    }
  }

  // Main entry point with 3D blocking
  // A: grid-packed [Nd/16, nb, 16]
  // B: row-major [nb, nb]
  // D: band-packed [nb/16, Nd, 16]
  static void compute(const int Nd, const int nb, const T* __restrict__ A,
                      const T* __restrict__ B, T* __restrict__ D) {
    const int g_tiles = Nd / TILE_G;
    const int mc_blocks = (g_tiles + TRP_MC - 1) / TRP_MC;
    const int nc_blocks = (nb + TRP_NC - 1) / TRP_NC;

    // Parallelize over MC×NC blocks
#pragma omp parallel for collapse(2) schedule(dynamic)
    for (int nc_blk = 0; nc_blk < nc_blocks; ++nc_blk) {
      for (int mc_blk = 0; mc_blk < mc_blocks; ++mc_blk) {
        const int nc_start = nc_blk * TRP_NC;
        int nc_end = nc_start + TRP_NC;
        if (nc_end > nb) nc_end = nb;

        const int mc_start = mc_blk * TRP_MC;
        int mc_end = mc_start + TRP_MC;
        if (mc_end > g_tiles) mc_end = g_tiles;

        compute_block(Nd, nb, mc_start, mc_end, nc_start, nc_end, A, B, D);
      }
    }
  }
};

// Convenience alias
template <typename T>
using sme_gemm_trp = sme_gemm_trp_3d<T>;
