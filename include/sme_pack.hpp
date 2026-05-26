// SME Packing Functions Header
// Include this to use pack/unpack functions

#pragma once

#include <arm_sve.h>

#ifndef SVL
#define SVL 64
#endif

// =============================================================================
// Layout definitions:
//
// Array_4D_Packed_16 (band-tile packed): data[(b/16) * Nd * 16 + g * 16 + b%16]
//   - nb/16 band tiles, Nd grids per tile, 16 bands packed
//   - For fixed g, 16 consecutive bands are contiguous
//
// Grid-tile packed (for TRP): data[(g/16) * nb * 16 + b * 16 + g%16]
//   - Nd/16 grid tiles, nb bands per tile, 16 grids packed
//   - For fixed b, 16 consecutive grids are contiguous
//
// Column-major dense: data[g + b * Nd]
//   - Nd grids contiguous per band (column)
//
// Row-major dense: data[b * Nd + g]
//   - Nd grids contiguous per band (row)
// =============================================================================

template <typename T>
class sme_pack {
 public:
  static constexpr int SVCNT = SVL / sizeof(T);  // 8 for f64
  static constexpr int PACK_G = 16;              // Grid packing factor

  using vec_t = svfloat64_t;
  using pred_t = svbool_t;

  // Pack from column-major [Nd, nb] to [Nd/16, nb, 16]
  // src[g, b] = src[g + b * Nd]
  // dst[g, b] = dst[(g/16) * nb * 16 + b * 16 + g%16]
  __arm_locally_streaming static void pack_c16_tile(const int Nd, const int nb,
                                                    const int g_tile,
                                                    const T* __restrict__ src,
                                                    T* __restrict__ dst) {
    pred_t ptrue = svptrue_b64();

    const T* src_base = src + g_tile * PACK_G;
    T* dst_base = dst + g_tile * nb * PACK_G;

    for (int b = 0; b < nb; ++b) {
      const T* s = src_base + b * Nd;
      vec_t v0 = svld1(ptrue, s);
      vec_t v1 = svld1(ptrue, s + SVCNT);

      T* d = dst_base + b * PACK_G;
      svst1(ptrue, d, v0);
      svst1(ptrue, d + SVCNT, v1);
    }
  }

  // Pack from row-major [nb, Nd] to [Nd/16, nb, 16]
  // src[b, g] = src[b * Nd + g]
  // dst[g, b] = dst[(g/16) * nb * 16 + b * 16 + g%16]
  __arm_locally_streaming static void pack_r16_tile(const int Nd, const int nb,
                                                    const int g_tile,
                                                    const T* __restrict__ src,
                                                    T* __restrict__ dst) {
    pred_t ptrue = svptrue_b64();

    T* dst_base = dst + g_tile * nb * PACK_G;

    for (int b = 0; b < nb; ++b) {
      const T* s = src + b * Nd + g_tile * PACK_G;
      vec_t v0 = svld1(ptrue, s);
      vec_t v1 = svld1(ptrue, s + SVCNT);

      T* d = dst_base + b * PACK_G;
      svst1(ptrue, d, v0);
      svst1(ptrue, d + SVCNT, v1);
    }
  }

  // Main entry: pack_c16 (column-major to packed)
  static void pack_c16(const int Nd, const int nb,
                       const T* __restrict__ src,  // [Nd, nb] column-major
                       T* __restrict__ dst) {      // [Nd/16, nb, 16] packed
    const int g_tiles = Nd / PACK_G;

#pragma omp parallel for schedule(static)
    for (int g_tile = 0; g_tile < g_tiles; ++g_tile) {
      pack_c16_tile(Nd, nb, g_tile, src, dst);
    }
  }

