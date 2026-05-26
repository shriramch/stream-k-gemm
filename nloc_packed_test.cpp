// nloc_packed_test.cpp - Test correctness of packed nloc projection
//
// Compares packed implementation against naive unpacked reference.
// Run: g++ -O2 -std=c++17 -fopenmp nloc_packed_test.cpp -o nloc_packed_test &&
// ./nloc_packed_test

#include <algorithm>
#include <chrono>
#include <cmath>
#include <cstdint>
#include <cstring>
#include <iostream>
#include <random>
#include <vector>

using uint = unsigned int;

// =============================================================================
// Pack/Unpack utilities (same layout as Array_4D_Packed_16)
// Packed: data[(tile * K + g) * 16 + b_local] where tile=b/16, b_local=b%16
// Unpacked: data[g + b * K] (column-major in band)
// =============================================================================

template <typename T>
void pack_16(const T* unpacked, T* packed, uint K, uint nb) {
  const uint TILE = 16;
  const uint num_tiles = (nb + TILE - 1) / TILE;

  for (uint b = 0; b < nb; b++) {
    const uint tile = b / TILE;
    const uint b_local = b % TILE;
    for (uint g = 0; g < K; g++) {
      packed[(tile * K + g) * TILE + b_local] = unpacked[g + b * K];
    }
  }
}

template <typename T>
void unpack_16(const T* packed, T* unpacked, uint K, uint nb) {
  const uint TILE = 16;
  const uint num_tiles = (nb + TILE - 1) / TILE;

  for (uint b = 0; b < nb; b++) {
    const uint tile = b / TILE;
    const uint b_local = b % TILE;
    for (uint g = 0; g < K; g++) {
      unpacked[g + b * K] = packed[(tile * K + g) * TILE + b_local];
    }
  }
}

template <typename T>
uint get_packed_size(uint K, uint nb) {
  const uint TILE = 16;
  const uint num_tiles = (nb + TILE - 1) / TILE;
  return num_tiles * K * TILE;
}

// =============================================================================
// Reference (naive) unpacked implementation
//
// Input:  psi[K, nb] - column-major (g + b*K)
// Output: result[K, nb] - accumulated (+=)
// Projector: chi[nrow, ncol], gamma[ncol], index[nrow]
// =============================================================================

template <typename T>
void nloc_project_reference(
    T* result,          // [K, nb] - accumulate
    const T* psi,       // [K, nb] - input
    const T* chi,       // [nrow, ncol] - projector basis (col-major)
    const T* gamma,     // [ncol] - weights
    const uint* index,  // [nrow] - grid indices
    uint K, uint nb, uint nrow, uint ncol, T dv) {
  // Step 1: GATHER filtered_psi[nrow, nb] = psi[index[:], :]
  std::vector<T> filtered(nrow * nb);
  for (uint b = 0; b < nb; b++) {
    for (uint r = 0; r < nrow; r++) {
      filtered[r + b * nrow] = psi[index[r] + b * K];
    }
  }

  // Step 2: Forward GEMM: C[ncol, nb] = chi^T * filtered * dv
  // chi^T[ncol, nrow] * filtered[nrow, nb] = C[ncol, nb]
  std::vector<T> C(ncol * nb, T(0));
  for (uint b = 0; b < nb; b++) {
    for (uint c = 0; c < ncol; c++) {
      T sum = T(0);
      for (uint r = 0; r < nrow; r++) {
        // chi^T[c, r] = chi[r, c] = chi[r + c * nrow]
        sum += chi[r + c * nrow] * filtered[r + b * nrow];
      }
      C[c + b * ncol] = sum * dv;
    }
  }

  // Step 3: Scale by gamma: C[c, :] *= gamma[c]
  for (uint b = 0; b < nb; b++) {
    for (uint c = 0; c < ncol; c++) {
      C[c + b * ncol] *= gamma[c];
    }
  }

  // Step 4: Backward GEMM: temp[nrow, nb] = chi * C
  // chi[nrow, ncol] * C[ncol, nb] = temp[nrow, nb]
  std::vector<T> temp(nrow * nb, T(0));
  for (uint b = 0; b < nb; b++) {
    for (uint r = 0; r < nrow; r++) {
      T sum = T(0);
      for (uint c = 0; c < ncol; c++) {
        sum += chi[r + c * nrow] * C[c + b * ncol];
      }
      temp[r + b * nrow] = sum;
    }
  }

  // Step 5: SCATTER: result[index[:], :] += temp
  for (uint b = 0; b < nb; b++) {
    for (uint r = 0; r < nrow; r++) {
      result[index[r] + b * K] += temp[r + b * nrow];
    }
  }
}

