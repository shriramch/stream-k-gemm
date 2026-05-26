// SVE 3D Stencil with Packed Input/Output for GEMM Integration
// Input format: Psi_packed (32 bands contiguous, stride 32 per grid)
// Output format: H_Psi_packed (32 bands contiguous, stride 32 per grid)
// Vectorizes over 8 bands at a time (SVCNT for f64)
//
// Stencil: 6th-order Laplacian
// d[i,j,k] = s[i,j,k] * (A[i,j,k] + coef_0)
//          + sum_r=1..6 coef_xr * (s[i+r,j,k] + s[i-r,j,k])
//          + sum_r=1..6 coef_yr * (s[i,j+r,k] + s[i,j-r,k])
//          + sum_r=1..6 coef_zr * (s[i,j,k+r] + s[i,j,k-r])

#include <arm_sve.h>
#include <omp.h>

#include <chrono>
#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>

#ifndef NUM_THREADS
#define NUM_THREADS 38
#endif

#ifndef WITERS
#define WITERS 1
#endif

#ifndef ITERS
#define ITERS 1
#endif

// Stencil radius
constexpr int RADIUS = 6;

// Tile sizes for packing - both 32 for stencil
constexpr int B_TILE = 32;  // Input: 32 bands per tile (Psi)
constexpr int A_TILE = 32;  // Output: 32 bands per tile (H_Psi)
constexpr int SVCNT = 8;    // SVE vector count for f64

// Cache blocking parameters (sweepable)
#ifndef MC
#define MC 64
#endif

#ifndef NC
#define NC 8
#endif

#ifndef KC
#define KC 8
#endif

// =============================================================================
// Scalar pack/unpack for testing
// =============================================================================

// Pack from standard 3D+band layout [band][k][j][i] to B_packed format
// B_packed: [band_tiles][grids][32_bands]
// Where grids = i + j*ni + k*ni*nj
void pack_to_B(const double* src, double* B_packed, int64_t ni, int64_t nj,
               int64_t nk, int64_t nb) {
  const int64_t grids = ni * nj * nk;
  const int64_t band_tiles = (nb + B_TILE - 1) / B_TILE;

  for (int64_t bt = 0; bt < band_tiles; ++bt) {
    for (int64_t g = 0; g < grids; ++g) {
      for (int64_t bl = 0; bl < B_TILE; ++bl) {
        int64_t b = bt * B_TILE + bl;
        if (b < nb) {
          // src layout: [band][k][j][i]
          int64_t i = g % ni;
          int64_t j = (g / ni) % nj;
          int64_t k = g / (ni * nj);
          B_packed[bt * grids * B_TILE + g * B_TILE + bl] =
              src[b * nk * nj * ni + k * nj * ni + j * ni + i];
        } else {
          B_packed[bt * grids * B_TILE + g * B_TILE + bl] = 0.0;
        }
      }
    }
  }
}

// Unpack from A_packed format to standard 3D+band layout
// A_packed: [band_tiles][grids][16_bands]
void unpack_from_A(const double* A_packed, double* dst, int64_t ni, int64_t nj,
                   int64_t nk, int64_t nb) {
  const int64_t grids = ni * nj * nk;
  const int64_t band_tiles = (nb + A_TILE - 1) / A_TILE;

  for (int64_t bt = 0; bt < band_tiles; ++bt) {
    for (int64_t g = 0; g < grids; ++g) {
      for (int64_t bl = 0; bl < A_TILE; ++bl) {
        int64_t b = bt * A_TILE + bl;
        if (b < nb) {
          int64_t i = g % ni;
          int64_t j = (g / ni) % nj;
          int64_t k = g / (ni * nj);
          dst[b * nk * nj * ni + k * nj * ni + j * ni + i] =
              A_packed[bt * grids * A_TILE + g * A_TILE + bl];
        }
      }
    }
  }
}

