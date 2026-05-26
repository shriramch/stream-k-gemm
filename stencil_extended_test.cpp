// stencil_extended_test.cpp
//
// Test extended packed stencil correctness
//
// Compile: sme++ -O2 -std=c++17 -march=armv9-a+sve2 -fopenmp -I./include
// stencil_extended_test.cpp -o stencil_extended_test Run: OMP_NUM_THREADS=1
// armie64 ./stencil_extended_test

#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <random>

#include "include/stencil_extended_packed.hpp"

// Mock halo header for testing without MPI
#define HALO_PACKED_TEST_MOCK
#include "include/halo_packed.hpp"

// Naive reference stencil (unpacked layout)
void stencil_naive_3d(const double* S,       // [band][k][j][i]
                      double* D,             // [band][k][j][i]
                      const double* A_diag,  // [k][j][i]
                      uint ni, uint nj, uint nk, uint nb, int FDn,
                      const double* coef_x, const double* coef_y,
                      const double* coef_z, double coef_0) {
  const uint stride_b = ni * nj * nk;

  for (uint b = 0; b < nb; b++) {
    for (uint k = 0; k < nk; k++) {
      for (uint j = 0; j < nj; j++) {
        for (uint i = 0; i < ni; i++) {
          uint idx = i + j * ni + k * ni * nj;
          double a_val = A_diag[idx] + coef_0;
          double res = S[b * stride_b + idx] * a_val;

          // X direction
          for (int r = 1; r <= FDn; r++) {
            double s_plus = S[b * stride_b + (i + r) + j * ni + k * ni * nj];
            double s_minus = S[b * stride_b + (i - r) + j * ni + k * ni * nj];
            res += coef_x[r] * (s_plus + s_minus);
          }

          // Y direction
          for (int r = 1; r <= FDn; r++) {
            double s_plus = S[b * stride_b + i + (j + r) * ni + k * ni * nj];
            double s_minus = S[b * stride_b + i + (j - r) * ni + k * ni * nj];
            res += coef_y[r] * (s_plus + s_minus);
          }

          // Z direction
          for (int r = 1; r <= FDn; r++) {
            double s_plus = S[b * stride_b + i + j * ni + (k + r) * ni * nj];
            double s_minus = S[b * stride_b + i + j * ni + (k - r) * ni * nj];
            res += coef_z[r] * (s_plus + s_minus);
          }

          D[b * stride_b + idx] = res;
        }
      }
    }
  }
}

// Pack from standard [band][k][j][i] to 16-band packed extended
void pack_to_extended_16(const double* src,  // [band][k_full][j_full][i_full]
                                             // with k_full = nk + 2*FDn, etc.
                         double* extended_packed,  // [tile][K_ex][16]
                         uint ni, uint nj, uint nk, uint nb, int FDn) {
  const uint ni_ex = ni + 2 * FDn;
  const uint nj_ex = nj + 2 * FDn;
  const uint nk_ex = nk + 2 * FDn;
  const uint K_ex = ni_ex * nj_ex * nk_ex;
  const uint num_tiles = (nb + 15) / 16;

  for (uint tile = 0; tile < num_tiles; tile++) {
    for (uint g_ex = 0; g_ex < K_ex; g_ex++) {
      uint i_ex = g_ex % ni_ex;
      uint j_ex = (g_ex / ni_ex) % nj_ex;
      uint k_ex = g_ex / (ni_ex * nj_ex);

      for (uint bl = 0; bl < 16; bl++) {
        uint b = tile * 16 + bl;
        if (b < nb) {
          // src layout: [band][k_full][j_full][i_full]
          extended_packed[(tile * K_ex + g_ex) * 16 + bl] =
              src[b * nk_ex * nj_ex * ni_ex + k_ex * nj_ex * ni_ex +
                  j_ex * ni_ex + i_ex];
        } else {
          extended_packed[(tile * K_ex + g_ex) * 16 + bl] = 0.0;
        }
      }
    }
  }
}

