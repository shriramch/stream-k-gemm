// SME TRP GEMM with Packed Input/Output
//
// Rotation: D = A^T * B where A is [nb][Nd], B is [nb][nb], D is [Nd][nb]
// Both A and D use grid-tile-packed format:
//   A (Psi): [Nd/16, nb, 16] - grid-tile major, then bands, then 16 grids
//   B (Q): [nb, nb] row-major
//   D (Psi_new): [Nd/16, nb, 16] - same packed format
//
// A[b, g] = A[(g/16) * nb * 16 + b * 16 + g%16]
// B[b, bp] = B[b * nb + bp]
// D[g, bp] = D[(g/16) * nb * 16 + bp * 16 + g%16]
//
// Computation: D[g, bp] = sum_b A[b, g] * B[b, bp]
//
// Microkernel: 16 grids × 32 output bands, 8 ZA tiles
// - Load A: 16 contiguous grids at band b (within same grid tile)
// - Load B: 32 output bands at input band b (contiguous)
// - 8 FMOPAs, accumulate over all nb input bands
// - Store to 16-packed output (contiguous within grid tile)

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

// =============================================================================
// TRP GEMM class with optimal layout
// =============================================================================

template <typename T>
class sme_gemm_trp {
 public:
  static constexpr int SVCNT = SVL / sizeof(T);  // 8 for f64
  static constexpr int TILE_G = 16;              // 16 grids per output tile
  static constexpr int TILE_BP = 32;             // 32 output bands per tile
  static constexpr int PACK_D = 16;              // Output packing factor

  using vec_t = svfloat64_t;
  using pred_t = svbool_t;

  // =========================================================================
  // Microkernel: 16 grids × 32 output bands, accumulate over all nb input bands
  // A: [Nd/16, nb, 16] packed - A[b, g] = A[(g/16)*nb*16 + b*16 + g%16]
  // B: [nb, nb] row-major - B[b, bp] = B[b * nb + bp]
  // For a grid tile (g_base..g_base+15), loading at band b is contiguous!
  // =========================================================================
  static __forceinline void microkernel(
      const int Nd, const int nb,
      const int g_tile,   // grid tile index (= g_base / 16)
      const int bp_base,  // output band start (multiple of 32)
      const T* __restrict__ A, const T* __restrict__ B,
      const pred_t ptrue) __arm_streaming
#ifndef __arm_sim
      __arm_inout("za")
#endif
  {
    svzero_za();

    // Base address for this grid tile in A
    const T* a_tile_base = A + g_tile * nb * 16;

    // Loop over all input bands
    for (int b = 0; b < nb; ++b) {
      // Load A[b, g_tile*16 : g_tile*16+16] - 16 CONTIGUOUS grids at band b
      const T* a_ptr = a_tile_base + b * 16;
      vec_t a0 = svld1(ptrue, a_ptr);      // grids 0-7 within tile
      vec_t a1 = svld1(ptrue, a_ptr + 8);  // grids 8-15 within tile

      // Load B[b, bp_base:bp_base+32] - 32 output bands at input band b
      const T* b_ptr = B + b * nb + bp_base;
      vec_t b0 = svld1_vnum(ptrue, b_ptr, 0);  // bp 0-7
      vec_t b1 = svld1_vnum(ptrue, b_ptr, 1);  // bp 8-15
      vec_t b2 = svld1_vnum(ptrue, b_ptr, 2);  // bp 16-23
      vec_t b3 = svld1_vnum(ptrue, b_ptr, 3);  // bp 24-31

      // 8 FMOPAs: 2 A vectors × 4 B vectors
      // Tiles 0-3: grids 0-7 × output bands 0-31
      svmopa_za64_f64_m(0, ptrue, ptrue, a0, b0);  // g 0-7, bp 0-7
      svmopa_za64_f64_m(1, ptrue, ptrue, a0, b1);  // g 0-7, bp 8-15
      svmopa_za64_f64_m(2, ptrue, ptrue, a0, b2);  // g 0-7, bp 16-23
      svmopa_za64_f64_m(3, ptrue, ptrue, a0, b3);  // g 0-7, bp 24-31
      // Tiles 4-7: grids 8-15 × output bands 0-31
      svmopa_za64_f64_m(4, ptrue, ptrue, a1, b0);  // g 8-15, bp 0-7
      svmopa_za64_f64_m(5, ptrue, ptrue, a1, b1);  // g 8-15, bp 8-15
      svmopa_za64_f64_m(6, ptrue, ptrue, a1, b2);  // g 8-15, bp 16-23
      svmopa_za64_f64_m(7, ptrue, ptrue, a1, b3);  // g 8-15, bp 24-31
    }
  }