// Pack A_diag (diagonal values) to match grid indexing
// A_diag is per grid point, not per band
void pack_A_diag(const double* A_diag_3d, double* A_diag_packed, int64_t ni,
                 int64_t nj, int64_t nk) {
  const int64_t grids = ni * nj * nk;
  for (int64_t g = 0; g < grids; ++g) {
    int64_t i = g % ni;
    int64_t j = (g / ni) % nj;
    int64_t k = g / (ni * nj);
    A_diag_packed[g] = A_diag_3d[k * nj * ni + j * ni + i];
  }
}

// =============================================================================
// Naive reference stencil (unpacked layout)
// =============================================================================

void stencil_naive(const double* __restrict__ S, double* __restrict__ D,
                   const double* __restrict__ A_diag, int64_t ni, int64_t nj,
                   int64_t nk, int64_t nb, const double* coef_x,
                   const double* coef_y, const double* coef_z, double coef_0) {
  // S, D layout: [band][k][j][i]
  // A_diag layout: [k][j][i]
  const int64_t stride_j = ni;
  const int64_t stride_k = ni * nj;
  const int64_t stride_b = ni * nj * nk;

  for (int64_t b = 0; b < nb; ++b) {
    for (int64_t k = RADIUS; k < nk - RADIUS; ++k) {
      for (int64_t j = RADIUS; j < nj - RADIUS; ++j) {
        for (int64_t i = RADIUS; i < ni - RADIUS; ++i) {
          int64_t idx = i + j * stride_j + k * stride_k;
          int64_t idx_b = b * stride_b + idx;

          double a_val = A_diag[idx] + coef_0;
          double res = S[idx_b] * a_val;

          // X direction
          for (int r = 1; r <= RADIUS; ++r) {
            res += coef_x[r] * (S[idx_b + r] + S[idx_b - r]);
          }
          // Y direction
          for (int r = 1; r <= RADIUS; ++r) {
            res +=
                coef_y[r] * (S[idx_b + r * stride_j] + S[idx_b - r * stride_j]);
          }
          // Z direction
          for (int r = 1; r <= RADIUS; ++r) {
            res +=
                coef_z[r] * (S[idx_b + r * stride_k] + S[idx_b - r * stride_k]);
          }

          D[idx_b] = res;
        }
      }
    }
  }
}

// =============================================================================
// SVE stencil with packed input/output
// =============================================================================

// Helper: get B_packed address for grid point g, band offset within tile
inline const double* B_addr(const double* B_packed, int64_t g, int64_t bt,
                            int64_t grids) {
  return B_packed + bt * grids * B_TILE + g * B_TILE;
}

// Helper: get A_packed address for grid point g, band tile bt
inline double* A_addr(double* A_packed, int64_t g, int64_t bt, int64_t grids) {
  return A_packed + bt * grids * A_TILE + g * A_TILE;
}

