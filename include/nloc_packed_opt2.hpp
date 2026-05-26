// nloc_packed_opt2.hpp - Optimized packed non-local potential projection
// 
// Computes: result += V_nloc * psi (in-place accumulation)
//
// Input:  psi in 16-band-packed: data[(b/16 * K + g) * 16 + b%16]
// Output variants:
//   - 32-band-packed: data[(b/32 * K + g) * 32 + b%32] (for H*Psi)
//   - 16-band-packed: same as input (for chebyshev filter loop)
//
// Memory usage matches original workflow:
//   - chi_vector[total_ncol * nb]
//   - filtered[max_nrow * nb] (per projector, temporary)
//   - temp[max_nrow * nb] (per projector, temporary)
//
// Algorithm (per projector):
//   1. GATHER:  filtered[nrow, nb] = psi[index[:], :] (col-major)
//   2. GEMM:    C[ncol, nb] = chi^T * filtered * dv
//   3. ALLREDUCE: C = sum(C) over MPI ranks
//   4. SCALE:   C = diag(gamma) * C
//   5. GEMM:    temp[nrow, nb] = chi * C (col-major)
//   6. SCATTER: result[index[:], :] += temp

#pragma once

#include <cstdint>

#ifndef NLOC_PACKED_TEST_MOCK_MPI
#include <mpi.h>
#include "effective_potential_nloc.h"
#include "nloc_projector.h"
#endif

#ifdef _OPENMP
#include <omp.h>
#endif

#ifdef __ARM_FEATURE_SVE
#include <arm_sve.h>
#endif

