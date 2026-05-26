// nloc_packed.hpp - Packed non-local potential projection for SME
// 
// Computes: result += V_nloc * psi (in-place accumulation)
//
// Layout: Array_4D_Packed_16 = data[(tile * K + g) * 16 + b_local]
// where tile = b/16, b_local = b%16, g = linear grid index
//
// For each projector p:
//   1. GATHER:  filtered_psi[nrow, nb] = psi[index[:], :]
//   2. GEMM:    C[ncol, nb] = chi^T[ncol, nrow] * filtered_psi[nrow, nb] * dv
//   3. ALLREDUCE: C = sum(C) over MPI ranks
//   4. SCALE:   C = diag(gamma) * C
//   5. GEMM:    temp[nrow, nb] = chi[nrow, ncol] * C[ncol, nb]
//   6. SCATTER: result[index[:], :] += temp

#pragma once

#include <cstdint>
#include <cstring>
#include <mpi.h>
#include "effective_potential_nloc.h"
#include "nloc_projector.h"

#ifdef __ARM_FEATURE_SVE
#include <arm_sve.h>
#endif

namespace Hamiltonian {

// Get MPI datatype for T
template<typename T>
inline MPI_Datatype get_mpi_type();

template<>
inline MPI_Datatype get_mpi_type<float>() { return MPI_FLOAT; }

template<>
inline MPI_Datatype get_mpi_type<double>() { return MPI_DOUBLE; }

// =============================================================================
// GATHER: Extract rows from packed psi at sparse indices
// 
// Input:  psi_packed[num_tiles, K, 16] - packed layout
// Output: filtered[nrow, nb] - column-major (bands contiguous per row)
// Indices: index[nrow] - which grid points to extract
// =============================================================================
template<typename T>
void gather_rows_packed(
    const T* __restrict__ psi_packed,  // [num_tiles, K, 16]
    T* __restrict__ filtered,          // [nrow, nb] output (col-major)
    const uint* __restrict__ index,    // [nrow] grid indices
    uint nrow, uint nb, uint K, uint num_tiles)
{
    const uint TILE = 16;
    
    #pragma omp parallel for schedule(static)
    for (uint r = 0; r < nrow; r++) {
        const uint g = index[r];  // Grid point index
        
        // For each band tile, copy 16 values
        for (uint tile = 0; tile < num_tiles; tile++) {
            const uint b_start = tile * TILE;
            const uint b_end = (b_start + TILE > nb) ? nb : b_start + TILE;
            const uint count = b_end - b_start;
            
            // Source: (tile * K + g) * 16, consecutive 16 values
            const T* src = psi_packed + (tile * K + g) * TILE;
            // Dest: row r, bands b_start to b_end (col-major: b is slow index)
            T* dst = filtered + r + b_start * nrow;
            
            // Copy with stride (col-major output)
            for (uint i = 0; i < count; i++) {
                dst[i * nrow] = src[i];
            }
        }
    }
}

// Optimized gather with contiguous output (row-major, nrow × nb)
template<typename T>
void gather_rows_packed_rowmajor(
    const T* __restrict__ psi_packed,  // [num_tiles, K, 16]
    T* __restrict__ filtered,          // [nrow, nb] output (row-major!)
    const uint* __restrict__ index,    // [nrow] grid indices
    uint nrow, uint nb, uint K, uint num_tiles)
{
    const uint TILE = 16;
    
    #pragma omp parallel for schedule(static)
    for (uint r = 0; r < nrow; r++) {
        const uint g = index[r];  // Grid point index
        T* dst = filtered + r * nb;  // Row r in output (row-major)
        
        // For each band tile, copy up to 16 values
        for (uint tile = 0; tile < num_tiles; tile++) {
            const uint b_start = tile * TILE;
            const uint b_end = (b_start + TILE > nb) ? nb : b_start + TILE;
            const uint count = b_end - b_start;
            
            // Source: 16 consecutive values at this grid point in this tile
            const T* src = psi_packed + (tile * K + g) * TILE;
            
            // Destination: contiguous in row-major output
            std::memcpy(dst + b_start, src, count * sizeof(T));
        }
    }
}

// =============================================================================
// SCATTER: Add rows back to packed result at sparse indices
// 
// Input:  temp[nrow, nb] - column-major
// Output: result_packed[num_tiles, K, 16] - accumulate (+=)
// Indices: index[nrow] - which grid points to write
// =============================================================================
template<typename T>
void scatter_rows_packed(
    const T* __restrict__ temp,        // [nrow, nb] input (col-major)
    T* __restrict__ result_packed,     // [num_tiles, K, 16] output
    const uint* __restrict__ index,    // [nrow] grid indices
    uint nrow, uint nb, uint K, uint num_tiles)
{
    const uint TILE = 16;
    
    // NOTE: Scatter requires atomic adds if parallelized over rows,
    // because multiple projectors might touch overlapping grid points.
    // For now, serialize scatter (small nrow, fast anyway).
    for (uint r = 0; r < nrow; r++) {
        const uint g = index[r];  // Grid point index
        
        for (uint tile = 0; tile < num_tiles; tile++) {
            const uint b_start = tile * TILE;
            const uint b_end = (b_start + TILE > nb) ? nb : b_start + TILE;
            const uint count = b_end - b_start;
            
            // Source: row r, bands b_start to b_end (col-major: b is slow)
            const T* src = temp + r + b_start * nrow;
            // Dest: (tile * K + g) * 16, consecutive 16 values
            T* dst = result_packed + (tile * K + g) * TILE;
            
            // Accumulate with stride
            for (uint i = 0; i < count; i++) {
                dst[i] += src[i * nrow];
            }
        }
    }
}

// Optimized scatter with row-major input
template<typename T>
void scatter_rows_packed_rowmajor(
    const T* __restrict__ temp,        // [nrow, nb] input (row-major!)
    T* __restrict__ result_packed,     // [num_tiles, K, 16] output
    const uint* __restrict__ index,    // [nrow] grid indices
    uint nrow, uint nb, uint K, uint num_tiles)
{
    const uint TILE = 16;
    
    for (uint r = 0; r < nrow; r++) {
        const uint g = index[r];
        const T* src = temp + r * nb;  // Row r (row-major)
        
        for (uint tile = 0; tile < num_tiles; tile++) {
            const uint b_start = tile * TILE;
            const uint b_end = (b_start + TILE > nb) ? nb : b_start + TILE;
            const uint count = b_end - b_start;
            
            T* dst = result_packed + (tile * K + g) * TILE;
            
            // Simple vectorizable loop
            #pragma omp simd
            for (uint i = 0; i < count; i++) {
                dst[i] += src[b_start + i];
            }
        }
    }
}

// =============================================================================
// Simple GEMM wrappers (use BLAS when available)
// =============================================================================

// C[M,N] = alpha * A^T[M,K] * B[K,N] + beta * C[M,N]
// A is K×M (transposed to M×K), B is K×N, C is M×N, all col-major
template<typename T>
void gemm_atb(
    const T* A, const T* B, T* C,
    uint M, uint N, uint K,
    T alpha, T beta)
{
    // Simple implementation - replace with cblas_dgemm/sgemm for performance
    if (beta == T(0)) {
        std::memset(C, 0, M * N * sizeof(T));
    } else if (beta != T(1)) {
        for (uint i = 0; i < M * N; i++) C[i] *= beta;
    }
    
    for (uint n = 0; n < N; n++) {
        for (uint m = 0; m < M; m++) {
            T sum = T(0);
            // A^T[m,k] = A[k,m] where A is K×M col-major
            for (uint k = 0; k < K; k++) {
                sum += A[k + m * K] * B[k + n * K];
            }
            C[m + n * M] += alpha * sum;
        }
    }
}

// C[M,N] = alpha * A[M,K] * B[K,N] + beta * C[M,N]
template<typename T>
void gemm_ab(
    const T* A, const T* B, T* C,
    uint M, uint N, uint K,
    T alpha, T beta)
{
    if (beta == T(0)) {
        std::memset(C, 0, M * N * sizeof(T));
    } else if (beta != T(1)) {
        for (uint i = 0; i < M * N; i++) C[i] *= beta;
    }
    
    for (uint n = 0; n < N; n++) {
        for (uint m = 0; m < M; m++) {
            T sum = T(0);
            for (uint k = 0; k < K; k++) {
                sum += A[m + k * M] * B[k + n * K];
            }
            C[m + n * M] += alpha * sum;
        }
    }
}

// =============================================================================
// Main function: nloc_project_vectors_packed
//
// Computes: result += V_nloc * psi  (in-place on packed arrays)
// =============================================================================
template<typename T>
void nloc_project_vectors_packed(
    T* __restrict__ result_packed,                    // [num_tiles, K, 16] - accumulate
    const T* __restrict__ psi_packed,                 // [num_tiles, K, 16] - input
    const Effective_potential_nloc<T>& Vnloc,
    uint nb, uint K, uint num_tiles,
    T dv,                                             // Volume element
    const MPI_Comm& comm)
{
    if (Vnloc.nloc_projectors.empty()) return;
    
    // Total chi_vector size (sum of ncol for all projectors × nb)
    const uint total_ncol = Vnloc.offsets.back();
    if (total_ncol == 0) return;
    
    // Allocate chi_vector: [total_ncol, nb] for all projectors
    T* chi_vector = new (std::align_val_t(64)) T[total_ncol * nb]();
    
    // =========================================================================
    // Step 1+2: GATHER + Forward GEMM for each projector
    // chi_vector[offset:offset+ncol, :] = chi^T * filtered_psi * dv
    // =========================================================================
    for (uint ip = 0; ip < Vnloc.nloc_projectors.size(); ip++) {
        const Nloc_projector<T>& proj = Vnloc.nloc_projectors[ip];
        const uint nrow = proj.nrow;
        const uint ncol = proj.ncol;
        const uint offset = Vnloc.offsets[ip];
        
        if (nrow == 0 || ncol == 0) continue;
        
        // Gather rows from packed psi
        T* filtered = new (std::align_val_t(64)) T[nrow * nb];
        gather_rows_packed_rowmajor(psi_packed, filtered, proj.index.data(),
                                    nrow, nb, K, num_tiles);
        
        // Forward GEMM: C = chi^T * filtered (with dv scaling)
        // chi: [nrow, ncol], filtered: [nrow, nb] row-major
        // Output: chi_vector + offset*nb in [ncol, nb] col-major
        // 
        // chi^T[ncol,nrow] * filtered^T[nrow,nb] requires layout conversion
        // Simpler: transpose filtered to col-major, then GEMM
        
        T* filtered_colmaj = new (std::align_val_t(64)) T[nrow * nb];
        for (uint r = 0; r < nrow; r++) {
            for (uint b = 0; b < nb; b++) {
                filtered_colmaj[r + b * nrow] = filtered[r * nb + b];
            }
        }
        
        // C[ncol, nb] = chi^T[ncol, nrow] * filtered[nrow, nb]
        // chi is stored as [nrow, ncol] col-major
        gemm_atb(proj.chi.data, filtered_colmaj,
                 chi_vector + offset * nb,
                 ncol, nb, nrow, dv, T(0));
        
        delete[] filtered;
        delete[] filtered_colmaj;
    }
    
    // =========================================================================
    // Step 3: MPI ALLREDUCE
    // =========================================================================
    int commsize;
    MPI_Comm_size(comm, &commsize);
    if (commsize > 1) {
        MPI_Allreduce(MPI_IN_PLACE, chi_vector, total_ncol * nb,
                      get_mpi_type<T>(), MPI_SUM, comm);
    }
    
    // =========================================================================
    // Step 4: Scale by gamma (per atom)
    // =========================================================================
    int atom_index = Vnloc.nloc_projectors[0].atom_index - 1;
    for (uint ip = 0; ip < Vnloc.nloc_projectors.size(); ip++) {
        const Nloc_projector<T>& proj = Vnloc.nloc_projectors[ip];
        const uint ncol = proj.ncol;
        const uint offset = Vnloc.offsets[ip];
        
        if (atom_index != proj.atom_index) {
            atom_index = proj.atom_index;
            
            // Scale each row j of chi_vector by gamma[j]
            T* C = chi_vector + offset * nb;
            for (uint j = 0; j < ncol; j++) {
                T g = proj.gamma.data[j];
                for (uint b = 0; b < nb; b++) {
                    C[j + b * ncol] *= g;  // C is [ncol, nb] col-major
                }
            }
        }
    }
    
    // =========================================================================
    // Step 5+6: Backward GEMM + SCATTER for each projector
    // temp = chi * chi_vector, then result[index[:], :] += temp
    // =========================================================================
    for (uint ip = 0; ip < Vnloc.nloc_projectors.size(); ip++) {
        const Nloc_projector<T>& proj = Vnloc.nloc_projectors[ip];
        const uint nrow = proj.nrow;
        const uint ncol = proj.ncol;
        const uint offset = Vnloc.offsets[ip];
        
        if (nrow == 0 || ncol == 0) continue;
        
        // Backward GEMM: temp[nrow, nb] = chi[nrow, ncol] * C[ncol, nb]
        T* temp_colmaj = new (std::align_val_t(64)) T[nrow * nb];
        gemm_ab(proj.chi.data, chi_vector + offset * nb,
                temp_colmaj, nrow, nb, ncol, T(1), T(0));
        
        // Convert to row-major for scatter
        T* temp_rowmaj = new (std::align_val_t(64)) T[nrow * nb];
        for (uint r = 0; r < nrow; r++) {
            for (uint b = 0; b < nb; b++) {
                temp_rowmaj[r * nb + b] = temp_colmaj[r + b * nrow];
            }
        }
        
        // Scatter: result[index[:], :] += temp
        scatter_rows_packed_rowmajor(temp_rowmaj, result_packed,
                                     proj.index.data(),
                                     nrow, nb, K, num_tiles);
        
        delete[] temp_colmaj;
        delete[] temp_rowmaj;
    }
    
    delete[] chi_vector;
}

// Explicit template instantiations
template void nloc_project_vectors_packed<float>(
    float* result_packed, const float* psi_packed,
    const Effective_potential_nloc<float>& Vnloc,
    uint nb, uint K, uint num_tiles, float dv, const MPI_Comm& comm);

template void nloc_project_vectors_packed<double>(
    double* result_packed, const double* psi_packed,
    const Effective_potential_nloc<double>& Vnloc,
    uint nb, uint K, uint num_tiles, double dv, const MPI_Comm& comm);

}  // namespace Hamiltonian