  // Main entry: pack_r16 (row-major to packed)
  static void pack_r16(const int Nd, const int nb,
                       const T* __restrict__ src,  // [nb, Nd] row-major
                       T* __restrict__ dst) {      // [Nd/16, nb, 16] packed
    const int g_tiles = Nd / PACK_G;

#pragma omp parallel for schedule(static)
    for (int g_tile = 0; g_tile < g_tiles; ++g_tile) {
      pack_r16_tile(Nd, nb, g_tile, src, dst);
    }
  }

  // Unpack from [Nd/16, nb, 16] back to column-major [Nd, nb]
  __arm_locally_streaming static void unpack_c16_tile(const int Nd,
                                                      const int nb,
                                                      const int g_tile,
                                                      const T* __restrict__ src,
                                                      T* __restrict__ dst) {
    pred_t ptrue = svptrue_b64();

    const T* src_base = src + g_tile * nb * PACK_G;
    T* dst_base = dst + g_tile * PACK_G;

    for (int b = 0; b < nb; ++b) {
      const T* s = src_base + b * PACK_G;
      vec_t v0 = svld1(ptrue, s);
      vec_t v1 = svld1(ptrue, s + SVCNT);

      T* d = dst_base + b * Nd;
      svst1(ptrue, d, v0);
      svst1(ptrue, d + SVCNT, v1);
    }
  }

  static void unpack_c16(const int Nd, const int nb,
                         const T* __restrict__ src,  // [Nd/16, nb, 16] packed
                         T* __restrict__ dst) {      // [Nd, nb] column-major
    const int g_tiles = Nd / PACK_G;

#pragma omp parallel for schedule(static)
    for (int g_tile = 0; g_tile < g_tiles; ++g_tile) {
      unpack_c16_tile(Nd, nb, g_tile, src, dst);
    }
  }

  // Unpack from [Nd/16, nb, 16] to row-major [nb, Nd]
  static void unpack_r16(const int Nd, const int nb,
                         const T* __restrict__ src,  // [Nd/16, nb, 16] packed
                         T* __restrict__ dst) {      // [nb, Nd] row-major
    const int g_tiles = Nd / PACK_G;

#pragma omp parallel for schedule(static)
    for (int g_tile = 0; g_tile < g_tiles; ++g_tile) {
      pred_t ptrue = svptrue_b64();
      const T* src_base = src + g_tile * nb * PACK_G;

      for (int b = 0; b < nb; ++b) {
        const T* s = src_base + b * PACK_G;
        vec_t v0 = svld1(ptrue, s);
        vec_t v1 = svld1(ptrue, s + SVCNT);

        T* d = dst + b * Nd + g_tile * PACK_G;
        svst1(ptrue, d, v0);
        svst1(ptrue, d + SVCNT, v1);
      }
    }
  }

  // =========================================================================
  // Convert between Array_4D_Packed_16 (band-tile) and grid-tile packed formats
  // using SME ZA tiles for efficient 16×16 transpose
  //
  // Band-tile (Array_4D_Packed_16): src[(b/16)*Nd*16 + g*16 + b%16]
  //   - For fixed g, 16 consecutive bands (within a tile) are contiguous
  //
  // Grid-tile (TRP format): dst[(g/16)*nb*16 + b*16 + g%16]
  //   - For fixed b, 16 consecutive grids (within a tile) are contiguous
  //
  // This is a transpose: band-tile has (g, b) layout per 16×16 block,
  // grid-tile has (b, g) layout. We use 4 ZA tiles (8×8 each) to transpose.
  // =========================================================================