  // =========================================================================
  // Store 16×32 output tile to D in [Nd/16, nb, 16] packed format
  // D[g, bp] = D[(g/16) * nb * 16 + bp * 16 + g%16]
  //
  // For a grid tile (g_tile), all 16 grids at output band bp are contiguous:
  //   D[g_tile*16..g_tile*16+15, bp] at: g_tile * nb * 16 + bp * 16 + 0..15
  //
  // ZA tile layout: row r = grid r within tile, col c = output band offset
  // We need to transpose: read columns (same bp, different grids) and store
  // =========================================================================
  static __forceinline void store_tile(const int Nd, const int nb,
                                       const int g_tile, const int bp_base,
                                       T* __restrict__ D, const T alpha,
                                       const T gamma,
                                       const pred_t ptrue) __arm_streaming
#ifndef __arm_sim
      __arm_inout("za")
#endif
  {
    // Base address for this grid tile in D
    T* d_tile_base = D + g_tile * nb * 16;

    // Store 32 output bands (bp_base to bp_base+31)
    // For each output band bp, we need grids 0-15 which are stored contiguously

    // Read COLUMNS from ZA tiles (each column = 8 grids at same bp)
    // Tiles 0-3: grids 0-7, Tiles 4-7: grids 8-15

    // Process bp 0-7 (from tile 0 and tile 4)
    for (int c = 0; c < SVCNT; ++c) {
      int bp = bp_base + c;
      vec_t col0, col4;
      col0 = svread_ver_za64_f64_m(col0, ptrue, 0, c);  // grids 0-7
      col4 = svread_ver_za64_f64_m(col4, ptrue, 4, c);  // grids 8-15

      col0 = svadd_z(ptrue, svmul_z(ptrue, col0, alpha), gamma);
      col4 = svadd_z(ptrue, svmul_z(ptrue, col4, alpha), gamma);

      T* d_ptr = d_tile_base + bp * 16;
      svst1(ptrue, d_ptr, col0);      // grids 0-7
      svst1(ptrue, d_ptr + 8, col4);  // grids 8-15
    }

    // Process bp 8-15 (from tile 1 and tile 5)
    for (int c = 0; c < SVCNT; ++c) {
      int bp = bp_base + 8 + c;
      vec_t col1, col5;
      col1 = svread_ver_za64_f64_m(col1, ptrue, 1, c);
      col5 = svread_ver_za64_f64_m(col5, ptrue, 5, c);

      col1 = svadd_z(ptrue, svmul_z(ptrue, col1, alpha), gamma);
      col5 = svadd_z(ptrue, svmul_z(ptrue, col5, alpha), gamma);

      T* d_ptr = d_tile_base + bp * 16;
      svst1(ptrue, d_ptr, col1);
      svst1(ptrue, d_ptr + 8, col5);
    }

    // Process bp 16-23 (from tile 2 and tile 6)
    for (int c = 0; c < SVCNT; ++c) {
      int bp = bp_base + 16 + c;
      vec_t col2, col6;
      col2 = svread_ver_za64_f64_m(col2, ptrue, 2, c);
      col6 = svread_ver_za64_f64_m(col6, ptrue, 6, c);

      col2 = svadd_z(ptrue, svmul_z(ptrue, col2, alpha), gamma);
      col6 = svadd_z(ptrue, svmul_z(ptrue, col6, alpha), gamma);

      T* d_ptr = d_tile_base + bp * 16;
      svst1(ptrue, d_ptr, col2);
      svst1(ptrue, d_ptr + 8, col6);
    }

    // Process bp 24-31 (from tile 3 and tile 7)
    for (int c = 0; c < SVCNT; ++c) {
      int bp = bp_base + 24 + c;
      vec_t col3, col7;
      col3 = svread_ver_za64_f64_m(col3, ptrue, 3, c);
      col7 = svread_ver_za64_f64_m(col7, ptrue, 7, c);

      col3 = svadd_z(ptrue, svmul_z(ptrue, col3, alpha), gamma);
      col7 = svadd_z(ptrue, svmul_z(ptrue, col7, alpha), gamma);

      T* d_ptr = d_tile_base + bp * 16;
      svst1(ptrue, d_ptr, col3);
      svst1(ptrue, d_ptr + 8, col7);
    }
  }

