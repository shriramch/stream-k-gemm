// SME SYRK with 16-Packed Input (8 ZA tiles version)
//
// SYRK: C = alpha * A^T * A + beta * C
// A: K x M (K rows, M columns) in 16-packed format [M/16, K, 16]
// C: M x M symmetric matrix (upper triangle computed)
//
// Packed format: A_packed[(m/16)*K*16 + k*16 + m%16] = A[k, m]
// This means for band tile tm (bands tm*16 to tm*16+15), we have:
//   16 bands contiguous at each grid point k
//
// Microkernel: 16x32 output tile using ALL 8 ZA tiles
// - tiles 0-3: first 16x16 block (tm1 x tm2a)
// - tiles 4-7: second 16x16 block (tm1 x tm2b)
// For symmetric output, only compute tiles where tm1 <= tm2

#include <arm_sme.h>
#include <arm_sve.h>
#include <omp.h>

#include <chrono>
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <new>

#ifndef SVL
#define SVL 64  // SVL in bytes
#endif

#ifndef __forceinline
#define __forceinline inline __attribute__((always_inline))
#endif

// =============================================================================
// SME SYRK class with 16-packed input - uses all 8 ZA tiles
// =============================================================================

#ifndef KC_SYRK_VAL
#define KC_SYRK_VAL 256
#endif

#ifndef MC_SYRK_VAL
#define MC_SYRK_VAL 256
#endif

#ifndef NC_SYRK_VAL
#define NC_SYRK_VAL 256
#endif

template <typename T>
class sme_syrk {
 public:
  static constexpr int SVCNT = SVL / sizeof(T);  // 8 for f64
  static constexpr int TILE_M = 16;              // 16 bands per tile
  static constexpr int KC_SYRK = KC_SYRK_VAL;    // K blocking factor
  static constexpr int MC_SYRK = MC_SYRK_VAL;    // M blocking factor
  static constexpr int NC_SYRK = NC_SYRK_VAL;    // N blocking factor

  using vec_t = svfloat64_t;
  using pred_t = svbool_t;

  // =========================================================================
  // Microkernel: Compute 16x32 block using all 8 ZA tiles
  // A_tile1: [K][16] for tm1 (rows)
  // A_tile2a: [K][16] for tm2a (first 16 columns)
  // A_tile2b: [K][16] for tm2b (second 16 columns)
  // Output: Two 16x16 blocks at C[tm1*16, tm2a*16] and C[tm1*16, tm2b*16]
  // =========================================================================
  static __forceinline void microkernel_8za(
      const int K,
      const T* __restrict__ A_tile1,   // [K][16] for tm1
      const T* __restrict__ A_tile2a,  // [K][16] for tm2a
      const T* __restrict__ A_tile2b,  // [K][16] for tm2b
      const pred_t ptrue) __arm_streaming
#ifndef __arm_sim
      __arm_inout("za")
#endif
  {
    // Tiles layout for 16x32 output (with 8x8 f64 tiles):
    // [tile0  tile1 | tile4  tile5]   rows 0-7
    // [tile2  tile3 | tile6  tile7]   rows 8-15
    //  <-- tm2a --> | <-- tm2b -->

    for (int k = 0; k < K; ++k) {
      const T* a1 = A_tile1 + k * 16;
      const T* a2a = A_tile2a + k * 16;
      const T* a2b = A_tile2b + k * 16;

      vec_t a1_lo = svld1(ptrue, a1);        // bands 0-7 of tm1
      vec_t a1_hi = svld1(ptrue, a1 + 8);    // bands 8-15 of tm1
      vec_t a2a_lo = svld1(ptrue, a2a);      // bands 0-7 of tm2a
      vec_t a2a_hi = svld1(ptrue, a2a + 8);  // bands 8-15 of tm2a
      vec_t a2b_lo = svld1(ptrue, a2b);      // bands 0-7 of tm2b
      vec_t a2b_hi = svld1(ptrue, a2b + 8);  // bands 8-15 of tm2b

      // First 16x16 block (tm1 x tm2a) -> tiles 0-3
      svmopa_za64_f64_m(0, ptrue, ptrue, a1_lo, a2a_lo);
      svmopa_za64_f64_m(1, ptrue, ptrue, a1_lo, a2a_hi);
      svmopa_za64_f64_m(2, ptrue, ptrue, a1_hi, a2a_lo);
      svmopa_za64_f64_m(3, ptrue, ptrue, a1_hi, a2a_hi);

      // Second 16x16 block (tm1 x tm2b) -> tiles 4-7
      svmopa_za64_f64_m(4, ptrue, ptrue, a1_lo, a2b_lo);
      svmopa_za64_f64_m(5, ptrue, ptrue, a1_lo, a2b_hi);
      svmopa_za64_f64_m(6, ptrue, ptrue, a1_hi, a2b_lo);
      svmopa_za64_f64_m(7, ptrue, ptrue, a1_hi, a2b_hi);
    }
  }

