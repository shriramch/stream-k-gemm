// nloc_packed.hpp - Optimized packed non-local potential projection
//
// Computes: result += V_nloc * psi (in-place accumulation)
//
// Input:  psi in 16-band-packed: data[(b/16 * K + g) * 16 + b%16]
// Output: result in 32-band-packed: data[(b/32 * K + g) * 32 + b%32]
//
// Algorithm (per projector):
//   1. GATHER:  filtered[nrow, nb] = psi[index[:], :] (row-major out)
//   2. GEMM:    C[ncol, nb] = chi^T * filtered * dv
//   3. ALLREDUCE: C = sum(C) over MPI ranks
//   4. SCALE:   C = diag(gamma) * C
//   5. GEMM:    temp[nrow, nb] = chi * C (col-major out)
//   6. SCATTER: result[index[:], :] += temp (32-packed)

#pragma once

#include <mpi.h>

#include <cstdint>

#include "effective_potential_nloc.h"
#include "nloc_projector.h"

#ifdef __ARM_FEATURE_SVE
#include <arm_sve.h>
#endif

namespace Hamiltonian {

// MPI datatype helpers
template <typename T>
inline MPI_Datatype get_mpi_type();
template <>
inline MPI_Datatype get_mpi_type<float>() {
  return MPI_FLOAT;
}
template <>
inline MPI_Datatype get_mpi_type<double>() {
  return MPI_DOUBLE;
}

// =============================================================================
// GATHER: 16-band-packed → row-major filtered[nrow, nb]
//
// Input:  psi_16packed[(b/16)*K*16 + g*16 + b%16]
// Output: filtered[r*nb + b] (row-major: bands contiguous per row)
// =============================================================================
template <typename T>
inline void gather_16packed_to_rowmajor(const T* __restrict__ psi_16packed,
                                        T* __restrict__ filtered,
                                        const uint* __restrict__ index,
                                        uint nrow, uint nb, uint K) {
  constexpr uint TILE16 = 16;
  const uint num_tiles16 = (nb + TILE16 - 1) / TILE16;

  for (uint r = 0; r < nrow; r++) {
    const uint g = index[r];
    T* __restrict__ dst_row = filtered + r * nb;

    for (uint tile = 0; tile < num_tiles16; tile++) {
      const uint b_start = tile * TILE16;
      const uint b_end = (b_start + TILE16 > nb) ? nb : b_start + TILE16;

      // Source: 16 contiguous values at grid g in this tile
      const T* __restrict__ src = psi_16packed + (tile * K + g) * TILE16;
      T* __restrict__ dst = dst_row + b_start;

      // Unrolled copy (no memcpy) - compiler will vectorize
      const uint count = b_end - b_start;
      for (uint i = 0; i < count; i++) {
        dst[i] = src[i];
      }
    }
  }
}

// =============================================================================
// SCATTER: col-major temp[nrow, nb] → 32-band-packed result
//
// Input:  temp[r + b*nrow] (col-major: rows contiguous per band)
// Output: result_32packed[(b/32)*K*32 + g*32 + b%32] (accumulate)
// =============================================================================
template <typename T>
inline void scatter_colmajor_to_32packed(const T* __restrict__ temp,
                                         T* __restrict__ result_32packed,
                                         const uint* __restrict__ index,
                                         uint nrow, uint nb, uint K) {
  constexpr uint TILE32 = 32;
  const uint num_tiles32 = (nb + TILE32 - 1) / TILE32;

  // Must serialize scatter to avoid races (projectors may overlap)
  for (uint r = 0; r < nrow; r++) {
    const uint g = index[r];

    for (uint tile = 0; tile < num_tiles32; tile++) {
      const uint b_start = tile * TILE32;
      const uint b_end = (b_start + TILE32 > nb) ? nb : b_start + TILE32;

      // Destination: 32 contiguous values at grid g in this tile
      T* __restrict__ dst = result_32packed + (tile * K + g) * TILE32;

      // Gather from col-major with stride nrow, accumulate to contiguous
      for (uint i = 0; i < b_end - b_start; i++) {
        const uint b = b_start + i;
        dst[i] += temp[r + b * nrow];  // col-major read, packed write
      }
    }
  }
}

// =============================================================================
// SCATTER: col-major temp[nrow, nb] → 16-band-packed result (for same-format)
// =============================================================================
template <typename T>
inline void scatter_colmajor_to_16packed(const T* __restrict__ temp,
                                         T* __restrict__ result_16packed,
                                         const uint* __restrict__ index,
                                         uint nrow, uint nb, uint K) {
  constexpr uint TILE16 = 16;
  const uint num_tiles16 = (nb + TILE16 - 1) / TILE16;

  for (uint r = 0; r < nrow; r++) {
    const uint g = index[r];

    for (uint tile = 0; tile < num_tiles16; tile++) {
      const uint b_start = tile * TILE16;
      const uint b_end = (b_start + TILE16 > nb) ? nb : b_start + TILE16;

      T* __restrict__ dst = result_16packed + (tile * K + g) * TILE16;

      for (uint i = 0; i < b_end - b_start; i++) {
        const uint b = b_start + i;
        dst[i] += temp[r + b * nrow];
      }
    }
  }
}

// =============================================================================
// Naive GEMM: C[M,N] = alpha * A^T[M,K] * B[K,N] + beta * C[M,N]
// A: col-major K×M, B: col-major K×N, C: col-major M×N
// =============================================================================
template <typename T>
inline void gemm_aTb_naive(uint M, uint N, uint K, T alpha,
                           const T* __restrict__ A, uint ldA,  // K×M col-major
                           const T* __restrict__ B, uint ldB,  // K×N col-major
                           T beta, T* __restrict__ C,
                           uint ldC)  // M×N col-major
{
  // Apply beta to C
  if (beta == T(0)) {
    for (uint n = 0; n < N; n++) {
      for (uint m = 0; m < M; m++) {
        C[m + n * ldC] = T(0);
      }
    }
  } else if (beta != T(1)) {
    for (uint n = 0; n < N; n++) {
      for (uint m = 0; m < M; m++) {
        C[m + n * ldC] *= beta;
      }
    }
  }

  // C += alpha * A^T * B
  for (uint n = 0; n < N; n++) {
    for (uint m = 0; m < M; m++) {
      T sum = T(0);
      for (uint k = 0; k < K; k++) {
        // A^T[m,k] = A[k,m]
        sum += A[k + m * ldA] * B[k + n * ldB];
      }
      C[m + n * ldC] += alpha * sum;
    }
  }
}

// =============================================================================
// Naive GEMM: C[M,N] = alpha * A[M,K] * B[K,N] + beta * C[M,N]
// =============================================================================
template <typename T>
inline void gemm_ab_naive(uint M, uint N, uint K, T alpha,
                          const T* __restrict__ A, uint ldA,    // M×K col-major
                          const T* __restrict__ B, uint ldB,    // K×N col-major
                          T beta, T* __restrict__ C, uint ldC)  // M×N col-major
{
  if (beta == T(0)) {
    for (uint n = 0; n < N; n++) {
      for (uint m = 0; m < M; m++) {
        C[m + n * ldC] = T(0);
      }
    }
  } else if (beta != T(1)) {
    for (uint n = 0; n < N; n++) {
      for (uint m = 0; m < M; m++) {
        C[m + n * ldC] *= beta;
      }
    }
  }

  for (uint n = 0; n < N; n++) {
    for (uint m = 0; m < M; m++) {
      T sum = T(0);
      for (uint k = 0; k < K; k++) {
        sum += A[m + k * ldA] * B[k + n * ldB];
      }
      C[m + n * ldC] += alpha * sum;
    }
  }
}

// =============================================================================
// Transpose row-major[M,N] → col-major[M,N]
// =============================================================================
template <typename T>
inline void transpose_rowmaj_to_colmaj(
    const T* __restrict__ src,  // row-major M×N: src[m*N + n]
    T* __restrict__ dst,        // col-major M×N: dst[m + n*M]
    uint M, uint N) {
  for (uint m = 0; m < M; m++) {
    for (uint n = 0; n < N; n++) {
      dst[m + n * M] = src[m * N + n];
    }
  }
}

// =============================================================================
// Main function: nloc_project_vectors_packed
//
// Input:  psi in 16-band-packed format
// Output: result in 32-band-packed format (accumulate)
// =============================================================================
template <typename T>
void nloc_project_vectors_packed(
    T* __restrict__ result_32packed,     // [nb/32, K, 32] - accumulate
    const T* __restrict__ psi_16packed,  // [nb/16, K, 16] - input
    const Effective_potential_nloc<T>& Vnloc, uint nb, uint K, T dv,
    const MPI_Comm& comm) {
  if (Vnloc.nloc_projectors.empty()) return;

  const uint total_ncol = Vnloc.offsets.back();
  if (total_ncol == 0) return;

  // Allocate chi_vector: [total_ncol, nb] col-major
  T* chi_vector = new (std::align_val_t(64)) T[total_ncol * nb];
  // Zero initialize (no memset - explicit loop)
  for (uint i = 0; i < total_ncol * nb; i++) {
    chi_vector[i] = T(0);
  }

  // =========================================================================
  // Phase 1: GATHER + Forward GEMM for each projector
  // =========================================================================
  for (uint ip = 0; ip < Vnloc.nloc_projectors.size(); ip++) {
    const Nloc_projector<T>& proj = Vnloc.nloc_projectors[ip];
    const uint nrow = proj.nrow;
    const uint ncol = proj.ncol;
    const uint offset = Vnloc.offsets[ip];

    if (nrow == 0 || ncol == 0) continue;

    // Allocate filtered[nrow, nb] row-major
    T* filtered_rowmaj = new (std::align_val_t(64)) T[nrow * nb];

    // GATHER: 16-packed → row-major
    gather_16packed_to_rowmajor(psi_16packed, filtered_rowmaj,
                                proj.index.data(), nrow, nb, K);

    // Convert row-major → col-major for GEMM
    T* filtered_colmaj = new (std::align_val_t(64)) T[nrow * nb];
    transpose_rowmaj_to_colmaj(filtered_rowmaj, filtered_colmaj, nrow, nb);

    // Forward GEMM: C[ncol,nb] = chi^T[ncol,nrow] * filtered[nrow,nb] * dv
    // chi is stored as [nrow, ncol] col-major
    gemm_aTb_naive(ncol, nb, nrow, dv, proj.chi.data, nrow,  // A: nrow×ncol
                   filtered_colmaj, nrow,                    // B: nrow×nb
                   T(0), chi_vector + offset * nb, ncol);    // C: ncol×nb

    delete[] filtered_rowmaj;
    delete[] filtered_colmaj;
  }

  // =========================================================================
  // Phase 2: MPI ALLREDUCE
  // =========================================================================
  int commsize;
  MPI_Comm_size(comm, &commsize);
  if (commsize > 1) {
    MPI_Allreduce(MPI_IN_PLACE, chi_vector, total_ncol * nb, get_mpi_type<T>(),
                  MPI_SUM, comm);
  }

  // =========================================================================
  // Phase 3: Scale by gamma (per atom)
  // =========================================================================
  int atom_index = Vnloc.nloc_projectors[0].atom_index - 1;
  for (uint ip = 0; ip < Vnloc.nloc_projectors.size(); ip++) {
    const Nloc_projector<T>& proj = Vnloc.nloc_projectors[ip];
    const uint ncol = proj.ncol;
    const uint offset = Vnloc.offsets[ip];

    if (atom_index != proj.atom_index) {
      atom_index = proj.atom_index;

      // C[ncol, nb] col-major: scale row j by gamma[j]
      T* C = chi_vector + offset * nb;
      for (uint j = 0; j < ncol; j++) {
        const T g = proj.gamma.data[j];
        for (uint b = 0; b < nb; b++) {
          C[j + b * ncol] *= g;
        }
      }
    }
  }

  // =========================================================================
  // Phase 4: Backward GEMM + SCATTER for each projector
  // =========================================================================
  for (uint ip = 0; ip < Vnloc.nloc_projectors.size(); ip++) {
    const Nloc_projector<T>& proj = Vnloc.nloc_projectors[ip];
    const uint nrow = proj.nrow;
    const uint ncol = proj.ncol;
    const uint offset = Vnloc.offsets[ip];

    if (nrow == 0 || ncol == 0) continue;

    // Backward GEMM: temp[nrow,nb] = chi[nrow,ncol] * C[ncol,nb]
    // Output in col-major for scatter
    T* temp_colmaj = new (std::align_val_t(64)) T[nrow * nb];

    gemm_ab_naive(nrow, nb, ncol, T(1), proj.chi.data, nrow,  // A: nrow×ncol
                  chi_vector + offset * nb, ncol,             // B: ncol×nb
                  T(0), temp_colmaj, nrow);                   // C: nrow×nb

    // SCATTER: col-major → 32-packed (accumulate)
    scatter_colmajor_to_32packed(temp_colmaj, result_32packed,
                                 proj.index.data(), nrow, nb, K);

    delete[] temp_colmaj;
  }

  delete[] chi_vector;
}

// =============================================================================
// Variant: 16-packed → 16-packed (same format, for chebyshev_filtering)
// =============================================================================
template <typename T>
void nloc_project_vectors_packed_16to16(
    T* __restrict__ result_16packed,     // [nb/16, K, 16] - accumulate
    const T* __restrict__ psi_16packed,  // [nb/16, K, 16] - input
    const Effective_potential_nloc<T>& Vnloc, uint nb, uint K, T dv,
    const MPI_Comm& comm) {
  if (Vnloc.nloc_projectors.empty()) return;

  const uint total_ncol = Vnloc.offsets.back();
  if (total_ncol == 0) return;

  T* chi_vector = new (std::align_val_t(64)) T[total_ncol * nb];
  for (uint i = 0; i < total_ncol * nb; i++) chi_vector[i] = T(0);

  // Phase 1: GATHER + Forward GEMM
  for (uint ip = 0; ip < Vnloc.nloc_projectors.size(); ip++) {
    const Nloc_projector<T>& proj = Vnloc.nloc_projectors[ip];
    const uint nrow = proj.nrow;
    const uint ncol = proj.ncol;
    const uint offset = Vnloc.offsets[ip];

    if (nrow == 0 || ncol == 0) continue;

    T* filtered_rowmaj = new (std::align_val_t(64)) T[nrow * nb];
    gather_16packed_to_rowmajor(psi_16packed, filtered_rowmaj,
                                proj.index.data(), nrow, nb, K);

    T* filtered_colmaj = new (std::align_val_t(64)) T[nrow * nb];
    transpose_rowmaj_to_colmaj(filtered_rowmaj, filtered_colmaj, nrow, nb);

    gemm_aTb_naive(ncol, nb, nrow, dv, proj.chi.data, nrow, filtered_colmaj,
                   nrow, T(0), chi_vector + offset * nb, ncol);

    delete[] filtered_rowmaj;
    delete[] filtered_colmaj;
  }

  // Phase 2: MPI ALLREDUCE
  int commsize;
  MPI_Comm_size(comm, &commsize);
  if (commsize > 1) {
    MPI_Allreduce(MPI_IN_PLACE, chi_vector, total_ncol * nb, get_mpi_type<T>(),
                  MPI_SUM, comm);
  }

  // Phase 3: Scale by gamma
  int atom_index = Vnloc.nloc_projectors[0].atom_index - 1;
  for (uint ip = 0; ip < Vnloc.nloc_projectors.size(); ip++) {
    const Nloc_projector<T>& proj = Vnloc.nloc_projectors[ip];
    const uint ncol = proj.ncol;
    const uint offset = Vnloc.offsets[ip];

    if (atom_index != proj.atom_index) {
      atom_index = proj.atom_index;
      T* C = chi_vector + offset * nb;
      for (uint j = 0; j < ncol; j++) {
        const T g = proj.gamma.data[j];
        for (uint b = 0; b < nb; b++) {
          C[j + b * ncol] *= g;
        }
      }
    }
  }

  // Phase 4: Backward GEMM + SCATTER to 16-packed
  for (uint ip = 0; ip < Vnloc.nloc_projectors.size(); ip++) {
    const Nloc_projector<T>& proj = Vnloc.nloc_projectors[ip];
    const uint nrow = proj.nrow;
    const uint ncol = proj.ncol;
    const uint offset = Vnloc.offsets[ip];

    if (nrow == 0 || ncol == 0) continue;

    T* temp_colmaj = new (std::align_val_t(64)) T[nrow * nb];

    gemm_ab_naive(nrow, nb, ncol, T(1), proj.chi.data, nrow,
                  chi_vector + offset * nb, ncol, T(0), temp_colmaj, nrow);

    // SCATTER to 16-packed (same format as input)
    scatter_colmajor_to_16packed(temp_colmaj, result_16packed,
                                 proj.index.data(), nrow, nb, K);

    delete[] temp_colmaj;
  }

  delete[] chi_vector;
}

}  // namespace Hamiltonian