// =============================================================================
// Packed implementation (standalone, no external dependencies)
// =============================================================================

template <typename T>
void gather_rows_packed_rowmajor(const T* psi_packed,  // [num_tiles, K, 16]
                                 T* filtered,  // [nrow, nb] output (row-major)
                                 const uint* index, uint nrow, uint nb, uint K,
                                 uint num_tiles) {
  const uint TILE = 16;

  for (uint r = 0; r < nrow; r++) {
    const uint g = index[r];
    T* dst = filtered + r * nb;

    for (uint tile = 0; tile < num_tiles; tile++) {
      const uint b_start = tile * TILE;
      const uint b_end = (b_start + TILE > nb) ? nb : b_start + TILE;
      const uint count = b_end - b_start;

      const T* src = psi_packed + (tile * K + g) * TILE;
      std::memcpy(dst + b_start, src, count * sizeof(T));
    }
  }
}

template <typename T>
void scatter_rows_packed_rowmajor(
    const T* temp,     // [nrow, nb] input (row-major)
    T* result_packed,  // [num_tiles, K, 16] output
    const uint* index, uint nrow, uint nb, uint K, uint num_tiles) {
  const uint TILE = 16;

  for (uint r = 0; r < nrow; r++) {
    const uint g = index[r];
    const T* src = temp + r * nb;

    for (uint tile = 0; tile < num_tiles; tile++) {
      const uint b_start = tile * TILE;
      const uint b_end = (b_start + TILE > nb) ? nb : b_start + TILE;
      const uint count = b_end - b_start;

      T* dst = result_packed + (tile * K + g) * TILE;
      for (uint i = 0; i < count; i++) {
        dst[i] += src[b_start + i];
      }
    }
  }
}

template <typename T>
void nloc_project_packed(
    T* result_packed,     // [num_tiles, K, 16] - accumulate
    const T* psi_packed,  // [num_tiles, K, 16] - input
    const T* chi,         // [nrow, ncol] - projector basis (col-major)
    const T* gamma,       // [ncol] - weights
    const uint* index,    // [nrow] - grid indices
    uint K, uint nb, uint nrow, uint ncol, T dv) {
  const uint TILE = 16;
  const uint num_tiles = (nb + TILE - 1) / TILE;

  // Step 1: GATHER filtered[nrow, nb] row-major
  std::vector<T> filtered(nrow * nb);
  gather_rows_packed_rowmajor(psi_packed, filtered.data(), index, nrow, nb, K,
                              num_tiles);

  // Convert to col-major for GEMM
  std::vector<T> filtered_colmaj(nrow * nb);
  for (uint r = 0; r < nrow; r++) {
    for (uint b = 0; b < nb; b++) {
      filtered_colmaj[r + b * nrow] = filtered[r * nb + b];
    }
  }

  // Step 2: Forward GEMM: C[ncol, nb] = chi^T * filtered * dv
  std::vector<T> C(ncol * nb, T(0));
  for (uint b = 0; b < nb; b++) {
    for (uint c = 0; c < ncol; c++) {
      T sum = T(0);
      for (uint r = 0; r < nrow; r++) {
        sum += chi[r + c * nrow] * filtered_colmaj[r + b * nrow];
      }
      C[c + b * ncol] = sum * dv;
    }
  }

  // Step 3: Scale by gamma
  for (uint b = 0; b < nb; b++) {
    for (uint c = 0; c < ncol; c++) {
      C[c + b * ncol] *= gamma[c];
    }
  }

  // Step 4: Backward GEMM: temp[nrow, nb] = chi * C (col-major)
  std::vector<T> temp_colmaj(nrow * nb, T(0));
  for (uint b = 0; b < nb; b++) {
    for (uint r = 0; r < nrow; r++) {
      T sum = T(0);
      for (uint c = 0; c < ncol; c++) {
        sum += chi[r + c * nrow] * C[c + b * ncol];
      }
      temp_colmaj[r + b * nrow] = sum;
    }
  }

  // Convert to row-major for scatter
  std::vector<T> temp_rowmaj(nrow * nb);
  for (uint r = 0; r < nrow; r++) {
    for (uint b = 0; b < nb; b++) {
      temp_rowmaj[r * nb + b] = temp_colmaj[r + b * nrow];
    }
  }

  // Step 5: SCATTER
  scatter_rows_packed_rowmajor(temp_rowmaj.data(), result_packed, index, nrow,
                               nb, K, num_tiles);
}

