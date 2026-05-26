// nloc_packed_opt2_test.cpp - Test optimized packed nloc projection
//
// Compile: sme++ -O2 -std=c++17 -fopenmp -I../include nloc_packed_opt2_test.cpp
// -o nloc_packed_opt2_test Run: armie64 ./nloc_packed_opt2_test

#include <algorithm>
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>
#include <vector>

// Define this BEFORE including the header to prevent MPI/actual header includes
#define NLOC_PACKED_TEST_MOCK_MPI

// Mock MPI
#define MPI_COMM_WORLD 0
#define MPI_Comm int
#define MPI_Datatype int
#define MPI_SUM 0
#define MPI_FLOAT 1
#define MPI_DOUBLE 2
inline int MPI_Comm_size(MPI_Comm, int* size) {
  *size = 1;
  return 0;
}
inline int MPI_Allreduce(void*, void*, int, MPI_Datatype, int, MPI_Comm) {
  return 0;
}
#define MPI_IN_PLACE nullptr

using uint = unsigned int;

// Mock nloc_projector.h structures (no automatic memory management to avoid
// double-free)
template <typename T>
struct Array_1D {
  T* data = nullptr;
  uint size = 0;
  void reconstructor(uint n) {
    data = new T[n]();
    size = n;
  }
  T& operator[](uint i) { return data[i]; }
  const T& operator[](uint i) const { return data[i]; }
};

template <typename T>
struct Array_2D {
  T* data = nullptr;
  uint nrow = 0, ncol = 0;
  void reconstructor(uint r, uint c) {
    nrow = r;
    ncol = c;
    data = new T[r * c]();
  }
};

template <typename T>
struct Nloc_projector {
  uint ncol = 0;
  uint nrow = 0;
  int atom_index = 0;
  Array_2D<T> chi;
  Array_1D<T> gamma;
  std::vector<uint> index;

  const uint* get_index() const { return index.data(); }
};

template <typename T>
struct Effective_potential_nloc {
  std::vector<Nloc_projector<T>> nloc_projectors;
  std::vector<uint> offsets;
};

// Include the header under test
#include "nloc_packed_opt2.hpp"

// =============================================================================
// Reference implementation (unpacked)
// =============================================================================
template <typename T>
void nloc_project_unpacked_reference(
    T* __restrict__ result,     // [K, nb] col-major
    const T* __restrict__ psi,  // [K, nb] col-major
    const Effective_potential_nloc<T>& Vnloc, uint nb, uint K, T dv,
    const MPI_Comm& comm) {
  if (Vnloc.nloc_projectors.empty()) return;

  const uint total_ncol = Vnloc.offsets.back();
  if (total_ncol == 0) return;

  T* chi_vector = new T[total_ncol * nb]();

  // Forward GEMM: chi_vector = chi^T * psi[index] * dv
  for (uint ip = 0; ip < Vnloc.nloc_projectors.size(); ip++) {
    const auto& proj = Vnloc.nloc_projectors[ip];
    const uint nrow = proj.nrow;
    const uint ncol = proj.ncol;
    const uint offset = Vnloc.offsets[ip];

    if (nrow == 0 || ncol == 0) continue;

    // Gather filtered[nrow, nb]
    T* filtered = new T[nrow * nb];
    for (uint b = 0; b < nb; b++) {
      for (uint r = 0; r < nrow; r++) {
        filtered[r + b * nrow] = psi[proj.index[r] + b * K];
      }
    }

    // GEMM: C[ncol,nb] = chi^T[ncol,nrow] * filtered[nrow,nb] * dv
    for (uint b = 0; b < nb; b++) {
      for (uint c = 0; c < ncol; c++) {
        T sum = T(0);
        for (uint r = 0; r < nrow; r++) {
          sum += proj.chi.data[r + c * nrow] * filtered[r + b * nrow];
        }
        chi_vector[(offset + c) + b * total_ncol] += dv * sum;
      }
    }
    delete[] filtered;
  }

  // MPI_Allreduce skipped (single rank)

  // Scale by gamma
  int atom_index = Vnloc.nloc_projectors[0].atom_index - 1;
  for (uint ip = 0; ip < Vnloc.nloc_projectors.size(); ip++) {
    const auto& proj = Vnloc.nloc_projectors[ip];
    const uint ncol = proj.ncol;
    const uint offset = Vnloc.offsets[ip];

    if (atom_index != proj.atom_index) {
      atom_index = proj.atom_index;
      for (uint b = 0; b < nb; b++) {
        for (uint c = 0; c < ncol; c++) {
          chi_vector[(offset + c) + b * total_ncol] *= proj.gamma.data[c];
        }
      }
    }
  }

  // Backward GEMM + scatter
  for (uint ip = 0; ip < Vnloc.nloc_projectors.size(); ip++) {
    const auto& proj = Vnloc.nloc_projectors[ip];
    const uint nrow = proj.nrow;
    const uint ncol = proj.ncol;
    const uint offset = Vnloc.offsets[ip];

    if (nrow == 0 || ncol == 0) continue;

    // GEMM: temp[nrow,nb] = chi[nrow,ncol] * C[ncol,nb]
    T* temp = new T[nrow * nb]();
    for (uint b = 0; b < nb; b++) {
      for (uint r = 0; r < nrow; r++) {
        T sum = T(0);
        for (uint c = 0; c < ncol; c++) {
          sum += proj.chi.data[r + c * nrow] *
                 chi_vector[(offset + c) + b * total_ncol];
        }
        temp[r + b * nrow] = sum;
      }
    }

    // Scatter
    for (uint b = 0; b < nb; b++) {
      for (uint r = 0; r < nrow; r++) {
        result[proj.index[r] + b * K] += temp[r + b * nrow];
      }
    }
    delete[] temp;
  }

  delete[] chi_vector;
}

