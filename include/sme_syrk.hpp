// SME SYRK with 16-Packed Input
// C = alpha * A^T * A + beta * C (upper triangle)
//
// A: K x M in 16-packed format [M/16, K, 16]
//   A_packed[(m/16)*K*16 + k*16 + m%16] = A[k, m]
// C: M x M column-major symmetric (upper triangle computed)

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

template <typename T>
class sme_syrk {
 public:
  static constexpr int SVCNT = SVL / sizeof(T);  // 8 for f64
  static constexpr int TILE_M = 16;
  static constexpr int KC_SYRK = 256;

  using vec_t = svfloat64_t;
  using pred_t = svbool_t;

  // Microkernel: 16x16 block using 4 ZA tiles
  static __forceinline void microkernel(const int K,
                                        const T* __restrict__ A_tile1,
                                        const T* __restrict__ A_tile2,
                                        const pred_t ptrue) __arm_streaming
#ifndef __arm_sim
      __arm_inout("za")
#endif
  {
    for (int k = 0; k < K; ++k) {
      const T* a1 = A_tile1 + k * 16;
      const T* a2 = A_tile2 + k * 16;

      vec_t a1_lo = svld1(ptrue, a1);
      vec_t a1_hi = svld1(ptrue, a1 + 8);
      vec_t a2_lo = svld1(ptrue, a2);
      vec_t a2_hi = svld1(ptrue, a2 + 8);

      svmopa_za64_f64_m(0, ptrue, ptrue, a1_lo, a2_lo);
      svmopa_za64_f64_m(1, ptrue, ptrue, a1_lo, a2_hi);
      svmopa_za64_f64_m(2, ptrue, ptrue, a1_hi, a2_lo);
      svmopa_za64_f64_m(3, ptrue, ptrue, a1_hi, a2_hi);
    }
  }

  static __forceinline void store_tile_full(const int M, const int row_base,
                                            const int col_base,
                                            T* __restrict__ C, const T alpha,
                                            const T beta,
                                            const pred_t ptrue) __arm_streaming
#ifndef __arm_sim
      __arm_inout("za")
#endif
  {
    for (int lc = 0; lc < SVCNT; ++lc) {
      int col = col_base + lc;
      vec_t c_lo, c_hi;
      c_lo = svread_ver_za64_f64_m(c_lo, ptrue, 0, lc);
      c_hi = svread_ver_za64_f64_m(c_hi, ptrue, 2, lc);

      T* c_ptr = C + col * M + row_base;
      if (beta == T(0)) {
        svst1(ptrue, c_ptr, svmul_z(ptrue, c_lo, alpha));
        svst1(ptrue, c_ptr + 8, svmul_z(ptrue, c_hi, alpha));
      } else {
        vec_t old_lo = svld1(ptrue, c_ptr);
        vec_t old_hi = svld1(ptrue, c_ptr + 8);
        svst1(ptrue, c_ptr,
              svadd_z(ptrue, svmul_z(ptrue, c_lo, alpha),
                      svmul_z(ptrue, old_lo, beta)));
        svst1(ptrue, c_ptr + 8,
              svadd_z(ptrue, svmul_z(ptrue, c_hi, alpha),
                      svmul_z(ptrue, old_hi, beta)));
      }
    }

    for (int lc = 0; lc < SVCNT; ++lc) {
      int col = col_base + 8 + lc;
      vec_t c_lo, c_hi;
      c_lo = svread_ver_za64_f64_m(c_lo, ptrue, 1, lc);
      c_hi = svread_ver_za64_f64_m(c_hi, ptrue, 3, lc);

      T* c_ptr = C + col * M + row_base;
      if (beta == T(0)) {
        svst1(ptrue, c_ptr, svmul_z(ptrue, c_lo, alpha));
        svst1(ptrue, c_ptr + 8, svmul_z(ptrue, c_hi, alpha));
      } else {
        vec_t old_lo = svld1(ptrue, c_ptr);
        vec_t old_hi = svld1(ptrue, c_ptr + 8);
        svst1(ptrue, c_ptr,
              svadd_z(ptrue, svmul_z(ptrue, c_lo, alpha),
                      svmul_z(ptrue, old_lo, beta)));
        svst1(ptrue, c_ptr + 8,
              svadd_z(ptrue, svmul_z(ptrue, c_hi, alpha),
                      svmul_z(ptrue, old_hi, beta)));
      }
    }
  }

#ifndef __arm_sim
  __arm_new("za")
#endif
      __arm_locally_streaming static void compute_tile_pair(
          const int K, const int M, const int tm1, const int tm2,
          const T* __restrict__ A_packed, T* __restrict__ C, const T alpha,
          const T beta) {

    pred_t ptrue = svptrue_b64();
    const T* A_tile1 = A_packed + tm1 * K * 16;
    const T* A_tile2 = A_packed + tm2 * K * 16;

    T local_beta = beta;
    for (int kc = 0; kc < K; kc += KC_SYRK) {
      int k_len = (kc + KC_SYRK <= K) ? KC_SYRK : (K - kc);

      svzero_za();
      microkernel(k_len, A_tile1 + kc * 16, A_tile2 + kc * 16, ptrue);

      T store_alpha = (kc + KC_SYRK >= K) ? alpha : T(1.0);
      store_tile_full(M, tm1 * 16, tm2 * 16, C, store_alpha, local_beta, ptrue);
      local_beta = T(1.0);
    }
  }

  // Main SYRK: C = alpha * A^T * A + beta * C (upper triangle)
  static void compute(const int K, const int M, const T* __restrict__ A_packed,
                      T* __restrict__ C, const T alpha, const T beta) {
    const int tiles_m = (M + TILE_M - 1) / TILE_M;

#pragma omp parallel for schedule(dynamic) collapse(2)
    for (int tm1 = 0; tm1 < tiles_m; ++tm1) {
      for (int tm2 = 0; tm2 < tiles_m; ++tm2) {
        if (tm1 <= tm2) {
          compute_tile_pair(K, M, tm1, tm2, A_packed, C, alpha, beta);
        }
      }
    }
  }
};