  // Single 16x16 microkernel (for odd tile case)
  static __forceinline void microkernel_4za(const int K,
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

  // Store first 16x16 block from tiles 0-3
  static __forceinline void store_tile_0123(const int M, const int row_base,
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

  // Store second 16x16 block from tiles 4-7
  static __forceinline void store_tile_4567(const int M, const int row_base,
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
      c_lo = svread_ver_za64_f64_m(c_lo, ptrue, 4, lc);
      c_hi = svread_ver_za64_f64_m(c_hi, ptrue, 6, lc);

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
      c_lo = svread_ver_za64_f64_m(c_lo, ptrue, 5, lc);
      c_hi = svread_ver_za64_f64_m(c_hi, ptrue, 7, lc);

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

  // Thread-level: compute two 16x16 blocks at once
#ifndef __arm_sim
  __arm_new("za")
#endif
      __arm_locally_streaming static void compute_tile_pair_8za(
          const int K, const int M, const int tm1, const int tm2a,
          const int tm2b, const T* __restrict__ A_packed, T* __restrict__ C,
          const T alpha, const T beta) {

    pred_t ptrue = svptrue_b64();

    const T* A_tile1 = A_packed + tm1 * K * 16;
    const T* A_tile2a = A_packed + tm2a * K * 16;
    const T* A_tile2b = A_packed + tm2b * K * 16;

    T local_beta = beta;
    for (int kc = 0; kc < K; kc += KC_SYRK) {
      int k_len = (kc + KC_SYRK <= K) ? KC_SYRK : (K - kc);

      svzero_za();
      microkernel_8za(k_len, A_tile1 + kc * 16, A_tile2a + kc * 16,
                      A_tile2b + kc * 16, ptrue);

      T store_alpha = (kc + KC_SYRK >= K) ? alpha : T(1.0);
      store_tile_0123(M, tm1 * 16, tm2a * 16, C, store_alpha, local_beta,
                      ptrue);
      store_tile_4567(M, tm1 * 16, tm2b * 16, C, store_alpha, local_beta,
                      ptrue);
      local_beta = T(1.0);
    }
  }

  // Single 16x16 block (for odd case)
#ifndef __arm_sim
  __arm_new("za")
#endif
      __arm_locally_streaming static void compute_tile_pair_4za(
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
      microkernel_4za(k_len, A_tile1 + kc * 16, A_tile2 + kc * 16, ptrue);

      T store_alpha = (kc + KC_SYRK >= K) ? alpha : T(1.0);
      store_tile_0123(M, tm1 * 16, tm2 * 16, C, store_alpha, local_beta, ptrue);
      local_beta = T(1.0);
    }
  }

  // Main SYRK computation: C = alpha * A^T * A + beta * C (upper triangle)
  static void compute(const int K, const int M,
                      const T* __restrict__ A_packed,  // [M/16, K, 16]
                      T* __restrict__ C,               // M x M column-major
                      const T alpha, const T beta) {
    const int tiles_m = (M + TILE_M - 1) / TILE_M;
    constexpr int mc_tiles = MC_SYRK / TILE_M;
    constexpr int nc_tiles = NC_SYRK / TILE_M;

    // 3D blocking: MC_SYRK x NC_SYRK x KC_SYRK
    // For upper triangle: only blocks where nc_block_start + nc can be >=
    // mc_block_start + tm1

#pragma omp parallel for schedule(dynamic) collapse(2)
    for (int mc = 0; mc < tiles_m; mc += mc_tiles) {
      for (int nc = 0; nc < tiles_m; nc += nc_tiles) {
        // Only process upper-triangle blocks (nc_end > mc_start)
        int mc_end = (mc + mc_tiles <= tiles_m) ? mc + mc_tiles : tiles_m;
        int nc_end = (nc + nc_tiles <= tiles_m) ? nc + nc_tiles : tiles_m;
        if (nc_end <= mc) continue;  // entire NC block is below diagonal

        for (int tm1 = mc; tm1 < mc_end; ++tm1) {
          // tm2 must be >= tm1 (symmetry) and within nc block
          int tm2_start = (tm1 > nc) ? tm1 : nc;
          int num_tm2 = nc_end - tm2_start;
          if (num_tm2 <= 0) continue;

          // Process pairs of tm2 tiles for 8za microkernel
          for (int i = 0; i + 1 < num_tm2; i += 2) {
            int tm2a = tm2_start + i;
            int tm2b = tm2_start + i + 1;
            compute_tile_pair_8za(K, M, tm1, tm2a, tm2b, A_packed, C, alpha,
                                  beta);
          }

          // Handle odd last tile
          if (num_tm2 % 2 == 1) {
            int tm2 = nc_end - 1;
            compute_tile_pair_4za(K, M, tm1, tm2, A_packed, C, alpha, beta);
          }
        }
      }
    }
  }
};

// =============================================================================
// Reference implementation
// =============================================================================

template <typename T>
void syrk_reference(int K, int M, const T* A_packed, T* C, T alpha, T beta) {
  // A_packed: [M/16, K, 16] -> A[k, m] = A_packed[(m/16)*K*16 + k*16 + m%16]
  // C = alpha * A^T * A + beta * C (upper triangle, column-major)

  for (int m1 = 0; m1 < M; ++m1) {
    for (int m2 = m1; m2 < M; ++m2) {  // Upper triangle: m1 <= m2
      T sum = T(0);
      for (int k = 0; k < K; ++k) {
        // A[k, m1] = A_packed[(m1/16)*K*16 + k*16 + m1%16]
        T a1 = A_packed[(m1 / 16) * K * 16 + k * 16 + m1 % 16];
        T a2 = A_packed[(m2 / 16) * K * 16 + k * 16 + m2 % 16];
        sum += a1 * a2;
      }
      // C[m1, m2] in column-major: C[m1 + m2 * M]
      C[m1 + m2 * M] = alpha * sum + beta * C[m1 + m2 * M];
    }
  }
}

// =============================================================================
// Test harness
// =============================================================================

template <typename T>
void init_A_packed(int K, int M, T* A_packed, int seed) {
  srand(seed);
  int tiles_m = (M + 15) / 16;
  for (int tm = 0; tm < tiles_m; ++tm) {
    for (int k = 0; k < K; ++k) {
      for (int ml = 0; ml < 16; ++ml) {
        int m = tm * 16 + ml;
        if (m < M) {
          A_packed[(tm * K + k) * 16 + ml] = (T)(rand() % 100) / 100.0;
        } else {
          A_packed[(tm * K + k) * 16 + ml] = T(0);
        }
      }
    }
  }
}

template <typename T>
bool verify(int M, const T* C_ref, const T* C_sme, T tol) {
  T max_err = T(0);
  int err_count = 0;

  // Check upper triangle only
  for (int m1 = 0; m1 < M; ++m1) {
    for (int m2 = m1; m2 < M; ++m2) {
      int idx = m1 + m2 * M;  // column-major
      T err = std::abs(C_ref[idx] - C_sme[idx]);
      T scale = std::max(T(1.0), std::abs(C_ref[idx]));
      T rel_err = err / scale;

      if (rel_err > tol) {
        if (err_count < 5) {
          printf("  Mismatch at (%d,%d): ref=%.6f, sme=%.6f, err=%.2e\n", m1,
                 m2, (double)C_ref[idx], (double)C_sme[idx], (double)rel_err);
        }
        err_count++;
      }
      max_err = std::max(max_err, rel_err);
    }
  }

  printf("  Max rel error: %.2e, errors: %d\n", (double)max_err, err_count);
  return max_err < tol;
}

int main(int argc, char** argv) {
  printf("=== SME SYRK Test (16-packed, 8 ZA tiles) ===\n");
  printf("SVL=%d, SVCNT=%d, KC_SYRK=%d, MC_SYRK=%d, NC_SYRK=%d, Threads=%d\n\n",
         SVL, SVL / 8, sme_syrk<double>::KC_SYRK, sme_syrk<double>::MC_SYRK,
         sme_syrk<double>::NC_SYRK, omp_get_max_threads());

  using T = double;

  // Benchmark mode: ./syrk_crsp M K
  if (argc == 3) {
    int M = std::atoi(argv[1]);
    int K = std::atoi(argv[2]);
    int tiles_m = (M + 15) / 16;

    T* A_packed = new (std::align_val_t(64)) T[tiles_m * K * 16]();
    T* C_sme = new (std::align_val_t(64)) T[M * M]();
    init_A_packed(K, M, A_packed, 42);

    // Warmup
    sme_syrk<T>::compute(K, M, A_packed, C_sme, T(1.0), T(0.0));

    // Benchmark
    constexpr int BENCH_ITERS = 3;
    auto start = std::chrono::steady_clock::now();
    for (int i = 0; i < BENCH_ITERS; ++i) {
      sme_syrk<T>::compute(K, M, A_packed, C_sme, T(1.0), T(0.0));
    }
    auto end = std::chrono::steady_clock::now();
    double time_us =
        std::chrono::duration<double, std::micro>(end - start).count() /
        BENCH_ITERS;
    double flops = (double)M * M *
                   K;  // SYRK: M*M*K (only upper triangle but compute full)
    double gflops = flops / (time_us * 1000.0);

    printf("%d,%d,%d,%d,%d,%.2f,%.4f\n", (int)sme_syrk<T>::MC_SYRK,
           (int)sme_syrk<T>::NC_SYRK, (int)sme_syrk<T>::KC_SYRK, M, K, time_us,
           gflops);

    delete[] A_packed;
    delete[] C_sme;
    return 0;
  }

  struct TestCase {
    int K;
    int M;
  };

  TestCase tests[] = {
      {64, 32}, {256, 64}, {512, 96}, {1024, 128}, {2048, 256},
  };

  int passed = 0;
  int total = sizeof(tests) / sizeof(tests[0]);

  for (int t = 0; t < total; ++t) {
    int K = tests[t].K;
    int M = tests[t].M;
    int tiles_m = (M + 15) / 16;

    printf("Test %d: K=%d, M=%d (tiles=%d)\n", t + 1, K, M, tiles_m);

    // Allocate
    T* A_packed = new (std::align_val_t(64)) T[tiles_m * K * 16]();
    T* C_ref = new (std::align_val_t(64)) T[M * M]();
    T* C_sme = new (std::align_val_t(64)) T[M * M]();

    init_A_packed(K, M, A_packed, 42 + t);

    // Initialize C with some values for beta != 0 test
    for (int i = 0; i < M * M; ++i) {
      C_ref[i] = C_sme[i] = T(0.1);
    }

    T alpha = T(1.0);
    T beta = T(0.0);

    // Reference
    auto t0 = std::chrono::steady_clock::now();
    syrk_reference(K, M, A_packed, C_ref, alpha, beta);
    auto t1 = std::chrono::steady_clock::now();
    double ref_ms = std::chrono::duration<double, std::milli>(t1 - t0).count();

    // SME
    auto t2 = std::chrono::steady_clock::now();
    sme_syrk<T>::compute(K, M, A_packed, C_sme, alpha, beta);
    auto t3 = std::chrono::steady_clock::now();
    double sme_ms = std::chrono::duration<double, std::milli>(t3 - t2).count();

    // Verify
    bool ok = verify(M, C_ref, C_sme, 1e-9);
    printf("  Result: %s (ref=%.1fms, sme=%.1fms)\n\n",
           ok ? "PASSED" : "FAILED", ref_ms, sme_ms);
    if (ok) passed++;

    delete[] A_packed;
    delete[] C_ref;
    delete[] C_sme;
  }

  printf("=== Summary: %d/%d tests passed ===\n", passed, total);
  return passed == total ? 0 : 1;
}