  // =========================================================================
  // Compute one 16×32 output tile
  // =========================================================================
  static __forceinline void compute_tile(
      const int Nd, const int nb, const int g_tile, const int bp_base,
      const T* __restrict__ A, const T* __restrict__ B, T* __restrict__ D,
      const T alpha, const T gamma, const pred_t ptrue) __arm_streaming
#ifndef __arm_sim
      __arm_inout("za")
#endif
  {
    microkernel(Nd, nb, g_tile, bp_base, A, B, ptrue);
    store_tile(Nd, nb, g_tile, bp_base, D, alpha, gamma, ptrue);
  }

  // =========================================================================
  // Thread worker
  // =========================================================================
#ifndef __arm_sim
  __arm_new("za")
#endif
      __arm_locally_streaming static void compute_thread(
          const int Nd, const int nb, const int g_tile_start,
          const int g_tile_end, const T* __restrict__ A,
          const T* __restrict__ B, T* __restrict__ D, const T alpha,
          const T gamma) {
    pred_t ptrue = svptrue_b64();

    for (int g_tile = g_tile_start; g_tile < g_tile_end; ++g_tile) {
      for (int bp = 0; bp < nb; bp += TILE_BP) {
        compute_tile(Nd, nb, g_tile, bp, A, B, D, alpha, gamma, ptrue);
      }
    }
  }

  // =========================================================================
  // Main compute entry point
  // =========================================================================
  static void compute(const int Nd, const int nb,
                      const T* __restrict__ A,  // [Nd/16, nb, 16] packed
                      const T* __restrict__ B,  // [nb, nb] row-major
                      T* __restrict__ D,        // [Nd/16, nb, 16] packed
                      const T alpha, const T gamma) {
    const int g_tiles = Nd / TILE_G;
    const int num_threads = omp_get_max_threads();
    const int tiles_per_thread = (g_tiles + num_threads - 1) / num_threads;

#pragma omp parallel
    {
      const int tid = omp_get_thread_num();
      const int g_tile_start = tid * tiles_per_thread;
      int g_tile_end = g_tile_start + tiles_per_thread;
      if (g_tile_end > g_tiles) g_tile_end = g_tiles;

      if (g_tile_start < g_tiles) {
        compute_thread(Nd, nb, g_tile_start, g_tile_end, A, B, D, alpha, gamma);
      }
    }
  }
};

// =============================================================================
// Test harness
// =============================================================================