// =============================================================================
// Packing/unpacking helpers
// =============================================================================
template <typename T>
void pack_colmajor_to_16band(const T* src, T* dst, uint K, uint nb) {
  constexpr uint TILE = 16;
  const uint num_tiles = (nb + TILE - 1) / TILE;

  for (uint b = 0; b < nb; b++) {
    const uint tile = b / TILE;
    const uint b_local = b % TILE;
    for (uint g = 0; g < K; g++) {
      dst[(tile * K + g) * TILE + b_local] = src[g + b * K];
    }
  }
}

template <typename T>
void unpack_16band_to_colmajor(const T* src, T* dst, uint K, uint nb) {
  constexpr uint TILE = 16;
  const uint num_tiles = (nb + TILE - 1) / TILE;

  for (uint b = 0; b < nb; b++) {
    const uint tile = b / TILE;
    const uint b_local = b % TILE;
    for (uint g = 0; g < K; g++) {
      dst[g + b * K] = src[(tile * K + g) * TILE + b_local];
    }
  }
}

template <typename T>
void pack_colmajor_to_32band(const T* src, T* dst, uint K, uint nb) {
  constexpr uint TILE = 32;
  const uint num_tiles = (nb + TILE - 1) / TILE;

  for (uint b = 0; b < nb; b++) {
    const uint tile = b / TILE;
    const uint b_local = b % TILE;
    for (uint g = 0; g < K; g++) {
      dst[(tile * K + g) * TILE + b_local] = src[g + b * K];
    }
  }
}

template <typename T>
void unpack_32band_to_colmajor(const T* src, T* dst, uint K, uint nb) {
  constexpr uint TILE = 32;
  const uint num_tiles = (nb + TILE - 1) / TILE;

  for (uint b = 0; b < nb; b++) {
    const uint tile = b / TILE;
    const uint b_local = b % TILE;
    for (uint g = 0; g < K; g++) {
      dst[g + b * K] = src[(tile * K + g) * TILE + b_local];
    }
  }
}

// =============================================================================
// Test utilities
// =============================================================================
void create_random_projector(Nloc_projector<double>& proj, uint K, uint nrow,
                             uint ncol, int atom_idx, std::mt19937& rng) {
  proj.nrow = nrow;
  proj.ncol = ncol;
  proj.atom_index = atom_idx;
  proj.chi.reconstructor(nrow, ncol);
  proj.gamma.reconstructor(ncol);
  proj.index.resize(nrow);

  std::uniform_real_distribution<double> dist(-1.0, 1.0);
  std::uniform_int_distribution<uint> idx_dist(0, K - 1);

  for (uint i = 0; i < nrow * ncol; i++) {
    proj.chi.data[i] = dist(rng);
  }
  for (uint i = 0; i < ncol; i++) {
    proj.gamma.data[i] = dist(rng) * 0.5;
  }

  // Generate unique indices
  std::vector<uint> all_indices(K);
  for (uint i = 0; i < K; i++) all_indices[i] = i;
  std::shuffle(all_indices.begin(), all_indices.end(), rng);
  for (uint i = 0; i < nrow; i++) {
    proj.index[i] = all_indices[i];
  }
}

template <typename T>
double max_abs_error(const T* a, const T* b, uint n) {
  double max_err = 0.0;
  for (uint i = 0; i < n; i++) {
    max_err = std::max(max_err, std::abs((double)(a[i] - b[i])));
  }
  return max_err;
}

