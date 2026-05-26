// halo_packed_test.cpp - Test packed halo exchange functions
//
// Compile: g++ -O2 -std=c++17 -I./include halo_packed_test.cpp -o
// halo_packed_test Run: ./halo_packed_test

#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>
#include <vector>

#define HALO_PACKED_TEST_MOCK
#include "include/halo_packed.hpp"

// =============================================================================
// Test copy_interior_to_extended_packed
// =============================================================================
bool test_copy_interior() {
  printf("Testing copy_interior_to_extended_packed...\n");

  const uint ni = 10, nj = 8, nk = 6, nb = 32;
  const int FDn = 6;
  const uint K = ni * nj * nk;
  const uint ni_ex = ni + 2 * FDn;
  const uint nj_ex = nj + 2 * FDn;
  const uint nk_ex = nk + 2 * FDn;
  const uint K_ex = ni_ex * nj_ex * nk_ex;
  const uint num_tiles = (nb + 15) / 16;

  // Allocate arrays
  double* local_packed = new double[num_tiles * K * 16]();
  double* extended_packed = new double[num_tiles * K_ex * 16]();

  // Fill local with known pattern: value = tile*1000 + g*10 + b_local
  for (uint tile = 0; tile < num_tiles; tile++) {
    for (uint g = 0; g < K; g++) {
      for (uint bl = 0; bl < 16; bl++) {
        local_packed[(tile * K + g) * 16 + bl] = tile * 1000.0 + g * 10.0 + bl;
      }
    }
  }

  // Copy interior
  Stencil_method::Packed::copy_interior_to_extended_packed(
      local_packed, extended_packed, ni, nj, nk, nb, FDn);

  // Verify: check that interior of extended matches local
  bool pass = true;
  for (uint tile = 0; tile < num_tiles && pass; tile++) {
    for (uint k = 0; k < nk && pass; k++) {
      for (uint j = 0; j < nj && pass; j++) {
        for (uint i = 0; i < ni && pass; i++) {
          uint g = i + j * ni + k * ni * nj;
          uint g_ex = (i + FDn) + (j + FDn) * ni_ex + (k + FDn) * ni_ex * nj_ex;

          for (uint bl = 0; bl < 16; bl++) {
            double expected = local_packed[(tile * K + g) * 16 + bl];
            double actual = extended_packed[(tile * K_ex + g_ex) * 16 + bl];
            if (expected != actual) {
              printf(
                  "  FAIL at tile=%u g=%u g_ex=%u bl=%u: expected=%f "
                  "actual=%f\n",
                  tile, g, g_ex, bl, expected, actual);
              pass = false;
              break;
            }
          }
        }
      }
    }
  }

  delete[] local_packed;
  delete[] extended_packed;

  if (pass) printf("  PASS\n");
  return pass;
}