// =============================================================================
// Test harness
// =============================================================================

template <typename T>
bool run_test(uint K, uint nb, uint nrow, uint ncol, int seed = 42) {
  std::mt19937 rng(seed);
  std::uniform_real_distribution<T> dist(-1.0, 1.0);
  std::uniform_int_distribution<uint> idx_dist(0, K - 1);

  const T dv = 0.01;
  const uint TILE = 16;
  const uint num_tiles = (nb + TILE - 1) / TILE;
  const uint packed_size = num_tiles * K * TILE;

  // Allocate arrays
  std::vector<T> psi_unpacked(K * nb);
  std::vector<T> psi_packed(packed_size, T(0));
  std::vector<T> result_ref(K * nb, T(0));
  std::vector<T> result_packed(packed_size, T(0));
  std::vector<T> result_unpacked(K * nb, T(0));

  std::vector<T> chi(nrow * ncol);
  std::vector<T> gamma(ncol);
  std::vector<uint> index(nrow);

  // Initialize random data
  for (auto& v : psi_unpacked) v = dist(rng);
  for (auto& v : chi) v = dist(rng);
  for (auto& v : gamma) v = dist(rng) * 0.5 + 0.5;  // positive

  // Generate unique random indices
  std::vector<uint> all_indices(K);
  for (uint i = 0; i < K; i++) all_indices[i] = i;
  std::shuffle(all_indices.begin(), all_indices.end(), rng);
  for (uint i = 0; i < nrow; i++) index[i] = all_indices[i];
  std::sort(index.begin(), index.end());  // Sort for cache efficiency

  // Pack psi
  pack_16(psi_unpacked.data(), psi_packed.data(), K, nb);

  // Run reference
  nloc_project_reference(result_ref.data(), psi_unpacked.data(), chi.data(),
                         gamma.data(), index.data(), K, nb, nrow, ncol, dv);

  // Run packed
  nloc_project_packed(result_packed.data(), psi_packed.data(), chi.data(),
                      gamma.data(), index.data(), K, nb, nrow, ncol, dv);

  // Unpack result
  unpack_16(result_packed.data(), result_unpacked.data(), K, nb);

  // Compare
  T max_err = T(0);
  T max_ref = T(0);
  uint err_count = 0;
  for (uint i = 0; i < K * nb; i++) {
    T err = std::abs(result_ref[i] - result_unpacked[i]);
    max_err = std::max(max_err, err);
    max_ref = std::max(max_ref, std::abs(result_ref[i]));
    if (err > 1e-6 * std::max(T(1), std::abs(result_ref[i]))) {
      err_count++;
    }
  }

  T rel_err = max_ref > 0 ? max_err / max_ref : max_err;
  bool pass = rel_err < 1e-5;

  std::cout << "  K=" << K << ", nb=" << nb << ", nrow=" << nrow
            << ", ncol=" << ncol << " | max_err=" << max_err
            << ", rel_err=" << rel_err << (pass ? " PASS" : " FAIL")
            << std::endl;

  if (!pass) {
    std::cout << "    First few errors:" << std::endl;
    int shown = 0;
    for (uint i = 0; i < K * nb && shown < 5; i++) {
      T err = std::abs(result_ref[i] - result_unpacked[i]);
      if (err > 1e-6) {
        std::cout << "      [" << i << "] ref=" << result_ref[i]
                  << " got=" << result_unpacked[i] << " err=" << err
                  << std::endl;
        shown++;
      }
    }
  }

  return pass;
}