template <typename T>
bool test_gemm(int Nd, int nb, T alpha, T gamma) {
  const char* type_name = std::is_same<T, float>::value ? "float" : "double";
  printf("Testing TRP GEMM<%s> (packed): Nd=%d nb=%d alpha=%.2f gamma=%.2f\n",
         type_name, Nd, nb, alpha, gamma);

  omp_set_num_threads(NUM_THREADS);

  // A: [Nd/16, nb, 16] packed (16 grids contiguous per band within tile)
  // B: [nb, nb] row-major
  // D: [Nd/16, nb, 16] packed
  const int g_tiles = Nd / 16;

  T* A = hbm_alloc<T>(g_tiles * nb * 16);
  T* B = hbm_alloc<T>(nb * nb);
  T* D = hbm_alloc<T>(g_tiles * nb * 16);

  // Initialize A in packed format: A[b, g] = A[(g/16)*nb*16 + b*16 + g%16]
  for (int b = 0; b < nb; ++b) {
    for (int g = 0; g < Nd; ++g) {
      int g_tile = g / 16;
      int g_local = g % 16;
      A[g_tile * nb * 16 + b * 16 + g_local] =
          static_cast<T>((b + 1) * 0.01 + (g + 1) * 0.0001);
    }
  }

  // Initialize B: B[b, bp] = (b+1)*0.01 + (bp+1)*0.001
  for (int b = 0; b < nb; ++b) {
    for (int bp = 0; bp < nb; ++bp) {
      B[b * nb + bp] = static_cast<T>((b + 1) * 0.01 + (bp + 1) * 0.001);
    }
  }

  std::memset(D, 0, g_tiles * nb * 16 * sizeof(T));

  sme_gemm_trp<T>::compute(Nd, nb, A, B, D, alpha, gamma);

  // Reference computation
  T* D_ref = hbm_alloc<T>(g_tiles * nb * 16);
  std::memset(D_ref, 0, g_tiles * nb * 16 * sizeof(T));

  for (int g = 0; g < Nd; ++g) {
    for (int bp = 0; bp < nb; ++bp) {
      T sum = 0;
      for (int b = 0; b < nb; ++b) {
        // Read from packed A: A[b, g] = A[(g/16)*nb*16 + b*16 + g%16]
        int g_tile = g / 16;
        int g_local = g % 16;
        T a_val = A[g_tile * nb * 16 + b * 16 + g_local];
        sum += a_val * B[b * nb + bp];
      }
      // Store to packed D: D[g, bp] = D[(g/16)*nb*16 + bp*16 + g%16]
      int g_tile = g / 16;
      int g_local = g % 16;
      D_ref[g_tile * nb * 16 + bp * 16 + g_local] = alpha * sum + gamma;
    }
  }

  // Verify
  bool pass = true;
  T max_err = 0;

  for (int i = 0; i < g_tiles * nb * 16; ++i) {
    T err = std::abs(D[i] - D_ref[i]);
    T ref_abs = std::abs(D_ref[i]) + 1e-10;
    T rel_err = err / ref_abs;
    if (rel_err > max_err) max_err = rel_err;
    if (rel_err > 1e-6 && pass) {
      pass = false;
      printf("  MISMATCH at %d: got %.10f, expected %.10f (rel_err=%.2e)\n", i,
             D[i], D_ref[i], rel_err);
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
}

// =============================================================================
// Benchmark
// =============================================================================

template <typename T>
double benchmark_gemm(int Nd, int nb, T alpha, T gamma) {
  const int g_tiles = Nd / 16;

  T* A = hbm_alloc<T>(g_tiles * nb * 16);
  T* B = hbm_alloc<T>(nb * nb);
  T* D = hbm_alloc<T>(g_tiles * nb * 16);

  for (int i = 0; i < g_tiles * nb * 16; ++i)
    A[i] = static_cast<T>(0.01 * (i % 100));
  for (int i = 0; i < nb * nb; ++i) B[i] = static_cast<T>(0.01 * (i % 100));
  std::memset(D, 0, g_tiles * nb * 16 * sizeof(T));

  // Warmup
  for (int i = 0; i < WITERS; ++i) {
    sme_gemm_trp<T>::compute(Nd, nb, A, B, D, alpha, gamma);
  }

  auto start = std::chrono::high_resolution_clock::now();
  for (int i = 0; i < ITERS; ++i) {
    sme_gemm_trp<T>::compute(Nd, nb, A, B, D, alpha, gamma);
  }
  auto end = std::chrono::high_resolution_clock::now();

  hbm_free(A);
  hbm_free(B);
  hbm_free(D);

  return std::chrono::duration<double, std::nano>(end - start).count() / ITERS;
}

// =============================================================================
// Main
// =============================================================================

int main(int argc, char** argv) {
  hbm_init();
  printf("SME TRP GEMM with Packed Layout\n");
  printf("A: [Nd/16, nb, 16], B: [nb, nb], D: [Nd/16, nb, 16]\n");
  printf("SVL=%d, SVCNT=%d, Threads=%d\n\n", SVL, sme_gemm_trp<double>::SVCNT,
         NUM_THREADS);

  int passed = 0, total = 0;

  // Test 1: Small (Nd=16, nb=32)
  printf("=== Test 1: Nd=16, nb=32 ===\n");
  if (test_gemm<double>(16, 32, 1.0, 0.0)) passed++;
  total++;

  // Test 2: Nd=64, nb=64
  printf("\n=== Test 2: Nd=64, nb=64 ===\n");
  if (test_gemm<double>(64, 64, 1.0, 0.0)) passed++;
  total++;

  // Test 3: Nd=256, nb=64
  printf("\n=== Test 3: Nd=256, nb=64 ===\n");
  if (test_gemm<double>(256, 64, 1.0, 0.0)) passed++;
  total++;

  // Test 4: With alpha/gamma
  printf("\n=== Test 4: Nd=256, nb=64 with alpha=2.0, gamma=0.5 ===\n");
  if (test_gemm<double>(256, 64, 2.0, 0.5)) passed++;
  total++;

  printf("\n=== Summary: %d/%d tests passed ===\n", passed, total);

  if (passed != total) return 1;

  // Benchmark
  int Nd = 256, nb = 64;
  if (argc >= 3) {
    Nd = std::atoi(argv[1]);
    nb = std::atoi(argv[2]);
  }

  printf("\n=== Benchmark: Nd=%d nb=%d ===\n", Nd, nb);
  double time_ns = benchmark_gemm<double>(Nd, nb, 1.0, 0.0);
  double gflops = 2.0 * Nd * nb * nb / time_ns;
  printf("Time: %.3f us, GFLOPS: %.2f\n", time_ns / 1e3, gflops);

  return 0;
}