void stencil_sve_packed(const double* __restrict__ S_packed,
                        double* __restrict__ D_packed,
                        const double* __restrict__ A_diag_packed, int64_t ni,
                        int64_t nj, int64_t nk, int64_t nb,
                        const double* coef_x, const double* coef_y,
                        const double* coef_z, double coef_0) {
  const int64_t grids = ni * nj * nk;
  const int64_t stride_j = ni;
  const int64_t stride_k = ni * nj;
  const int64_t b_tiles = (nb + B_TILE - 1) / B_TILE;
  const int64_t a_tiles = (nb + A_TILE - 1) / A_TILE;

  // Blocked iteration over k, j, i with OpenMP parallelism
#pragma omp parallel
  {
    // Thread-local SVE coefficient broadcasts
    svfloat64_t sve_coef0 = svdup_f64(coef_0);
    svfloat64_t sve_coef_x1 = svdup_f64(coef_x[1]);
    svfloat64_t sve_coef_x2 = svdup_f64(coef_x[2]);
    svfloat64_t sve_coef_x3 = svdup_f64(coef_x[3]);
    svfloat64_t sve_coef_x4 = svdup_f64(coef_x[4]);
    svfloat64_t sve_coef_x5 = svdup_f64(coef_x[5]);
    svfloat64_t sve_coef_x6 = svdup_f64(coef_x[6]);
    svfloat64_t sve_coef_y1 = svdup_f64(coef_y[1]);
    svfloat64_t sve_coef_y2 = svdup_f64(coef_y[2]);
    svfloat64_t sve_coef_y3 = svdup_f64(coef_y[3]);
    svfloat64_t sve_coef_y4 = svdup_f64(coef_y[4]);
    svfloat64_t sve_coef_y5 = svdup_f64(coef_y[5]);
    svfloat64_t sve_coef_y6 = svdup_f64(coef_y[6]);
    svfloat64_t sve_coef_z1 = svdup_f64(coef_z[1]);
    svfloat64_t sve_coef_z2 = svdup_f64(coef_z[2]);
    svfloat64_t sve_coef_z3 = svdup_f64(coef_z[3]);
    svfloat64_t sve_coef_z4 = svdup_f64(coef_z[4]);
    svfloat64_t sve_coef_z5 = svdup_f64(coef_z[5]);
    svfloat64_t sve_coef_z6 = svdup_f64(coef_z[6]);
    svbool_t ptrue = svptrue_b64();

#pragma omp for schedule(static) collapse(2)
    for (int64_t kk = RADIUS; kk < nk - RADIUS; kk += KC) {
      for (int64_t jj = RADIUS; jj < nj - RADIUS; jj += NC) {
        for (int64_t ii = RADIUS; ii < ni - RADIUS; ii += MC) {
          // Inner blocked loops
          const int64_t k_end = (kk + KC < nk - RADIUS) ? kk + KC : nk - RADIUS;
          const int64_t j_end = (jj + NC < nj - RADIUS) ? jj + NC : nj - RADIUS;
          const int64_t i_end = (ii + MC < ni - RADIUS) ? ii + MC : ni - RADIUS;

          for (int64_t k = kk; k < k_end; ++k) {
            for (int64_t j = jj; j < j_end; ++j) {
              for (int64_t i = ii; i < i_end; ++i) {
                int64_t g = i + j * stride_j + k * stride_k;

                // Load A_diag and broadcast (same for all bands)
                svfloat64_t sve_A = svdup_f64(A_diag_packed[g]);
                svfloat64_t sve_A_plus_coef0 = svadd_x(ptrue, sve_A, sve_coef0);

                // Process 8 bands at a time
                for (int64_t b = 0; b < nb; b += SVCNT) {
                  int64_t bt_in = b / B_TILE;
                  int64_t bl_in = b % B_TILE;
                  int64_t bt_out = b / A_TILE;
                  int64_t bl_out = b % A_TILE;

                  // Predicate for partial vector at end
                  svbool_t pg =
                      (b + SVCNT <= nb) ? ptrue : svwhilelt_b64(b, nb);

                  // Base address for this band chunk
                  const double* s_base =
                      S_packed + bt_in * grids * B_TILE + g * B_TILE + bl_in;

                  // Load center point
                  svfloat64_t res =
                      svmul_x(pg, svld1(pg, s_base), sve_A_plus_coef0);

// X direction neighbors (offset in grid = ±1, ±2, ... ±6)
#define X_NEIGHBOR(R, COEF)                                               \
  do {                                                                    \
    const double* s_plus =                                                \
        S_packed + bt_in * grids * B_TILE + (g + R) * B_TILE + bl_in;     \
    const double* s_minus =                                               \
        S_packed + bt_in * grids * B_TILE + (g - R) * B_TILE + bl_in;     \
    svfloat64_t sum = svadd_x(pg, svld1(pg, s_plus), svld1(pg, s_minus)); \
    res = svmla_x(pg, res, sum, COEF);                                    \
  } while (0)

                  X_NEIGHBOR(1, sve_coef_x1);
                  X_NEIGHBOR(2, sve_coef_x2);
                  X_NEIGHBOR(3, sve_coef_x3);
                  X_NEIGHBOR(4, sve_coef_x4);
                  X_NEIGHBOR(5, sve_coef_x5);
                  X_NEIGHBOR(6, sve_coef_x6);

#undef X_NEIGHBOR

// Y direction neighbors (offset in grid = ±ni, ±2*ni, ... ±6*ni)
#define Y_NEIGHBOR(R, COEF)                                               \
  do {                                                                    \
    int64_t g_plus = g + R * stride_j;                                    \
    int64_t g_minus = g - R * stride_j;                                   \
    const double* s_plus =                                                \
        S_packed + bt_in * grids * B_TILE + g_plus * B_TILE + bl_in;      \
    const double* s_minus =                                               \
        S_packed + bt_in * grids * B_TILE + g_minus * B_TILE + bl_in;     \
    svfloat64_t sum = svadd_x(pg, svld1(pg, s_plus), svld1(pg, s_minus)); \
    res = svmla_x(pg, res, sum, COEF);                                    \
  } while (0)

                  Y_NEIGHBOR(1, sve_coef_y1);
                  Y_NEIGHBOR(2, sve_coef_y2);
                  Y_NEIGHBOR(3, sve_coef_y3);
                  Y_NEIGHBOR(4, sve_coef_y4);
                  Y_NEIGHBOR(5, sve_coef_y5);
                  Y_NEIGHBOR(6, sve_coef_y6);

#undef Y_NEIGHBOR

// Z direction neighbors (offset in grid = ±ni*nj, ±2*ni*nj, ... ±6*ni*nj)
#define Z_NEIGHBOR(R, COEF)                                               \
  do {                                                                    \
    int64_t g_plus = g + R * stride_k;                                    \
    int64_t g_minus = g - R * stride_k;                                   \
    const double* s_plus =                                                \
        S_packed + bt_in * grids * B_TILE + g_plus * B_TILE + bl_in;      \
    const double* s_minus =                                               \
        S_packed + bt_in * grids * B_TILE + g_minus * B_TILE + bl_in;     \
    svfloat64_t sum = svadd_x(pg, svld1(pg, s_plus), svld1(pg, s_minus)); \
    res = svmla_x(pg, res, sum, COEF);                                    \
  } while (0)

                  Z_NEIGHBOR(1, sve_coef_z1);
                  Z_NEIGHBOR(2, sve_coef_z2);
                  Z_NEIGHBOR(3, sve_coef_z3);
                  Z_NEIGHBOR(4, sve_coef_z4);
                  Z_NEIGHBOR(5, sve_coef_z5);
                  Z_NEIGHBOR(6, sve_coef_z6);

#undef Z_NEIGHBOR

                  // Store to A_packed format
                  double* d_ptr =
                      D_packed + bt_out * grids * A_TILE + g * A_TILE + bl_out;
                  svstnt1(pg, d_ptr, res);
                }  // b loop
              }  // i loop
            }  // j loop
          }  // k loop
        }  // ii block
      }  // jj block
    }  // kk block
  }  // end parallel region
}

