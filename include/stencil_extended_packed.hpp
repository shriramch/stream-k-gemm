// stencil_extended_packed.hpp
//
// Stencil operating on extended domain with packed layout
// Input: extended_packed [tile][K_ex][16], K_ex =
// (ni+2*FDn)*(nj+2*FDn)*(nk+2*FDn) Output: local_32packed [tile32][K][32], K =
// ni*nj*nk
//
// The extended array has the interior at offset (FDn, FDn, FDn) and halo around
// it. Stencil can access ALL local points without boundary checks.

#pragma once

#include <arm_sve.h>
#include <omp.h>

#include <cassert>
#include <cstdint>

#ifndef STENCIL_FDN
#define STENCIL_FDN 6
#endif

#ifndef STENCIL_TI
#define STENCIL_TI 9999
#endif

#ifndef STENCIL_TJ
#define STENCIL_TJ 9999
#endif

#ifndef STENCIL_TB
#define STENCIL_TB 9999
#endif

namespace Stencil_method {
namespace Packed {

// =============================================================================
// Extended stencil: 16-packed input -> 32-packed output
//
// Psi is stored in 16-band tiles in extended domain
// H_Psi is stored in 32-band tiles in local domain (for GEMM B panel)
//
// NOTE: SVE implementation hardcodes FDn=6 (accesses coef_x[1] through
// coef_x[6])
// =============================================================================
inline void calc_laplacian_extended_packed_16to32(
    const double* __restrict__ extended_packed,  // [tile16, K_ex, 16]
    double* __restrict__ output_32packed,        // [tile32, K, 32]
    const double* __restrict__ A_diag_packed,    // [K] diagonal values
    uint ni, uint nj, uint nk, uint nb, int FDn,
    const double* coef_x,  // [FDn+1]
    const double* coef_y,  // [FDn+1]
    const double* coef_z,  // [FDn+1]
    double coef_0) {
  assert(FDn == 6 && "SVE stencil implementation requires FDn=6");

  const uint K = ni * nj * nk;
  const uint ni_ex = ni + 2 * FDn;
  const uint nj_ex = nj + 2 * FDn;
  const uint nk_ex = nk + 2 * FDn;
  const uint K_ex = ni_ex * nj_ex * nk_ex;

  const uint stride_j_ex = ni_ex;
  const uint stride_k_ex = ni_ex * nj_ex;

  [[maybe_unused]] const uint num_tiles_16 = (nb + 15) / 16;
  [[maybe_unused]] const uint num_tiles_32 = (nb + 31) / 32;

  // SVE vector count for f64
  constexpr int SVCNT = 8;

#pragma omp parallel
  {
    // Thread-local coefficient vectors (SVE types are sizeless, can't use
    // arrays)
    svfloat64_t sve_coef0 = svdup_f64(coef_0);
    svfloat64_t sve_cx1 = svdup_f64(coef_x[1]), sve_cx2 = svdup_f64(coef_x[2]);
    svfloat64_t sve_cx3 = svdup_f64(coef_x[3]), sve_cx4 = svdup_f64(coef_x[4]);
    svfloat64_t sve_cx5 = svdup_f64(coef_x[5]), sve_cx6 = svdup_f64(coef_x[6]);
    svfloat64_t sve_cy1 = svdup_f64(coef_y[1]), sve_cy2 = svdup_f64(coef_y[2]);
    svfloat64_t sve_cy3 = svdup_f64(coef_y[3]), sve_cy4 = svdup_f64(coef_y[4]);
    svfloat64_t sve_cy5 = svdup_f64(coef_y[5]), sve_cy6 = svdup_f64(coef_y[6]);
    svfloat64_t sve_cz1 = svdup_f64(coef_z[1]), sve_cz2 = svdup_f64(coef_z[2]);
    svfloat64_t sve_cz3 = svdup_f64(coef_z[3]), sve_cz4 = svdup_f64(coef_z[4]);
    svfloat64_t sve_cz5 = svdup_f64(coef_z[5]), sve_cz6 = svdup_f64(coef_z[6]);
    svbool_t ptrue = svptrue_b64();

    const uint ti_size = (STENCIL_TI < ni) ? STENCIL_TI : ni;
    const uint tj_size = (STENCIL_TJ < nj) ? STENCIL_TJ : nj;
    const uint tb_size = (STENCIL_TB < nb) ? STENCIL_TB : nb;

    // Band blocking (outermost to keep band data in cache)
    for (uint tb = 0; tb < nb; tb += tb_size) {
      const uint tb_end = (tb + tb_size < nb) ? tb + tb_size : nb;

#pragma omp for schedule(static) collapse(3)
      for (uint k = 0; k < nk; k++) {
        for (uint jb = 0; jb < nj; jb += tj_size) {
          for (uint ib = 0; ib < ni; ib += ti_size) {
            const uint j_end = (jb + tj_size < nj) ? jb + tj_size : nj;
            const uint i_end = (ib + ti_size < ni) ? ib + ti_size : ni;

            for (uint j = jb; j < j_end; j++) {
              for (uint i = ib; i < i_end; i++) {
                // Local grid index for output
                const uint g = i + j * ni + k * ni * nj;

                // Extended grid index (center point)
                const uint g_ex = (i + FDn) + (j + FDn) * stride_j_ex +
                                  (k + FDn) * stride_k_ex;

                // Load diagonal (same for all bands)
                svfloat64_t sve_A = svdup_f64(A_diag_packed[g]);
                svfloat64_t sve_A_plus_c0 = svadd_x(ptrue, sve_A, sve_coef0);

                // Process bands in current band block
                for (uint b = tb; b < tb_end; b += SVCNT) {
                  svbool_t pg = (b + SVCNT <= nb)
                                    ? ptrue
                                    : svwhilelt_b64((uint64_t)b, (uint64_t)nb);

                  // Input: 16-band tiles
                  const uint tile16 = b / 16;
                  const uint bl16 = b % 16;

                  // Output: 32-band tiles
                  const uint tile32 = b / 32;
                  const uint bl32 = b % 32;

                  // Base address for center point in extended
                  const double* s_center =
                      extended_packed + (tile16 * K_ex + g_ex) * 16 + bl16;

                  // Load center and multiply by diagonal
                  svfloat64_t res =
                      svmul_x(pg, svld1(pg, s_center), sve_A_plus_c0);

// Macro for neighbor computation
#define APPLY_STENCIL_NEIGHBOR(R, COEF_X, COEF_Y, COEF_Z)                      \
  do {                                                                         \
    /* X neighbor r=R */                                                       \
    {                                                                          \
      const double* sp =                                                       \
          extended_packed + (tile16 * K_ex + g_ex + R) * 16 + bl16;            \
      const double* sm =                                                       \
          extended_packed + (tile16 * K_ex + g_ex - R) * 16 + bl16;            \
      res =                                                                    \
          svmla_x(pg, res, svadd_x(pg, svld1(pg, sp), svld1(pg, sm)), COEF_X); \
    }                                                                          \
    /* Y neighbor r=R */                                                       \
    {                                                                          \
      uint off = R * stride_j_ex;                                              \
      const double* sp =                                                       \
          extended_packed + (tile16 * K_ex + g_ex + off) * 16 + bl16;          \
      const double* sm =                                                       \
          extended_packed + (tile16 * K_ex + g_ex - off) * 16 + bl16;          \
      res =                                                                    \
          svmla_x(pg, res, svadd_x(pg, svld1(pg, sp), svld1(pg, sm)), COEF_Y); \
    }                                                                          \
    /* Z neighbor r=R */                                                       \
    {                                                                          \
      uint off = R * stride_k_ex;                                              \
      const double* sp =                                                       \
          extended_packed + (tile16 * K_ex + g_ex + off) * 16 + bl16;          \
      const double* sm =                                                       \
          extended_packed + (tile16 * K_ex + g_ex - off) * 16 + bl16;          \
      res =                                                                    \
          svmla_x(pg, res, svadd_x(pg, svld1(pg, sp), svld1(pg, sm)), COEF_Z); \
    }                                                                          \
  } while (0)

                  APPLY_STENCIL_NEIGHBOR(1, sve_cx1, sve_cy1, sve_cz1);
                  APPLY_STENCIL_NEIGHBOR(2, sve_cx2, sve_cy2, sve_cz2);
                  APPLY_STENCIL_NEIGHBOR(3, sve_cx3, sve_cy3, sve_cz3);
                  APPLY_STENCIL_NEIGHBOR(4, sve_cx4, sve_cy4, sve_cz4);
                  APPLY_STENCIL_NEIGHBOR(5, sve_cx5, sve_cy5, sve_cz5);
                  APPLY_STENCIL_NEIGHBOR(6, sve_cx6, sve_cy6, sve_cz6);

#undef APPLY_STENCIL_NEIGHBOR

                  // Store to 32-band packed output
                  double* d_base =
                      output_32packed + (tile32 * K + g) * 32 + bl32;
                  svst1(pg, d_base, res);
                }
              }
            }
          }
        }
      }
    }
  }
}

// =============================================================================
// Scalar reference version for testing (supports arbitrary FDn)
// =============================================================================
inline void calc_laplacian_extended_packed_16to32_scalar(
    const double* __restrict__ extended_packed,
    double* __restrict__ output_32packed,
    const double* __restrict__ A_diag_packed, uint ni, uint nj, uint nk,
    uint nb, int FDn, const double* coef_x, const double* coef_y,
    const double* coef_z, double coef_0) {
  // Scalar version supports any FDn (used for testing)
  const uint K = ni * nj * nk;
  const uint ni_ex = ni + 2 * FDn;
  const uint nj_ex = nj + 2 * FDn;
  const uint K_ex = ni_ex * nj_ex * (nk + 2 * FDn);

  const uint stride_j_ex = ni_ex;
  const uint stride_k_ex = ni_ex * nj_ex;

#pragma omp parallel for collapse(3)
  for (uint k = 0; k < nk; k++) {
    for (uint j = 0; j < nj; j++) {
      for (uint i = 0; i < ni; i++) {
        const uint g = i + j * ni + k * ni * nj;
        const uint g_ex =
            (i + FDn) + (j + FDn) * stride_j_ex + (k + FDn) * stride_k_ex;

        double A_val = A_diag_packed[g] + coef_0;

        for (uint b = 0; b < nb; b++) {
          const uint tile16 = b / 16;
          const uint bl16 = b % 16;
          const uint tile32 = b / 32;
          const uint bl32 = b % 32;

          // Center
          double res =
              extended_packed[(tile16 * K_ex + g_ex) * 16 + bl16] * A_val;

          // X neighbors
          for (int r = 1; r <= FDn; r++) {
            double s_plus =
                extended_packed[(tile16 * K_ex + g_ex + r) * 16 + bl16];
            double s_minus =
                extended_packed[(tile16 * K_ex + g_ex - r) * 16 + bl16];
            res += coef_x[r] * (s_plus + s_minus);
          }

          // Y neighbors
          for (int r = 1; r <= FDn; r++) {
            uint offset = r * stride_j_ex;
            double s_plus =
                extended_packed[(tile16 * K_ex + g_ex + offset) * 16 + bl16];
            double s_minus =
                extended_packed[(tile16 * K_ex + g_ex - offset) * 16 + bl16];
            res += coef_y[r] * (s_plus + s_minus);
          }

          // Z neighbors
          for (int r = 1; r <= FDn; r++) {
            uint offset = r * stride_k_ex;
            double s_plus =
                extended_packed[(tile16 * K_ex + g_ex + offset) * 16 + bl16];
            double s_minus =
                extended_packed[(tile16 * K_ex + g_ex - offset) * 16 + bl16];
            res += coef_z[r] * (s_plus + s_minus);
          }

          output_32packed[(tile32 * K + g) * 32 + bl32] = res;
        }
      }
    }
  }
}

// =============================================================================
// Version that outputs to 16-packed (for chebyshev filtering where we stay
// packed)
//
// NOTE: SVE implementation hardcodes FDn=6
// =============================================================================
inline void calc_laplacian_extended_packed_16to16(
    const double* __restrict__ extended_packed,
    double* __restrict__ output_16packed,
    const double* __restrict__ A_diag_packed, uint ni, uint nj, uint nk,
    uint nb, int FDn, const double* coef_x, const double* coef_y,
    const double* coef_z, double coef_0) {
  assert(FDn == 6 && "SVE stencil implementation requires FDn=6");

  const uint K = ni * nj * nk;
  const uint ni_ex = ni + 2 * FDn;
  const uint nj_ex = nj + 2 * FDn;
  const uint K_ex = ni_ex * nj_ex * (nk + 2 * FDn);

  const uint stride_j_ex = ni_ex;
  const uint stride_k_ex = ni_ex * nj_ex;
  const uint num_tiles = (nb + 15) / 16;

  constexpr int SVCNT = 8;

#pragma omp parallel
  {
    svfloat64_t sve_coef0 = svdup_f64(coef_0);
    svfloat64_t sve_cx1 = svdup_f64(coef_x[1]), sve_cx2 = svdup_f64(coef_x[2]);
    svfloat64_t sve_cx3 = svdup_f64(coef_x[3]), sve_cx4 = svdup_f64(coef_x[4]);
    svfloat64_t sve_cx5 = svdup_f64(coef_x[5]), sve_cx6 = svdup_f64(coef_x[6]);
    svfloat64_t sve_cy1 = svdup_f64(coef_y[1]), sve_cy2 = svdup_f64(coef_y[2]);
    svfloat64_t sve_cy3 = svdup_f64(coef_y[3]), sve_cy4 = svdup_f64(coef_y[4]);
    svfloat64_t sve_cy5 = svdup_f64(coef_y[5]), sve_cy6 = svdup_f64(coef_y[6]);
    svfloat64_t sve_cz1 = svdup_f64(coef_z[1]), sve_cz2 = svdup_f64(coef_z[2]);
    svfloat64_t sve_cz3 = svdup_f64(coef_z[3]), sve_cz4 = svdup_f64(coef_z[4]);
    svfloat64_t sve_cz5 = svdup_f64(coef_z[5]), sve_cz6 = svdup_f64(coef_z[6]);
    svbool_t ptrue = svptrue_b64();

    const uint ti_size = (STENCIL_TI < ni) ? STENCIL_TI : ni;
    const uint tj_size = (STENCIL_TJ < nj) ? STENCIL_TJ : nj;
    const uint tb_size = (STENCIL_TB < nb) ? STENCIL_TB : nb;

    // Band blocking (outermost to keep band data in cache)
    for (uint tb = 0; tb < nb; tb += tb_size) {
      const uint tb_end = (tb + tb_size < nb) ? tb + tb_size : nb;

#pragma omp for schedule(static) collapse(3)
      for (uint k = 0; k < nk; k++) {
        for (uint jb = 0; jb < nj; jb += tj_size) {
          for (uint ib = 0; ib < ni; ib += ti_size) {
            const uint j_end = (jb + tj_size < nj) ? jb + tj_size : nj;
            const uint i_end = (ib + ti_size < ni) ? ib + ti_size : ni;

            for (uint j = jb; j < j_end; j++) {
              for (uint i = ib; i < i_end; i++) {
                const uint g = i + j * ni + k * ni * nj;
                const uint g_ex = (i + FDn) + (j + FDn) * stride_j_ex +
                                  (k + FDn) * stride_k_ex;

                svfloat64_t sve_A = svdup_f64(A_diag_packed[g]);
                svfloat64_t sve_A_plus_c0 = svadd_x(ptrue, sve_A, sve_coef0);

                for (uint b = tb; b < tb_end; b += SVCNT) {
                  if (b >= nb) break;
                  const uint tile = b / 16;
                  const uint bl_base = b % 16;

                  svbool_t pg = (b + SVCNT <= nb)
                                    ? ptrue
                                    : svwhilelt_b64((uint64_t)b, (uint64_t)nb);

                  const double* s_center =
                      extended_packed + (tile * K_ex + g_ex) * 16 + bl_base;

                  svfloat64_t res =
                      svmul_x(pg, svld1(pg, s_center), sve_A_plus_c0);

// Macro for neighbor computation (16to16 version)
#define APPLY_STENCIL_NEIGHBOR_16(R, COEF_X, COEF_Y, COEF_Z)                   \
  do {                                                                         \
    {                                                                          \
      const double* sp =                                                       \
          extended_packed + (tile * K_ex + g_ex + R) * 16 + bl_base;           \
      const double* sm =                                                       \
          extended_packed + (tile * K_ex + g_ex - R) * 16 + bl_base;           \
      res =                                                                    \
          svmla_x(pg, res, svadd_x(pg, svld1(pg, sp), svld1(pg, sm)), COEF_X); \
    }                                                                          \
    {                                                                          \
      uint off = R * stride_j_ex;                                              \
      const double* sp =                                                       \
          extended_packed + (tile * K_ex + g_ex + off) * 16 + bl_base;         \
      const double* sm =                                                       \
          extended_packed + (tile * K_ex + g_ex - off) * 16 + bl_base;         \
      res =                                                                    \
          svmla_x(pg, res, svadd_x(pg, svld1(pg, sp), svld1(pg, sm)), COEF_Y); \
    }                                                                          \
    {                                                                          \
      uint off = R * stride_k_ex;                                              \
      const double* sp =                                                       \
          extended_packed + (tile * K_ex + g_ex + off) * 16 + bl_base;         \
      const double* sm =                                                       \
          extended_packed + (tile * K_ex + g_ex - off) * 16 + bl_base;         \
      res =                                                                    \
          svmla_x(pg, res, svadd_x(pg, svld1(pg, sp), svld1(pg, sm)), COEF_Z); \
    }                                                                          \
  } while (0)

                  APPLY_STENCIL_NEIGHBOR_16(1, sve_cx1, sve_cy1, sve_cz1);
                  APPLY_STENCIL_NEIGHBOR_16(2, sve_cx2, sve_cy2, sve_cz2);
                  APPLY_STENCIL_NEIGHBOR_16(3, sve_cx3, sve_cy3, sve_cz3);
                  APPLY_STENCIL_NEIGHBOR_16(4, sve_cx4, sve_cy4, sve_cz4);
                  APPLY_STENCIL_NEIGHBOR_16(5, sve_cx5, sve_cy5, sve_cz5);
                  APPLY_STENCIL_NEIGHBOR_16(6, sve_cx6, sve_cy6, sve_cz6);

#undef APPLY_STENCIL_NEIGHBOR_16

                  double* d_base =
                      output_16packed + (tile * K + g) * 16 + bl_base;
                  svst1(pg, d_base, res);
                }
              }
            }
          }
        }
      }
    }
  }
}

}  // namespace Packed
}  // namespace Stencil_method