// Test gather/scatter isolation
template <typename T>
bool test_gather_scatter(uint K, uint nb, uint nrow) {
  std::mt19937 rng(123);
  std::uniform_real_distribution<T> dist(-1.0, 1.0);

  const uint TILE = 16;
  const uint num_tiles = (nb + TILE - 1) / TILE;
  const uint packed_size = num_tiles * K * TILE;

  // Create unpacked data
  std::vector<T> psi_unpacked(K * nb);
  for (auto& v : psi_unpacked) v = dist(rng);

  // Generate indices
  std::vector<uint> index(nrow);
  for (uint i = 0; i < nrow; i++) index[i] = i * (K / nrow);  // spread out

  // Pack
  std::vector<T> psi_packed(packed_size, T(0));
  pack_16(psi_unpacked.data(), psi_packed.data(), K, nb);

  // Gather from packed
  std::vector<T> filtered_packed(nrow * nb);
  gather_rows_packed_rowmajor(psi_packed.data(), filtered_packed.data(),
                              index.data(), nrow, nb, K, num_tiles);

  // Gather from unpacked (reference)
  std::vector<T> filtered_ref(nrow * nb);
  for (uint r = 0; r < nrow; r++) {
    for (uint b = 0; b < nb; b++) {
      filtered_ref[r * nb + b] = psi_unpacked[index[r] + b * K];
    }
  }

  // Compare
  T max_err = T(0);
  for (uint i = 0; i < nrow * nb; i++) {
    max_err = std::max(max_err, std::abs(filtered_packed[i] - filtered_ref[i]));
  }

  bool gather_pass = max_err < 1e-10;
  std::cout << "  Gather test K=" << K << ", nb=" << nb << ", nrow=" << nrow
            << " | max_err=" << max_err << (gather_pass ? " PASS" : " FAIL")
            << std::endl;

  // Test scatter: start with zeros, scatter filtered, compare
  std::vector<T> result_packed(packed_size, T(0));
  std::vector<T> result_ref(K * nb, T(0));

  scatter_rows_packed_rowmajor(filtered_ref.data(), result_packed.data(),
                               index.data(), nrow, nb, K, num_tiles);

  // Scatter reference
  for (uint r = 0; r < nrow; r++) {
    for (uint b = 0; b < nb; b++) {
      result_ref[index[r] + b * K] += filtered_ref[r * nb + b];
    }
  }

  // Unpack and compare
  std::vector<T> result_unpacked(K * nb);
  unpack_16(result_packed.data(), result_unpacked.data(), K, nb);

  max_err = T(0);
  for (uint i = 0; i < K * nb; i++) {
    max_err = std::max(max_err, std::abs(result_ref[i] - result_unpacked[i]));
  }

  bool scatter_pass = max_err < 1e-10;
  std::cout << "  Scatter test K=" << K << ", nb=" << nb << ", nrow=" << nrow
            << " | max_err=" << max_err << (scatter_pass ? " PASS" : " FAIL")
            << std::endl;

  return gather_pass && scatter_pass;
}