// =============================================================================
// Test harness
// =============================================================================

bool test_stencil(int64_t ni, int64_t nj, int64_t nk, int64_t nb) {
  printf("Testing stencil: ni=%ld nj=%ld nk=%ld nb=%ld\n", ni, nj, nk, nb);

  const int64_t grids = ni * nj * nk;
  const int64_t total = grids * nb;
  const int64_t b_packed_size = ((nb + B_TILE - 1) / B_TILE) * grids * B_TILE;
  const int64_t a_packed_size = ((nb + A_TILE - 1) / A_TILE) * grids * A_TILE;

  // Allocate
  double* S = (double*)aligned_alloc(64, total * sizeof(double));
  double* D_ref = (double*)aligned_alloc(64, total * sizeof(double));
  double* D_test = (double*)aligned_alloc(64, total * sizeof(double));
  double* A_diag = (double*)aligned_alloc(64, grids * sizeof(double));

  double* S_packed = (double*)aligned_alloc(64, b_packed_size * sizeof(double));
  double* D_packed = (double*)aligned_alloc(64, a_packed_size * sizeof(double));
  double* A_diag_packed = (double*)aligned_alloc(64, grids * sizeof(double));

  // Coefficients
  double coef_x[RADIUS + 1] = {0, 0.1, 0.05, 0.025, 0.0125, 0.00625, 0.003125};
  double coef_y[RADIUS + 1] = {0, 0.1, 0.05, 0.025, 0.0125, 0.00625, 0.003125};
  double coef_z[RADIUS + 1] = {0, 0.1, 0.05, 0.025, 0.0125, 0.00625, 0.003125};
  double coef_0 = -0.5;

  // Initialize
  for (int64_t i = 0; i < total; ++i) {
    S[i] = 0.001 * (i % 1000);
  }
  for (int64_t i = 0; i < grids; ++i) {
    A_diag[i] = 1.0 + 0.001 * (i % 100);
  }
  std::memset(D_ref, 0, total * sizeof(double));
  std::memset(D_test, 0, total * sizeof(double));
  std::memset(D_packed, 0, a_packed_size * sizeof(double));

  // Run reference
  stencil_naive(S, D_ref, A_diag, ni, nj, nk, nb, coef_x, coef_y, coef_z,
                coef_0);

  // Pack input
  pack_to_B(S, S_packed, ni, nj, nk, nb);
  pack_A_diag(A_diag, A_diag_packed, ni, nj, nk);

  // Run SVE version
  stencil_sve_packed(S_packed, D_packed, A_diag_packed, ni, nj, nk, nb, coef_x,
                     coef_y, coef_z, coef_0);

  // Unpack output
  unpack_from_A(D_packed, D_test, ni, nj, nk, nb);

  // Compare
  bool pass = true;
  double max_err = 0;
  int64_t first_mismatch = -1;

  for (int64_t b = 0; b < nb; ++b) {
    for (int64_t k = RADIUS; k < nk - RADIUS; ++k) {
      for (int64_t j = RADIUS; j < nj - RADIUS; ++j) {
        for (int64_t i = RADIUS; i < ni - RADIUS; ++i) {
          int64_t idx = b * grids + k * nj * ni + j * ni + i;
          double ref = D_ref[idx];
          double test = D_test[idx];
          double err = std::abs(ref - test);
          double rel_err = err / (std::abs(ref) + 1e-10);

          if (rel_err > max_err) max_err = rel_err;

          if (rel_err > 1e-10 && pass) {
            printf(
                "  MISMATCH at b=%ld i=%ld j=%ld k=%ld: ref=%.10f test=%.10f "
                "rel_err=%.2e\n",
                b, i, j, k, ref, test, rel_err);
            first_mismatch = idx;
            pass = false;
          }
        }
      }
    }
  }

  if (pass) {
    printf("  PASSED! (max_rel_err=%.2e)\n", max_err);
  } else {
    printf("  FAILED! (max_rel_err=%.2e)\n", max_err);
  }

  free(S);
  free(D_ref);
  free(D_test);
  free(A_diag);
  free(S_packed);
  free(D_packed);
  free(A_diag_packed);

  return pass;
}