// Unpack from 32-band packed to standard [band][k][j][i]
void unpack_from_32(const double* packed,  // [tile32][K][32]
                    double* dst,           // [band][k][j][i]
                    uint ni, uint nj, uint nk, uint nb) {
  const uint K = ni * nj * nk;
  const uint num_tiles = (nb + 31) / 32;

  for (uint tile = 0; tile < num_tiles; tile++) {
    for (uint g = 0; g < K; g++) {
      uint i = g % ni;
      uint j = (g / ni) % nj;
      uint k = g / (ni * nj);

      for (uint bl = 0; bl < 32; bl++) {
        uint b = tile * 32 + bl;
        if (b < nb) {
          dst[b * K + k * ni * nj + j * ni + i] =
              packed[(tile * K + g) * 32 + bl];
        }
      }
    }
  }
}

// Pack A_diag to grid order
void pack_A_diag(const double* A_diag_3d, double* A_diag_packed, uint ni,
                 uint nj, uint nk) {
  for (uint g = 0; g < ni * nj * nk; g++) {
    uint i = g % ni;
    uint j = (g / ni) % nj;
    uint k = g / (ni * nj);
    A_diag_packed[g] = A_diag_3d[k * ni * nj + j * ni + i];
  }
}

int main() {
  printf("=== Extended Packed Stencil Test ===\n\n");

  // Test parameters
  const uint ni = 12, nj = 10, nk = 8, nb = 48;
  const int FDn = 6;

  const uint ni_ex = ni + 2 * FDn;
  const uint nj_ex = nj + 2 * FDn;
  const uint nk_ex = nk + 2 * FDn;
  const uint K = ni * nj * nk;
  const uint K_ex = ni_ex * nj_ex * nk_ex;
  const uint num_tiles_16 = (nb + 15) / 16;
  const uint num_tiles_32 = (nb + 31) / 32;

  printf("Grid: %u x %u x %u, bands: %u, FDn: %d\n", ni, nj, nk, nb, FDn);
  printf("Extended: %u x %u x %u\n", ni_ex, nj_ex, nk_ex);

  // Stencil coefficients (6th order finite difference)
  double coef_x[7] = {0, -1.0 / 12, 2.0 / 3, -2.5, 8.0 / 3, -1.0 / 4, 1.0 / 30};
  double coef_y[7] = {0, -1.0 / 12, 2.0 / 3, -2.5, 8.0 / 3, -1.0 / 4, 1.0 / 30};
  double coef_z[7] = {0, -1.0 / 12, 2.0 / 3, -2.5, 8.0 / 3, -1.0 / 4, 1.0 / 30};
  double coef_0 = -0.5;

  // Allocate arrays
  double* S_full = new double[nb * K_ex]();  // Full input (extended unpacked)
  double* S_extended_packed = new double[num_tiles_16 * K_ex * 16]();
  double* D_ref = new double[nb * K]();  // Reference output
  double* D_32packed = new double[num_tiles_32 * K * 32]();
  double* D_unpacked = new double[nb * K]();  // Unpacked from test
  double* A_diag_3d =
      new double[K_ex]();  // Diagonal (extended size for addressing)
  double* A_diag_packed = new double[K]();

  // Initialize with random data
  std::mt19937 rng(12345);
  std::uniform_real_distribution<double> dist(-1.0, 1.0);

  for (uint i = 0; i < nb * K_ex; i++) {
    S_full[i] = dist(rng);
  }
  for (uint i = 0; i < K_ex; i++) {
    A_diag_3d[i] = dist(rng) * 10.0;  // Diagonal values
  }

  // Pack A_diag to local grid order (interior only)
  for (uint k = 0; k < nk; k++) {
    for (uint j = 0; j < nj; j++) {
      for (uint i = 0; i < ni; i++) {
        uint g = i + j * ni + k * ni * nj;
        uint i_full = i + FDn;
        uint j_full = j + FDn;
        uint k_full = k + FDn;
        A_diag_packed[g] =
            A_diag_3d[i_full + j_full * ni_ex + k_full * ni_ex * nj_ex];
      }
    }
  }

  printf("\n1. Computing reference stencil (naive)...\n");

  // Extract interior and compute reference stencil
  // The naive stencil needs interior input with FDn padding on each side
  // We'll compute for interior region only
  double* S_interior = new double[nb * K]();
  double* A_diag_interior = new double[K]();

  // Copy interior from S_full to S_interior
  for (uint b = 0; b < nb; b++) {
    for (uint k = 0; k < nk; k++) {
      for (uint j = 0; j < nj; j++) {
        for (uint i = 0; i < ni; i++) {
          uint g = i + j * ni + k * ni * nj;
          uint i_full = i + FDn;
          uint j_full = j + FDn;
          uint k_full = k + FDn;
          S_interior[b * K + g] = S_full[b * K_ex + i_full + j_full * ni_ex +
                                         k_full * ni_ex * nj_ex];
        }
      }
    }
  }

  // Run naive stencil using the full domain (but only accessing interior
  // neighbors) Actually, we need full access, so use S_full directly with
  // proper indexing Let's just compute the reference differently - directly
  // compute each output
  for (uint b = 0; b < nb; b++) {
    for (uint k = 0; k < nk; k++) {
      for (uint j = 0; j < nj; j++) {
        for (uint i = 0; i < ni; i++) {
          uint g = i + j * ni + k * ni * nj;
          uint i_ex = i + FDn;
          uint j_ex = j + FDn;
          uint k_ex = k + FDn;
          uint idx_ex = i_ex + j_ex * ni_ex + k_ex * ni_ex * nj_ex;

          double a_val = A_diag_packed[g] + coef_0;
          double res = S_full[b * K_ex + idx_ex] * a_val;

          // X direction
          for (int r = 1; r <= FDn; r++) {
            res += coef_x[r] * (S_full[b * K_ex + idx_ex + r] +
                                S_full[b * K_ex + idx_ex - r]);
          }
          // Y direction
          for (int r = 1; r <= FDn; r++) {
            res += coef_y[r] * (S_full[b * K_ex + idx_ex + r * (int)ni_ex] +
                                S_full[b * K_ex + idx_ex - r * (int)ni_ex]);
          }
          // Z direction
          for (int r = 1; r <= FDn; r++) {
            res += coef_z[r] *
                   (S_full[b * K_ex + idx_ex + r * (int)(ni_ex * nj_ex)] +
                    S_full[b * K_ex + idx_ex - r * (int)(ni_ex * nj_ex)]);
          }

          D_ref[b * K + g] = res;
        }
      }
    }
  }

  printf("2. Packing input to extended 16-band format...\n");
  pack_to_extended_16(S_full, S_extended_packed, ni, nj, nk, nb, FDn);

  printf("3. Running extended scalar stencil (16->32)...\n");
  Stencil_method::Packed::calc_laplacian_extended_packed_16to32_scalar(
      S_extended_packed, D_32packed, A_diag_packed, ni, nj, nk, nb, FDn, coef_x,
      coef_y, coef_z, coef_0);

  printf("4. Unpacking output and comparing...\n");
  unpack_from_32(D_32packed, D_unpacked, ni, nj, nk, nb);

  // Compare
  double max_err = 0.0, max_rel = 0.0;
  uint err_count = 0;
  for (uint i = 0; i < nb * K; i++) {
    double err = std::fabs(D_ref[i] - D_unpacked[i]);
    double rel =
        (std::fabs(D_ref[i]) > 1e-10) ? err / std::fabs(D_ref[i]) : err;
    if (err > max_err) max_err = err;
    if (rel > max_rel) max_rel = rel;
    if (err > 1e-10) err_count++;
  }

  printf("   Scalar version: max_err=%e, max_rel=%e, err_count=%u\n", max_err,
         max_rel, err_count);
  bool scalar_pass = (max_err < 1e-10);

  // Now test SVE version
  printf("5. Running extended SVE stencil (16->32)...\n");
  memset(D_32packed, 0, num_tiles_32 * K * 32 * sizeof(double));

  Stencil_method::Packed::calc_laplacian_extended_packed_16to32(
      S_extended_packed, D_32packed, A_diag_packed, ni, nj, nk, nb, FDn, coef_x,
      coef_y, coef_z, coef_0);

  printf("6. Unpacking and comparing SVE output...\n");
  unpack_from_32(D_32packed, D_unpacked, ni, nj, nk, nb);

  max_err = 0.0;
  max_rel = 0.0;
  err_count = 0;
  for (uint i = 0; i < nb * K; i++) {
    double err = std::fabs(D_ref[i] - D_unpacked[i]);
    double rel =
        (std::fabs(D_ref[i]) > 1e-10) ? err / std::fabs(D_ref[i]) : err;
    if (err > max_err) max_err = err;
    if (rel > max_rel) max_rel = rel;
    if (err > 1e-10) err_count++;
  }

  printf("   SVE version: max_err=%e, max_rel=%e, err_count=%u\n", max_err,
         max_rel, err_count);
  bool sve_pass = (max_err < 1e-10);

  // Test 16->16 version
  printf("\n7. Testing 16->16 version...\n");
  double* D_16packed = new double[num_tiles_16 * K * 16]();

  Stencil_method::Packed::calc_laplacian_extended_packed_16to16(
      S_extended_packed, D_16packed, A_diag_packed, ni, nj, nk, nb, FDn, coef_x,
      coef_y, coef_z, coef_0);

  // Unpack from 16-packed
  memset(D_unpacked, 0, nb * K * sizeof(double));
  for (uint tile = 0; tile < num_tiles_16; tile++) {
    for (uint g = 0; g < K; g++) {
      uint i_l = g % ni;
      uint j_l = (g / ni) % nj;
      uint k_l = g / (ni * nj);

      for (uint bl = 0; bl < 16; bl++) {
        uint b = tile * 16 + bl;
        if (b < nb) {
          D_unpacked[b * K + k_l * ni * nj + j_l * ni + i_l] =
              D_16packed[(tile * K + g) * 16 + bl];
        }
      }
    }
  }

  max_err = 0.0;
  max_rel = 0.0;
  err_count = 0;
  for (uint i = 0; i < nb * K; i++) {
    double err = std::fabs(D_ref[i] - D_unpacked[i]);
    double rel =
        (std::fabs(D_ref[i]) > 1e-10) ? err / std::fabs(D_ref[i]) : err;
    if (err > max_err) max_err = err;
    if (rel > max_rel) max_rel = rel;
    if (err > 1e-10) err_count++;
  }

  printf("   16->16 version: max_err=%e, max_rel=%e, err_count=%u\n", max_err,
         max_rel, err_count);
  bool v16_pass = (max_err < 1e-10);

  // Cleanup
  delete[] S_full;
  delete[] S_extended_packed;
  delete[] S_interior;
  delete[] D_ref;
  delete[] D_32packed;
  delete[] D_16packed;
  delete[] D_unpacked;
  delete[] A_diag_3d;
  delete[] A_diag_packed;
  delete[] A_diag_interior;

  printf("\n=============================\n");
  printf("Scalar 16->32: %s\n", scalar_pass ? "PASS" : "FAIL");
  printf("SVE 16->32:    %s\n", sve_pass ? "PASS" : "FAIL");
  printf("SVE 16->16:    %s\n", v16_pass ? "PASS" : "FAIL");
  printf("=============================\n");

  return (scalar_pass && sve_pass && v16_pass) ? 0 : 1;
}