// =============================================================================
// Main test
// =============================================================================
int main() {
  std::mt19937 rng(42);
  std::uniform_real_distribution<double> dist(-1.0, 1.0);

  int num_tests = 0;
  int num_passed = 0;

  printf("=== nloc_packed_opt2 Tests ===\n\n");

  // Test configurations: (K, nb, nrow, ncol)
  struct TestConfig {
    uint K, nb, nrow, ncol;
    int num_proj;
  } configs[] = {
      {100, 16, 20, 5, 1},    {200, 32, 50, 8, 2},     {500, 48, 100, 12, 3},
      {1000, 64, 200, 16, 2}, {2000, 128, 300, 20, 4},
  };

  for (const auto& cfg : configs) {
    num_tests++;

    const uint K = cfg.K;
    const uint nb = cfg.nb;

    // Prepare Vnloc
    Effective_potential_nloc<double> Vnloc;
    uint total_ncol = 0;
    Vnloc.offsets.push_back(0);

    for (int p = 0; p < cfg.num_proj; p++) {
      Nloc_projector<double> proj;
      create_random_projector(proj, K, cfg.nrow, cfg.ncol, p + 1, rng);
      Vnloc.nloc_projectors.push_back(std::move(proj));
      total_ncol += cfg.ncol;
      Vnloc.offsets.push_back(total_ncol);
    }

    // Allocate data
    const uint tiles16 = (nb + 15) / 16;
    const uint tiles32 = (nb + 31) / 32;
    const uint packed16_size = tiles16 * K * 16;
    const uint packed32_size = tiles32 * K * 32;

    double* psi_colmaj = new double[K * nb];
    double* psi_16packed = new double[packed16_size]();
    double* result_ref = new double[K * nb]();
    double* result_unpacked = new double[K * nb]();
    double* result_32packed = new double[packed32_size]();

    // Initialize random psi
    for (uint i = 0; i < K * nb; i++) {
      psi_colmaj[i] = dist(rng);
    }

    // Pack psi
    pack_colmajor_to_16band(psi_colmaj, psi_16packed, K, nb);

    const double dv = 0.01;

    // Run reference
    nloc_project_unpacked_reference<double>(result_ref, psi_colmaj, Vnloc, nb,
                                            K, dv, MPI_COMM_WORLD);

    // Run packed (16→32)
    Hamiltonian::nloc_project_vectors_packed<double>(
        result_32packed, psi_16packed, Vnloc, nb, K, dv, MPI_COMM_WORLD);

    // Unpack result
    unpack_32band_to_colmajor(result_32packed, result_unpacked, K, nb);

    // Compare
    double err = max_abs_error(result_ref, result_unpacked, K * nb);

    bool passed = (err < 1e-10);
    if (passed) num_passed++;

    printf("16→32 test K=%u nb=%u nrow=%u ncol=%u nproj=%d: %s (err=%.2e)\n", K,
           nb, cfg.nrow, cfg.ncol, cfg.num_proj, passed ? "PASS" : "FAIL", err);

    // Clean up
    delete[] psi_colmaj;
    delete[] psi_16packed;
    delete[] result_ref;
    delete[] result_unpacked;
    delete[] result_32packed;
  }

  printf("\n--- 16→16 Tests ---\n");

  // Test 16→16 variant
  for (const auto& cfg : configs) {
    num_tests++;

    const uint K = cfg.K;
    const uint nb = cfg.nb;

    Effective_potential_nloc<double> Vnloc;
    uint total_ncol = 0;
    Vnloc.offsets.push_back(0);

    for (int p = 0; p < cfg.num_proj; p++) {
      Nloc_projector<double> proj;
      create_random_projector(proj, K, cfg.nrow, cfg.ncol, p + 1, rng);
      Vnloc.nloc_projectors.push_back(std::move(proj));
      total_ncol += cfg.ncol;
      Vnloc.offsets.push_back(total_ncol);
    }

    const uint tiles16 = (nb + 15) / 16;
    const uint packed16_size = tiles16 * K * 16;

    double* psi_colmaj = new double[K * nb];
    double* psi_16packed = new double[packed16_size]();
    double* result_ref = new double[K * nb]();
    double* result_unpacked = new double[K * nb]();
    double* result_16packed = new double[packed16_size]();

    for (uint i = 0; i < K * nb; i++) {
      psi_colmaj[i] = dist(rng);
    }

    pack_colmajor_to_16band(psi_colmaj, psi_16packed, K, nb);

    const double dv = 0.01;

    nloc_project_unpacked_reference<double>(result_ref, psi_colmaj, Vnloc, nb,
                                            K, dv, MPI_COMM_WORLD);

    Hamiltonian::nloc_project_vectors_packed_16to16<double>(
        result_16packed, psi_16packed, Vnloc, nb, K, dv, MPI_COMM_WORLD);

    unpack_16band_to_colmajor(result_16packed, result_unpacked, K, nb);

    double err = max_abs_error(result_ref, result_unpacked, K * nb);

    bool passed = (err < 1e-10);
    if (passed) num_passed++;

    printf("16→16 test K=%u nb=%u nrow=%u ncol=%u nproj=%d: %s (err=%.2e)\n", K,
           nb, cfg.nrow, cfg.ncol, cfg.num_proj, passed ? "PASS" : "FAIL", err);

    delete[] psi_colmaj;
    delete[] psi_16packed;
    delete[] result_ref;
    delete[] result_unpacked;
    delete[] result_16packed;
  }

  printf("\n======================\n");
  printf("TOTAL: %d/%d tests passed\n", num_passed, num_tests);

  return (num_passed == num_tests) ? 0 : 1;
}