// =============================================================================
// Benchmark
// =============================================================================

double benchmark_stencil(int64_t ni, int64_t nj, int64_t nk, int64_t nb) {
  const int64_t grids = ni * nj * nk;
  const int64_t b_packed_size = ((nb + B_TILE - 1) / B_TILE) * grids * B_TILE;
  const int64_t a_packed_size = ((nb + A_TILE - 1) / A_TILE) * grids * A_TILE;

  double* S_packed = (double*)aligned_alloc(64, b_packed_size * sizeof(double));
  double* D_packed = (double*)aligned_alloc(64, a_packed_size * sizeof(double));
  double* A_diag_packed = (double*)aligned_alloc(64, grids * sizeof(double));

  double coef_x[RADIUS + 1] = {0, 0.1, 0.05, 0.025, 0.0125, 0.00625, 0.003125};
  double coef_y[RADIUS + 1] = {0, 0.1, 0.05, 0.025, 0.0125, 0.00625, 0.003125};
  double coef_z[RADIUS + 1] = {0, 0.1, 0.05, 0.025, 0.0125, 0.00625, 0.003125};
  double coef_0 = -0.5;

  // Initialize
  for (int64_t i = 0; i < b_packed_size; ++i) S_packed[i] = 0.001 * (i % 1000);
  for (int64_t i = 0; i < grids; ++i)
    A_diag_packed[i] = 1.0 + 0.001 * (i % 100);
  std::memset(D_packed, 0, a_packed_size * sizeof(double));

  // Warmup
  for (int w = 0; w < WITERS; ++w) {
    stencil_sve_packed(S_packed, D_packed, A_diag_packed, ni, nj, nk, nb,
                       coef_x, coef_y, coef_z, coef_0);
  }

  // Benchmark
  auto start = std::chrono::high_resolution_clock::now();
  for (int it = 0; it < ITERS; ++it) {
    stencil_sve_packed(S_packed, D_packed, A_diag_packed, ni, nj, nk, nb,
                       coef_x, coef_y, coef_z, coef_0);
  }
  auto end = std::chrono::high_resolution_clock::now();

  double time_ns =
      std::chrono::duration<double, std::nano>(end - start).count() / ITERS;

  free(S_packed);
  free(D_packed);
  free(A_diag_packed);

  return time_ns;
}