namespace Hamiltonian {

// MPI datatype helpers
template<typename T> inline MPI_Datatype get_mpi_type_packed();
template<> inline MPI_Datatype get_mpi_type_packed<float>() { return MPI_FLOAT; }
template<> inline MPI_Datatype get_mpi_type_packed<double>() { return MPI_DOUBLE; }

// =============================================================================
// GATHER: 16-band-packed → col-major filtered[nrow, nb]
//
// Input:  psi_16packed[(b/16)*K*16 + g*16 + b%16]
// Output: filtered[r + b*nrow] (col-major: rows contiguous per band)
// =============================================================================
template<typename T>
inline void gather_16packed_to_colmajor(
    const T* __restrict__ psi_16packed,
    T* __restrict__ filtered,
    const uint* __restrict__ index,
    uint nrow, uint nb, uint K)
{
    constexpr uint TILE16 = 16;
    [[maybe_unused]] const uint num_tiles16 = (nb + TILE16 - 1) / TILE16;
    
#ifdef USE_OPENMP
    #pragma omp for schedule(static)
#endif
    for (uint b = 0; b < nb; b++) {
        const uint tile = b / TILE16;
        const uint b_local = b % TILE16;
        T* __restrict__ dst_col = filtered + b * nrow;
        
        // For this band, gather from all rows
        for (uint r = 0; r < nrow; r++) {
            const uint g = index[r];
            // Source: (tile * K + g) * 16 + b_local
            dst_col[r] = psi_16packed[(tile * K + g) * TILE16 + b_local];
        }
    }
}

// =============================================================================
// SCATTER: col-major temp[nrow, nb] → 32-band-packed result (accumulate)
//
// Input:  temp[r + b*nrow] (col-major)
// Output: result_32packed[(b/32)*K*32 + g*32 + b%32]
// =============================================================================
template<typename T>
inline void scatter_colmajor_to_32packed(
    const T* __restrict__ temp,
    T* __restrict__ result_32packed,
    const uint* __restrict__ index,
    uint nrow, uint nb, uint K)
{
    constexpr uint TILE32 = 32;
    
    // Scatter by band to avoid race conditions (each band writes to different locations within tile)
#ifdef USE_OPENMP
    #pragma omp for schedule(static)
#endif
    for (uint b = 0; b < nb; b++) {
        const uint tile = b / TILE32;
        const uint b_local = b % TILE32;
        const T* __restrict__ src_col = temp + b * nrow;
        
        for (uint r = 0; r < nrow; r++) {
            const uint g = index[r];
            result_32packed[(tile * K + g) * TILE32 + b_local] += src_col[r];
        }
    }
}

// =============================================================================
// SCATTER: col-major temp[nrow, nb] → 16-band-packed result (accumulate)
// =============================================================================
template<typename T>
inline void scatter_colmajor_to_16packed(
    const T* __restrict__ temp,
    T* __restrict__ result_16packed,
    const uint* __restrict__ index,
    uint nrow, uint nb, uint K)
{
    constexpr uint TILE16 = 16;
    
#ifdef USE_OPENMP
    #pragma omp for schedule(static)
#endif
    for (uint b = 0; b < nb; b++) {
        const uint tile = b / TILE16;
        const uint b_local = b % TILE16;
        const T* __restrict__ src_col = temp + b * nrow;
        
        for (uint r = 0; r < nrow; r++) {
            const uint g = index[r];
            result_16packed[(tile * K + g) * TILE16 + b_local] += src_col[r];
        }
    }
}

// =============================================================================
// GEMM: C[M,N] = alpha * A^T[M,K] * B[K,N] + beta * C[M,N]
// A: col-major K×M, B: col-major K×N, C: col-major M×N
// With OpenMP parallelization over N (bands)
// =============================================================================
template<typename T>
inline void gemm_aTb_omp(
    uint M, uint N, uint K,
    T alpha,
    const T* __restrict__ A, uint ldA,
    const T* __restrict__ B, uint ldB,
    T beta,
    T* __restrict__ C, uint ldC)
{
#ifdef USE_OPENMP
    #pragma omp for schedule(static)
#endif
    for (uint n = 0; n < N; n++) {
        T* __restrict__ C_col = C + n * ldC;
        const T* __restrict__ B_col = B + n * ldB;
        
        for (uint m = 0; m < M; m++) {
            T sum = T(0);
            const T* __restrict__ A_col = A + m * ldA;
            
            #ifdef USE_OPENMP_SIMD
            #pragma omp simd reduction(+:sum)
            #endif
            for (uint k = 0; k < K; k++) {
                sum += A_col[k] * B_col[k];
            }
            
            if (beta == T(0)) {
                C_col[m] = alpha * sum;
            } else {
                C_col[m] = beta * C_col[m] + alpha * sum;
            }
        }
    }
}

// =============================================================================
// GEMM: C[M,N] = alpha * A[M,K] * B[K,N] + beta * C[M,N]
// With OpenMP parallelization over N (bands)
// =============================================================================
template<typename T>
inline void gemm_ab_omp(
    uint M, uint N, uint K,
    T alpha,
    const T* __restrict__ A, uint ldA,
    const T* __restrict__ B, uint ldB,
    T beta,
    T* __restrict__ C, uint ldC)
{
#ifdef USE_OPENMP
    #pragma omp for schedule(static)
#endif
    for (uint n = 0; n < N; n++) {
        T* __restrict__ C_col = C + n * ldC;
        const T* __restrict__ B_col = B + n * ldB;
        
        // Initialize output column
        if (beta == T(0)) {
            for (uint m = 0; m < M; m++) {
                C_col[m] = T(0);
            }
        } else if (beta != T(1)) {
            for (uint m = 0; m < M; m++) {
                C_col[m] *= beta;
            }
        }
        
        // C[:,n] += alpha * A * B[:,n]
        for (uint k = 0; k < K; k++) {
            const T* __restrict__ A_col = A + k * ldA;
            const T b_val = alpha * B_col[k];
            
            #ifdef USE_OPENMP_SIMD
            #pragma omp simd
            #endif
            for (uint m = 0; m < M; m++) {
                C_col[m] += A_col[m] * b_val;
            }
        }
    }
}

// =============================================================================
// nloc_project_vectors_packed: 16-packed → 32-packed
// =============================================================================
template<typename T>
void nloc_project_vectors_packed(
    T* __restrict__ result_32packed,
    const T* __restrict__ psi_16packed,
    const Effective_potential_nloc<T>& Vnloc,
    uint nb, uint K,
    T dv,
    const MPI_Comm& comm)
{
    if (Vnloc.nloc_projectors.empty()) return;
    
    const uint total_ncol = Vnloc.offsets.back();
    if (total_ncol == 0) return;
    
#ifdef USE_OPENMP
    // =========================================================================
    // OpenMP version (matches original workflow pattern)
    // =========================================================================
    
    static T* chi_vector_static = nullptr;
    #pragma omp single
    chi_vector_static = new (std::align_val_t(64)) T[total_ncol * nb]();
    T* const chi_vector = chi_vector_static;
    
    // Phase 1: GATHER + Forward GEMM
    for (uint ip = 0; ip < Vnloc.nloc_projectors.size(); ip++) {
        const Nloc_projector<T>& proj = Vnloc.nloc_projectors[ip];
        const uint nrow = proj.nrow;
        const uint ncol = proj.ncol;
        const uint offset = Vnloc.offsets[ip];
        
        if (nrow == 0 || ncol == 0) continue;
        
        static T* filtered_static = nullptr;
        #pragma omp single
        filtered_static = new (std::align_val_t(64)) T[nrow * nb];
        T* const filtered = filtered_static;
        
        // GATHER: 16-packed → col-major (OMP parallelized over bands)
        gather_16packed_to_colmajor(psi_16packed, filtered,
                                    proj.index.data(), nrow, nb, K);
        
        // Forward GEMM: chi_vector[offset:] = chi^T * filtered * dv
        gemm_aTb_omp(ncol, nb, nrow, dv,
                     proj.chi.data, nrow,
                     filtered, nrow,
                     T(1),  // accumulate
                     chi_vector + offset * nb, ncol);
        
        #pragma omp barrier
        #pragma omp single
        {
            delete[] filtered_static;
            filtered_static = nullptr;
        }
    }
    
    // Phase 2: MPI ALLREDUCE
    #pragma omp barrier
    #pragma omp master
    {
        int commsize;
        MPI_Comm_size(comm, &commsize);
        if (commsize > 1) {
            MPI_Allreduce(MPI_IN_PLACE, chi_vector, total_ncol * nb,
                          get_mpi_type_packed<T>(), MPI_SUM, comm);
        }
    }
    #pragma omp barrier
    
    // Phase 3: Scale by gamma
    int atom_index = Vnloc.nloc_projectors[0].atom_index - 1;
    for (uint ip = 0; ip < Vnloc.nloc_projectors.size(); ip++) {
        const Nloc_projector<T>& proj = Vnloc.nloc_projectors[ip];
        const uint ncol = proj.ncol;
        const uint offset = Vnloc.offsets[ip];
        
        if (atom_index != proj.atom_index) {
            atom_index = proj.atom_index;
            T* __restrict__ C = chi_vector + offset * nb;
            const T* __restrict__ gamma_data = proj.gamma.data;
            
            #ifdef USE_OPENMP_SIMD
            #pragma omp for simd schedule(static) collapse(2) nowait
            #else
            #pragma omp for schedule(static) collapse(2) nowait
            #endif
            for (uint b = 0; b < nb; b++) {
                for (uint j = 0; j < ncol; j++) {
                    C[j + b * ncol] *= gamma_data[j];
                }
            }
        }
    }
    #pragma omp barrier
    
    // Phase 4: Backward GEMM + SCATTER
    for (uint ip = 0; ip < Vnloc.nloc_projectors.size(); ip++) {
        const Nloc_projector<T>& proj = Vnloc.nloc_projectors[ip];
        const uint nrow = proj.nrow;
        const uint ncol = proj.ncol;
        const uint offset = Vnloc.offsets[ip];
        
        if (nrow == 0 || ncol == 0) continue;
        
        static T* temp_static = nullptr;
        #pragma omp single
        temp_static = new (std::align_val_t(64)) T[nrow * nb];
        T* const temp = temp_static;
        
        // Backward GEMM: temp = chi * chi_vector
        gemm_ab_omp(nrow, nb, ncol, T(1),
                    proj.chi.data, nrow,
                    chi_vector + offset * nb, ncol,
                    T(0),
                    temp, nrow);
        
        #pragma omp barrier
        
        // SCATTER: col-major → 32-packed (OMP parallelized over bands)
        scatter_colmajor_to_32packed(temp, result_32packed,
                                     proj.index.data(), nrow, nb, K);
        
        #pragma omp barrier
        #pragma omp single
        {
            delete[] temp_static;
            temp_static = nullptr;
        }
    }
    
    #pragma omp barrier
    #pragma omp single nowait
    {
        delete[] chi_vector_static;
        chi_vector_static = nullptr;
    }

#else
    // =========================================================================
    // Sequential version
    // =========================================================================
    
    T* chi_vector = new (std::align_val_t(64)) T[total_ncol * nb]();
    
    // Phase 1: GATHER + Forward GEMM
    for (uint ip = 0; ip < Vnloc.nloc_projectors.size(); ip++) {
        const Nloc_projector<T>& proj = Vnloc.nloc_projectors[ip];
        const uint nrow = proj.nrow;
        const uint ncol = proj.ncol;
        const uint offset = Vnloc.offsets[ip];
        
        if (nrow == 0 || ncol == 0) continue;
        
        T* filtered = new (std::align_val_t(64)) T[nrow * nb];
        gather_16packed_to_colmajor(psi_16packed, filtered,
                                    proj.index.data(), nrow, nb, K);
        
        gemm_aTb_omp(ncol, nb, nrow, dv,
                     proj.chi.data, nrow,
                     filtered, nrow,
                     T(1),
                     chi_vector + offset * nb, ncol);
        
        delete[] filtered;
    }
    
    // Phase 2: MPI ALLREDUCE
    int commsize;
    MPI_Comm_size(comm, &commsize);
    if (commsize > 1) {
        MPI_Allreduce(MPI_IN_PLACE, chi_vector, total_ncol * nb,
                      get_mpi_type_packed<T>(), MPI_SUM, comm);
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
            for (uint b = 0; b < nb; b++) {
                for (uint j = 0; j < ncol; j++) {
                    C[j + b * ncol] *= proj.gamma.data[j];
                }
            }
        }
    }
    