// =============================================================================
// Test manual halo fill (simulating what MPI would do)
// =============================================================================
bool test_manual_halo_fill() {
  printf("Testing manual halo fill (single rank periodic)...\n");

  const uint ni = 8, nj = 8, nk = 8, nb = 16;
  const int FDn = 2;  // Smaller for testing
  const uint K = ni * nj * nk;
  const uint ni_ex = ni + 2 * FDn;
  const uint nj_ex = nj + 2 * FDn;
  const uint nk_ex = nk + 2 * FDn;
  const uint K_ex = ni_ex * nj_ex * nk_ex;
  const uint num_tiles = (nb + 15) / 16;

  double* local_packed = new double[num_tiles * K * 16]();
  double* extended_packed = new double[num_tiles * K_ex * 16]();

  // Fill local with pattern: value = i + j*100 + k*10000 + bl*0.01
  for (uint k = 0; k < nk; k++) {
    for (uint j = 0; j < nj; j++) {
      for (uint i = 0; i < ni; i++) {
        uint g = i + j * ni + k * ni * nj;
        for (uint tile = 0; tile < num_tiles; tile++) {
          for (uint bl = 0; bl < 16; bl++) {
            local_packed[(tile * K + g) * 16 + bl] =
                i + j * 100.0 + k * 10000.0 + (tile * 16 + bl) * 0.01;
          }
        }
      }
    }
  }

  // Copy interior
  Stencil_method::Packed::copy_interior_to_extended_packed(
      local_packed, extended_packed, ni, nj, nk, nb, FDn);

  // Manually fill periodic halo (all 16 bands at once per grid point)
  for (uint tile = 0; tile < num_tiles; tile++) {
    // -X halo (ghost cells at i_ex < FDn)
    for (uint k = 0; k < nk; k++) {
      for (uint j = 0; j < nj; j++) {
        for (uint fi = 0; fi < (uint)FDn; fi++) {
          uint src_i = ni - FDn + fi;  // wrap from end
          uint g_src = src_i + j * ni + k * ni * nj;
          uint g_dst = fi + (j + FDn) * ni_ex + (k + FDn) * ni_ex * nj_ex;
          std::memcpy(extended_packed + (tile * K_ex + g_dst) * 16,
                      local_packed + (tile * K + g_src) * 16,
                      16 * sizeof(double));
        }
      }
    }

    // +X halo (ghost cells at i_ex >= ni + FDn)
    for (uint k = 0; k < nk; k++) {
      for (uint j = 0; j < nj; j++) {
        for (uint fi = 0; fi < (uint)FDn; fi++) {
          uint src_i = fi;  // wrap from start
          uint g_src = src_i + j * ni + k * ni * nj;
          uint dst_i_ex = ni + FDn + fi;
          uint g_dst = dst_i_ex + (j + FDn) * ni_ex + (k + FDn) * ni_ex * nj_ex;
          std::memcpy(extended_packed + (tile * K_ex + g_dst) * 16,
                      local_packed + (tile * K + g_src) * 16,
                      16 * sizeof(double));
        }
      }
    }
  }

  // Verify interior
  bool pass = true;
  for (uint tile = 0; tile < num_tiles && pass; tile++) {
    for (uint k = 0; k < nk && pass; k++) {
      for (uint j = 0; j < nj && pass; j++) {
        for (uint i = 0; i < ni && pass; i++) {
          uint g = i + j * ni + k * ni * nj;
          uint g_ex = (i + FDn) + (j + FDn) * ni_ex + (k + FDn) * ni_ex * nj_ex;

          for (uint bl = 0; bl < 16; bl++) {
            double expected = local_packed[(tile * K + g) * 16 + bl];
            double actual = extended_packed[(tile * K_ex + g_ex) * 16 + bl];
            if (expected != actual) {
              printf("  FAIL interior at tile=%u i=%u j=%u k=%u bl=%u\n", tile,
                     i, j, k, bl);
              pass = false;
              break;
            }
          }
        }
      }
    }
  }

  // Verify X halo (check specific points)
  if (pass) {
    uint tile = 0, bl = 5;
    // Check -X halo at (i_ex=0, j_ex=FDn, k_ex=FDn) should equal local (ni-FDn,
    // 0, 0)
    uint g_ex = 0 + FDn * ni_ex + FDn * ni_ex * nj_ex;
    uint g_src = (ni - FDn) + 0 * ni + 0 * ni * nj;
    double expected = local_packed[(tile * K + g_src) * 16 + bl];
    double actual = extended_packed[(tile * K_ex + g_ex) * 16 + bl];
    if (expected != actual) {
      printf("  FAIL -X halo: expected=%f actual=%f\n", expected, actual);
      pass = false;
    }

    // Check +X halo at (i_ex=ni+FDn, j_ex=FDn, k_ex=FDn) should equal local (0,
    // 0, 0)
    g_ex = (ni + FDn) + FDn * ni_ex + FDn * ni_ex * nj_ex;
    g_src = 0 + 0 * ni + 0 * ni * nj;
    expected = local_packed[(tile * K + g_src) * 16 + bl];
    actual = extended_packed[(tile * K_ex + g_ex) * 16 + bl];
    if (expected != actual) {
      printf("  FAIL +X halo: expected=%f actual=%f\n", expected, actual);
      pass = false;
    }
  }

  delete[] local_packed;
  delete[] extended_packed;

  if (pass) printf("  PASS\n");
  return pass;
}

// =============================================================================
// Main
// =============================================================================
int main() {
  printf("=== Packed Halo Exchange Tests ===\n\n");

  int tests = 0, passed = 0;

  tests++;
  if (test_copy_interior()) passed++;

  tests++;
  if (test_manual_halo_fill()) passed++;

  printf("\n======================\n");
  printf("TOTAL: %d/%d tests passed\n", passed, tests);

  return (passed == tests) ? 0 : 1;
}