// =============================================================================
// Main
// =============================================================================

int main(int argc, char** argv) {
  printf("SVE Stencil with Packed I/O\n");
  printf("SVCNT=%d, B_TILE=%d, A_TILE=%d, RADIUS=%d\n", SVCNT, B_TILE, A_TILE,
         RADIUS);
  printf("Blocking: MC=%d, NC=%d, KC=%d\n", MC, NC, KC);
  printf("Threads=%d\n\n", NUM_THREADS);

  omp_set_num_threads(NUM_THREADS);

#ifndef SKIP_VERIFY
  int passed = 0, total = 0;

  // Test 1: Small
  printf("=== Test 1: Small ===\n");
  if (test_stencil(20, 20, 20, 16)) passed++;
  total++;

  // Test 2: Medium
  printf("\n=== Test 2: Medium ===\n");
  if (test_stencil(24, 24, 24, 32)) passed++;
  total++;

  // Test 3: With more bands
  printf("\n=== Test 3: More bands ===\n");
  if (test_stencil(20, 20, 20, 64)) passed++;
  total++;

  printf("\n=== Summary: %d/%d tests passed ===\n", passed, total);
  if (passed != total) return 1;
#endif

  // Benchmark
  int64_t ni = 56, nj = 56, nk = 56, nb = 616;
  if (argc == 5) {
    ni = std::atoll(argv[1]);
    nj = std::atoll(argv[2]);
    nk = std::atoll(argv[3]);
    nb = std::atoll(argv[4]);
  }

  printf("\n=== Benchmark: ni=%ld nj=%ld nk=%ld nb=%ld ===\n", ni, nj, nk, nb);

  double time_ns = benchmark_stencil(ni, nj, nk, nb);
  double time_us = time_ns / 1000.0;

  // Interior grid points (excluding halo)
  int64_t interior = (ni - 2 * RADIUS) * (nj - 2 * RADIUS) * (nk - 2 * RADIUS);
  // Operations per point: 1 mul + 36 loads + 18 adds + 18 FMAs = ~73 flops per
  // band
  double flops_per_point = 73.0 * nb;
  double total_flops = interior * flops_per_point;
  double gflops = total_flops / time_ns;

  // CSV output: MC,NC,KC,ni,nj,nk,nb,time_us,GFLOP/s
  printf("%d,%d,%d,%ld,%ld,%ld,%ld,%.2f,%.2f\n", MC, NC, KC, ni, nj, nk, nb,
         time_us, gflops);

  return 0;
}