  // Convert band-tile packed to grid-tile packed using ZA transpose
#ifndef __arm_sim
  __arm_new("za")
#endif
      __arm_locally_streaming static void band_to_grid_tile_block(
          const int Nd, const int nb, const int gt, const int bt,
          const T* __restrict__ src, T* __restrict__ dst) {
    pred_t ptrue = svptrue_b64();

    // In band-tile: src[(b/16)*Nd*16 + g*16 + b%16]
    // For bt, gt block: src[bt*Nd*16 + (gt*16+g_local)*16 + b_local]
    // Row g_local has 16 contiguous bands
    const T* src_base = src + bt * Nd * 16 + gt * 16 * 16;

    // Load 16 rows directly into ZA (each row = 16 bands for one grid)
    // Tiles 0,1: g 0-7; Tiles 2,3: g 8-15
    for (int r = 0; r < 8; ++r) {
      vec_t v0 = svld1(ptrue, src_base + r * 16);      // b 0-7
      vec_t v1 = svld1(ptrue, src_base + r * 16 + 8);  // b 8-15
      svwrite_hor_za64_f64_m(0, r, ptrue, v0);
      svwrite_hor_za64_f64_m(1, r, ptrue, v1);
    }
    for (int r = 0; r < 8; ++r) {
      vec_t v0 = svld1(ptrue, src_base + (r + 8) * 16);
      vec_t v1 = svld1(ptrue, src_base + (r + 8) * 16 + 8);
      svwrite_hor_za64_f64_m(2, r, ptrue, v0);
      svwrite_hor_za64_f64_m(3, r, ptrue, v1);
    }

    // Read columns (transpose) and store directly to grid-tile format
    // In grid-tile: dst[(g/16)*nb*16 + b*16 + g%16]
    // For gt, bt block: dst[gt*nb*16 + (bt*16+b_local)*16 + g_local]
    // Row b_local has 16 contiguous grids
    T* dst_base = dst + gt * nb * 16 + bt * 16 * 16;

    // Store rows 0-7 (b_local 0-7): read col c from tiles 0,2
    for (int c = 0; c < 8; ++c) {
      vec_t v0, v2;
      v0 = svread_ver_za64_f64_m(v0, ptrue, 0, c);  // g 0-7
      v2 = svread_ver_za64_f64_m(v2, ptrue, 2, c);  // g 8-15
      svst1(ptrue, dst_base + c * 16, v0);
      svst1(ptrue, dst_base + c * 16 + 8, v2);
    }
    // Store rows 8-15 (b_local 8-15): read col c from tiles 1,3
    for (int c = 0; c < 8; ++c) {
      vec_t v1, v3;
      v1 = svread_ver_za64_f64_m(v1, ptrue, 1, c);
      v3 = svread_ver_za64_f64_m(v3, ptrue, 3, c);
      svst1(ptrue, dst_base + (c + 8) * 16, v1);
      svst1(ptrue, dst_base + (c + 8) * 16 + 8, v3);
    }
  }

  // Main entry: band_to_grid_tile
  static void band_to_grid_tile(
      const int Nd, const int nb,
      const T* __restrict__ src,  // [nb/16, Nd, 16] band-tile
      T* __restrict__ dst) {      // [Nd/16, nb, 16] grid-tile
    const int g_tiles = Nd / 16;
    const int b_tiles = nb / 16;

#pragma omp parallel for collapse(2) schedule(static)
    for (int gt = 0; gt < g_tiles; ++gt) {
      for (int bt = 0; bt < b_tiles; ++bt) {
        band_to_grid_tile_block(Nd, nb, gt, bt, src, dst);
      }
    }
  }