int main() {
  std::cout << "=== Packed Nloc Projection Correctness Tests ===" << std::endl;

  bool all_pass = true;

  // Test gather/scatter first
  std::cout << "\nGather/Scatter isolation tests:" << std::endl;
  all_pass &= test_gather_scatter<double>(1000, 32, 50);
  all_pass &=
      test_gather_scatter<double>(1000, 48, 100);  // nb not multiple of 16
  all_pass &= test_gather_scatter<double>(500, 17, 30);  // small odd nb
  all_pass &= test_gather_scatter<float>(1000, 32, 50);

  // Full nloc projection tests
  std::cout << "\nFull nloc_project tests (double):" << std::endl;
  all_pass &= run_test<double>(1000, 32, 100, 8);    // typical
  all_pass &= run_test<double>(1000, 64, 200, 12);   // larger
  all_pass &= run_test<double>(500, 48, 50, 4);      // nb not multiple of 16
  all_pass &= run_test<double>(2000, 128, 500, 16);  // big projector
  all_pass &= run_test<double>(100, 16, 20, 3);      // small
  all_pass &= run_test<double>(1000, 17, 100, 8);    // odd nb

  std::cout << "\nFull nloc_project tests (float):" << std::endl;
  all_pass &= run_test<float>(1000, 32, 100, 8);
  all_pass &= run_test<float>(1000, 64, 200, 12);
  all_pass &= run_test<float>(500, 48, 50, 4);

  // Multiple projectors test
  std::cout << "\nMultiple projectors test:" << std::endl;
  {
    const uint K = 1000, nb = 32;
    const double dv = 0.01;
    std::mt19937 rng(999);
    std::uniform_real_distribution<double> dist(-1.0, 1.0);

    // Create psi
    std::vector<double> psi_unpacked(K * nb);
    for (auto& v : psi_unpacked) v = dist(rng);

    const uint num_tiles = (nb + 15) / 16;
    const uint packed_size = num_tiles * K * 16;
    std::vector<double> psi_packed(packed_size, 0.0);
    pack_16(psi_unpacked.data(), psi_packed.data(), K, nb);

    std::vector<double> result_ref(K * nb, 0.0);
    std::vector<double> result_packed(packed_size, 0.0);

    // Multiple projectors with different sizes
    struct Proj {
      uint nrow, ncol;
      std::vector<uint> idx;
      std::vector<double> chi, gamma;
    };
    std::vector<Proj> projs = {
        {50, 4, {}, {}, {}}, {100, 8, {}, {}, {}}, {30, 3, {}, {}, {}}};

    std::vector<uint> all_idx(K);
    for (uint i = 0; i < K; i++) all_idx[i] = i;

    for (auto& p : projs) {
      std::shuffle(all_idx.begin(), all_idx.end(), rng);
      p.idx.resize(p.nrow);
      for (uint i = 0; i < p.nrow; i++) p.idx[i] = all_idx[i];
      std::sort(p.idx.begin(), p.idx.end());

      p.chi.resize(p.nrow * p.ncol);
      for (auto& v : p.chi) v = dist(rng);
      p.gamma.resize(p.ncol);
      for (auto& v : p.gamma) v = dist(rng) * 0.5 + 0.5;

      // Apply reference
      nloc_project_reference(result_ref.data(), psi_unpacked.data(),
                             p.chi.data(), p.gamma.data(), p.idx.data(), K, nb,
                             p.nrow, p.ncol, dv);

      // Apply packed
      nloc_project_packed(result_packed.data(), psi_packed.data(), p.chi.data(),
                          p.gamma.data(), p.idx.data(), K, nb, p.nrow, p.ncol,
                          dv);
    }

    // Compare
    std::vector<double> result_unpacked(K * nb);
    unpack_16(result_packed.data(), result_unpacked.data(), K, nb);

    double max_err = 0, max_ref = 0;
    for (uint i = 0; i < K * nb; i++) {
      max_err = std::max(max_err, std::abs(result_ref[i] - result_unpacked[i]));
      max_ref = std::max(max_ref, std::abs(result_ref[i]));
    }
    double rel_err = max_ref > 0 ? max_err / max_ref : max_err;
    bool pass = rel_err < 1e-5;

    std::cout << "  3 projectors accumulated | max_err=" << max_err
              << ", rel_err=" << rel_err << (pass ? " PASS" : " FAIL")
              << std::endl;
    all_pass &= pass;
  }

  std::cout << "\n=== " << (all_pass ? "ALL TESTS PASSED" : "SOME TESTS FAILED")
            << " ===" << std::endl;

  return all_pass ? 0 : 1;
}