    // Phase 4: Backward GEMM + SCATTER
    for (uint ip = 0; ip < Vnloc.nloc_projectors.size(); ip++) {
        const Nloc_projector<T>& proj = Vnloc.nloc_projectors[ip];
        const uint nrow = proj.nrow;
        const uint ncol = proj.ncol;
        const uint offset = Vnloc.offsets[ip];
        
        if (nrow == 0 || ncol == 0) continue;
        
        T* temp = new (std::align_val_t(64)) T[nrow * nb];
        
        gemm_ab_omp(nrow, nb, ncol, T(1),
                    proj.chi.data, nrow,
                    chi_vector + offset * nb, ncol,
                    T(0),
                    temp, nrow);
        
        scatter_colmajor_to_32packed(temp, result_32packed,
                                     proj.index.data(), nrow, nb, K);
        
        delete[] temp;
    }
    
    delete[] chi_vector;
#endif
}

// =============================================================================
// nloc_project_vectors_packed_16to16: 16-packed → 16-packed (chebyshev filter)
// =============================================================================
template<typename T>
void nloc_project_vectors_packed_16to16(
    T* __restrict__ result_16packed,
    const T* __restrict__ psi_16packed,
    const Effective_potential_nloc<T>& Vnloc,
    uint nb, uint K,
    T dv,
    const MPI_Comm& comm)
{
    if (Vnloc.nloc_projectors.empty()) return;
    
    const uint total_ncol = Vnloc.offsets.back();
    if (total_ncol == 0) return;
    
#ifdef USE_OPENMP
    static T* chi_vector_static = nullptr;
    #pragma omp single
    chi_vector_static = new (std::align_val_t(64)) T[total_ncol * nb]();
    T* const chi_vector = chi_vector_static;
    
    // Phase 1: GATHER + Forward GEMM
    for (uint ip = 0; ip < Vnloc.nloc_projectors.size(); ip++) {
        const Nloc_projector<T>& proj = Vnloc.nloc_projectors[ip];
        const uint nrow = proj.nrow;
        const uint ncol = proj.ncol;
        const uint offset = Vnloc.offsets[ip];
        
        if (nrow == 0 || ncol == 0) continue;
        
        static T* filtered_static = nullptr;
        #pragma omp single
        filtered_static = new (std::align_val_t(64)) T[nrow * nb];
        T* const filtered = filtered_static;
        
        gather_16packed_to_colmajor(psi_16packed, filtered,
                                    proj.index.data(), nrow, nb, K);
        
        gemm_aTb_omp(ncol, nb, nrow, dv,
                     proj.chi.data, nrow,
                     filtered, nrow,
                     T(1),
                     chi_vector + offset * nb, ncol);
        
        #pragma omp barrier
        #pragma omp single
        {
            delete[] filtered_static;
            filtered_static = nullptr;
        }
    }
    
    #pragma omp barrier
    #pragma omp master
    {
        int commsize;
        MPI_Comm_size(comm, &commsize);
        if (commsize > 1) {
            MPI_Allreduce(MPI_IN_PLACE, chi_vector, total_ncol * nb,
                          get_mpi_type_packed<T>(), MPI_SUM, comm);
        }
    }
    #pragma omp barrier
    
    // Phase 3: Scale by gamma
    int atom_index = Vnloc.nloc_projectors[0].atom_index - 1;
    for (uint ip = 0; ip < Vnloc.nloc_projectors.size(); ip++) {
        const Nloc_projector<T>& proj = Vnloc.nloc_projectors[ip];
        const uint ncol = proj.ncol;
        const uint offset = Vnloc.offsets[ip];
        
        if (atom_index != proj.atom_index) {
            atom_index = proj.atom_index;
            T* __restrict__ C = chi_vector + offset * nb;
            const T* __restrict__ gamma_data = proj.gamma.data;
            
            #ifdef USE_OPENMP_SIMD
            #pragma omp for simd schedule(static) collapse(2) nowait
            #else
            #pragma omp for schedule(static) collapse(2) nowait
            #endif
            for (uint b = 0; b < nb; b++) {
                for (uint j = 0; j < ncol; j++) {
                    C[j + b * ncol] *= gamma_data[j];
                }
            }
        }
    }
    #pragma omp barrier
    
    // Phase 4: Backward GEMM + SCATTER to 16-packed
    for (uint ip = 0; ip < Vnloc.nloc_projectors.size(); ip++) {
        const Nloc_projector<T>& proj = Vnloc.nloc_projectors[ip];
        const uint nrow = proj.nrow;
        const uint ncol = proj.ncol;
        const uint offset = Vnloc.offsets[ip];
        
        if (nrow == 0 || ncol == 0) continue;
        
        static T* temp_static = nullptr;
        #pragma omp single
        temp_static = new (std::align_val_t(64)) T[nrow * nb];
        T* const temp = temp_static;
        
        gemm_ab_omp(nrow, nb, ncol, T(1),
                    proj.chi.data, nrow,
                    chi_vector + offset * nb, ncol,
                    T(0),
                    temp, nrow);
        
        #pragma omp barrier
        
        // SCATTER to 16-packed
        scatter_colmajor_to_16packed(temp, result_16packed,
                                     proj.index.data(), nrow, nb, K);
        
        #pragma omp barrier
        #pragma omp single
        {
            delete[] temp_static;
            temp_static = nullptr;
        }
    }
    
    #pragma omp barrier
    #pragma omp single nowait
    {
        delete[] chi_vector_static;
        chi_vector_static = nullptr;
    }

#else
    // Sequential version
    T* chi_vector = new (std::align_val_t(64)) T[total_ncol * nb]();
    
    for (uint ip = 0; ip < Vnloc.nloc_projectors.size(); ip++) {
        const Nloc_projector<T>& proj = Vnloc.nloc_projectors[ip];
        const uint nrow = proj.nrow;
        const uint ncol = proj.ncol;
        const uint offset = Vnloc.offsets[ip];
        
        if (nrow == 0 || ncol == 0) continue;
        
        T* filtered = new (std::align_val_t(64)) T[nrow * nb];
        gather_16packed_to_colmajor(psi_16packed, filtered,
                                    proj.index.data(), nrow, nb, K);
        
        gemm_aTb_omp(ncol, nb, nrow, dv,
                     proj.chi.data, nrow,
                     filtered, nrow,
                     T(1),
                     chi_vector + offset * nb, ncol);
        
        delete[] filtered;
    }
    
    int commsize;
    MPI_Comm_size(comm, &commsize);
    if (commsize > 1) {
        MPI_Allreduce(MPI_IN_PLACE, chi_vector, total_ncol * nb,
                      get_mpi_type_packed<T>(), MPI_SUM, comm);
    }
    
    int atom_index = Vnloc.nloc_projectors[0].atom_index - 1;
    for (uint ip = 0; ip < Vnloc.nloc_projectors.size(); ip++) {
        const Nloc_projector<T>& proj = Vnloc.nloc_projectors[ip];
        const uint ncol = proj.ncol;
        const uint offset = Vnloc.offsets[ip];
        
        if (atom_index != proj.atom_index) {
            atom_index = proj.atom_index;
            T* C = chi_vector + offset * nb;
            for (uint b = 0; b < nb; b++) {
                for (uint j = 0; j < ncol; j++) {
                    C[j + b * ncol] *= proj.gamma.data[j];
                }
            }
        }
    }
    
    for (uint ip = 0; ip < Vnloc.nloc_projectors.size(); ip++) {
        const Nloc_projector<T>& proj = Vnloc.nloc_projectors[ip];
        const uint nrow = proj.nrow;
        const uint ncol = proj.ncol;
        const uint offset = Vnloc.offsets[ip];
        
        if (nrow == 0 || ncol == 0) continue;
        
        T* temp = new (std::align_val_t(64)) T[nrow * nb];
        
        gemm_ab_omp(nrow, nb, ncol, T(1),
                    proj.chi.data, nrow,
                    chi_vector + offset * nb, ncol,
                    T(0),
                    temp, nrow);
        
        scatter_colmajor_to_16packed(temp, result_16packed,
                                     proj.index.data(), nrow, nb, K);
        
        delete[] temp;
    }
    
    delete[] chi_vector;
#endif
}

}  // namespace Hamiltonian