  // Convert grid-tile packed to band-tile packed using ZA transpose
#ifndef __arm_sim
  __arm_new("za")
#endif
      __arm_locally_streaming static void grid_to_band_tile_block(
          const int Nd, const int nb, const int gt, const int bt,
          const T* __restrict__ src, T* __restrict__ dst) {
    pred_t ptrue = svptrue_b64();

    // In grid-tile: src[(g/16)*nb*16 + b*16 + g%16]
    // For gt, bt block: src[gt*nb*16 + (bt*16+b_local)*16 + g_local]
    // Row b_local has 16 contiguous grids
    const T* src_base = src + gt * nb * 16 + bt * 16 * 16;

    // Load 16 rows directly into ZA (each row = 16 grids for one band)
    for (int r = 0; r < 8; ++r) {
      vec_t v0 = svld1(ptrue, src_base + r * 16);
      vec_t v1 = svld1(ptrue, src_base + r * 16 + 8);
      svwrite_hor_za64_f64_m(0, r, ptrue, v0);
      svwrite_hor_za64_f64_m(1, r, ptrue, v1);
    }
    for (int r = 0; r < 8; ++r) {
      vec_t v0 = svld1(ptrue, src_base + (r + 8) * 16);
      vec_t v1 = svld1(ptrue, src_base + (r + 8) * 16 + 8);
      svwrite_hor_za64_f64_m(2, r, ptrue, v0);
      svwrite_hor_za64_f64_m(3, r, ptrue, v1);
    }

    // Read columns (transpose) and store directly to band-tile format
    // In band-tile: dst[(b/16)*Nd*16 + g*16 + b%16]
    // For bt, gt block: dst[bt*Nd*16 + (gt*16+g_local)*16 + b_local]
    // Row g_local has 16 contiguous bands
    T* dst_base = dst + bt * Nd * 16 + gt * 16 * 16;

    // Store rows 0-7 (g_local 0-7): read col c from tiles 0,2
    for (int c = 0; c < 8; ++c) {
      vec_t v0, v2;
      v0 = svread_ver_za64_f64_m(v0, ptrue, 0, c);
      v2 = svread_ver_za64_f64_m(v2, ptrue, 2, c);
      svst1(ptrue, dst_base + c * 16, v0);
      svst1(ptrue, dst_base + c * 16 + 8, v2);
    }
    // Store rows 8-15 (g_local 8-15): read col c from tiles 1,3
    for (int c = 0; c < 8; ++c) {
      vec_t v1, v3;
      v1 = svread_ver_za64_f64_m(v1, ptrue, 1, c);
      v3 = svread_ver_za64_f64_m(v3, ptrue, 3, c);
      svst1(ptrue, dst_base + (c + 8) * 16, v1);
      svst1(ptrue, dst_base + (c + 8) * 16 + 8, v3);
    }
  }

  // Main entry: grid_to_band_tile
  static void grid_to_band_tile(
      const int Nd, const int nb,
      const T* __restrict__ src,  // [Nd/16, nb, 16] grid-tile
      T* __restrict__ dst) {      // [nb/16, Nd, 16] band-tile
    const int g_tiles = Nd / 16;
    const int b_tiles = nb / 16;

#pragma omp parallel for collapse(2) schedule(static)
    for (int gt = 0; gt < g_tiles; ++gt) {
      for (int bt = 0; bt < b_tiles; ++bt) {
        grid_to_band_tile_block(Nd, nb, gt, bt, src, dst);
      }
    }
  }
};

// C API wrappers
extern "C" {

void linalg_pack_c16_f64(const int Nd, const int nb, const double* src,
                         double* dst);

void linalg_pack_r16_f64(const int Nd, const int nb, const double* src,
                         double* dst);

void linalg_unpack_c16_f64(const int Nd, const int nb, const double* src,
                           double* dst);

void linalg_unpack_r16_f64(const int Nd, const int nb, const double* src,
                           double* dst);

}  // extern "C"

// Inline implementations of C API (when using header-only)
inline void linalg_pack_c16_f64(const int Nd, const int nb, const double* src,
                                double* dst) {
  sme_pack<double>::pack_c16(Nd, nb, src, dst);
}

inline void linalg_pack_r16_f64(const int Nd, const int nb, const double* src,
                                double* dst) {
  sme_pack<double>::pack_r16(Nd, nb, src, dst);
}

inline void linalg_unpack_c16_f64(const int Nd, const int nb, const double* src,
                                  double* dst) {
  sme_pack<double>::unpack_c16(Nd, nb, src, dst);
}

inline void linalg_unpack_r16_f64(const int Nd, const int nb, const double* src,
                                  double* dst) {
  sme_pack<double>::unpack_r16(Nd, nb, src, dst);
}
