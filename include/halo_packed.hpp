// halo_packed.hpp - MPI halo exchange for 16-band-packed layout
//
// This integrates with the existing Exarr_3D_mpi_package infrastructure.
// The key insight: vertex lists define WHICH grid points to send/receive.
// For packed, we send all bands for each grid point (contiguous per grid).
//
// Data movement ratio: SAME as original (same grid points exchanged)
// But: 1 MPI call for all bands, instead of nb calls!
//
// Packed layout: data[(tile * K + g) * 16 + b_local]
// where tile = b/16, b_local = b%16, K = ni*nj*nk
//
// Extended packed: same layout but K_ex = (ni+2*FDn)*(nj+2*FDn)*(nk+2*FDn)
//
// Memory layout per tile (K grid points, 16 bands per grid):
//   For fixed tile: [g=0: b0-b15][g=1: b0-b15]...[g=K-1: b0-b15]
//   Grid g = i + j*ni + k*ni*nj (row-major in i)
//   Row i=0..ni-1 for fixed (j,k) is CONTIGUOUS: ni*16 values
//
// Halo geometry:
//   K-halo (z-faces): slabs, rows contiguous (ni*16 per row per tile)
//   J-halo (y-faces): slabs, rows contiguous but j-gaps
//   I-halo (x-faces): FDn columns, FDn*16 contiguous per (j,k,tile)

#pragma once

#include <arm_sve.h>

#include <cassert>
#include <cstdint>
#include <type_traits>
#include <vector>

#ifndef HALO_PACKED_TEST_MOCK
#include <mpi.h>

#include "linalg.h"
#include "parallel_vertices.h"
#include "vertices.h"
#endif

using uint = unsigned int;

namespace Stencil_method {
namespace Packed {

// =============================================================================
// SVE copy utilities - avoid memcpy overhead for small copies
// =============================================================================

// Copy exactly 16 doubles using 2 SVE loads/stores (128 bytes)
// This is the atomic unit for packed layout: all 16 bands for one grid point
inline void sve_copy_16_f64(double* __restrict__ dst,
                            const double* __restrict__ src) {
  svbool_t ptrue = svptrue_b64();
  svst1_f64(ptrue, dst + 0, svld1_f64(ptrue, src + 0));
  svst1_f64(ptrue, dst + 8, svld1_f64(ptrue, src + 8));
}

// Copy n * 16 doubles (n grid points, each with 16 bands)
// Uses SVE for vectorized copy without function call overhead
inline void sve_copy_n16_f64(double* __restrict__ dst,
                             const double* __restrict__ src, uint n) {
  svbool_t ptrue = svptrue_b64();
  for (uint i = 0; i < n; ++i) {
    svst1_f64(ptrue, dst + 0, svld1_f64(ptrue, src + 0));
    svst1_f64(ptrue, dst + 8, svld1_f64(ptrue, src + 8));
    dst += 16;
    src += 16;
  }
}

// =============================================================================
// Get extended array dimensions
// =============================================================================
inline void get_extended_dims(uint ni, uint nj, uint nk, int FDn, uint& ni_ex,
                              uint& nj_ex, uint& nk_ex, uint& K_ex) {
  ni_ex = ni + 2 * FDn;
  nj_ex = nj + 2 * FDn;
  nk_ex = nk + 2 * FDn;
  K_ex = ni_ex * nj_ex * nk_ex;
}

// =============================================================================
// Copy interior from local packed to extended packed (ALL bands)
//
// Local:    g = i + j*ni + k*ni*nj,           K = ni*nj*nk
// Extended: g_ex = (i+FDn) + (j+FDn)*ni_ex + (k+FDn)*ni_ex*nj_ex
//
// Key insight: For each row (fixed j, k, tile), grids i=0..ni-1 are CONTIGUOUS
// in both source and destination! So we can copy ni*16 values at once per row.
// =============================================================================
template <typename T>
void copy_interior_to_extended_packed(
    const T* __restrict__ local_packed,  // [num_tiles, K, 16]
    T* __restrict__ extended_packed,     // [num_tiles, K_ex, 16]
    uint ni, uint nj, uint nk, uint nb, int FDn) {
  static_assert(std::is_same_v<T, double>,
                "Only double precision supported for SVE halo exchange");

  const uint K = ni * nj * nk;
  const uint ni_ex = ni + 2 * FDn;
  const uint nj_ex = nj + 2 * FDn;
  const uint K_ex = ni_ex * nj_ex * (nk + 2 * FDn);
  const uint num_tiles = (nb + 15) / 16;

#pragma omp parallel for collapse(3)
  for (uint tile = 0; tile < num_tiles; tile++) {
    for (uint k = 0; k < nk; k++) {
      for (uint j = 0; j < nj; j++) {
        // Source: row start at g = 0 + j*ni + k*ni*nj
        const uint g_row = j * ni + k * ni * nj;
        // Destination: row start at g_ex = FDn + (j+FDn)*ni_ex +
        // (k+FDn)*ni_ex*nj_ex
        const uint g_ex_row =
            FDn + (j + FDn) * ni_ex + (k + FDn) * ni_ex * nj_ex;

        const T* src_row = local_packed + (tile * K + g_row) * 16;
        T* dst_row = extended_packed + (tile * K_ex + g_ex_row) * 16;

        // Copy entire row: ni grid points × 16 bands
        sve_copy_n16_f64(dst_row, src_row, ni);
      }
    }
  }
}

#ifndef HALO_PACKED_TEST_MOCK

// =============================================================================
// Pack a 3D region from local_packed to linear send buffer
//
// Buffer layout: [buf_grid_idx][num_tiles * 16]
// Each grid point has all its band data contiguous (num_tiles × 16 values)
// This matches MPI's expectation: contiguous data per grid point
//
// Optimization: Use SVE for 16-value copies, iterate (k,j) outer for row
// locality
// =============================================================================
template <typename T>
void fill_vector_packed(
    const T* __restrict__ local_packed,  // [num_tiles, K, 16]
    const Vertices_3D& local_vertices,   // Describes local array
    T* __restrict__ buffer,          // Output: [total_grids, num_tiles * 16]
    const Vertices_3D& fill_region,  // Which region to pack
    uint nb,                         // Number of bands
    uint64_t buffer_offset)          // Offset in buffer (in grid points)
{
  static_assert(std::is_same_v<T, double>,
                "Only double precision supported for SVE halo exchange");

  const uint num_tiles = (nb + 15) / 16;
  const uint K = local_vertices.ni * local_vertices.nj * local_vertices.nk;

  const int64_t ni = local_vertices.ni;
  const int64_t ninj = local_vertices.ni * local_vertices.nj;

  const int64_t region_is = fill_region.is - local_vertices.is;
  const int64_t region_js = fill_region.js - local_vertices.js;
  const int64_t region_ks = fill_region.ks - local_vertices.ks;
  const int64_t region_ni = fill_region.ni;
  const int64_t region_nj = fill_region.nj;
  const int64_t region_nk = fill_region.nk;

  const uint64_t values_per_grid = num_tiles * 16;

// Iterate (k, j) outer so source rows are accessed sequentially
#pragma omp parallel for collapse(2)
  for (int64_t k = 0; k < region_nk; k++) {
    for (int64_t j = 0; j < region_nj; j++) {
      // Base grid and buffer addresses for this row
      const int64_t g_row_base =
          region_is + (region_js + j) * ni + (region_ks + k) * ninj;
      const int64_t buf_row_base =
          buffer_offset + j * region_ni + k * region_ni * region_nj;

      for (int64_t i = 0; i < region_ni; i++) {
        const int64_t g = g_row_base + i;
        T* dst_grid = buffer + (buf_row_base + i) * values_per_grid;

        // Copy all tiles for this grid point using SVE
        for (uint tile = 0; tile < num_tiles; tile++) {
          const T* src = local_packed + (tile * K + g) * 16;
          sve_copy_16_f64(dst_grid + tile * 16, src);
        }
      }
    }
  }
}

// =============================================================================
// Unpack linear buffer to extended packed array
//
// Buffer layout: [buf_grid_idx][num_tiles * 16] (matches fill_vector_packed)
// Extended layout: [tile][K_ex][16]
//
// The unpack is the scatter operation - data from contiguous buffer goes to
// potentially non-contiguous positions in extended array (due to different
// ni_ex stride)
// =============================================================================
template <typename T>
void be_filled_vector_packed(
    T* __restrict__ extended_packed,       // [num_tiles, K_ex, 16]
    const Vertices_3D& extended_vertices,  // Describes extended array
    const T* __restrict__ buffer,  // Input: [total_grids, num_tiles * 16]
    const Vertices_3D&
        super_region,  // Super-region (for reference - unused in packed)
    const Vertices_3D& fill_region,  // Where to put data in extended
    uint nb,
    int64_t buffer_offset)  // Offset in buffer (in grid points)
{
  static_assert(std::is_same_v<T, double>,
                "Only double precision supported for SVE halo exchange");
  (void)super_region;  // Not needed for packed version

  const uint num_tiles = (nb + 15) / 16;
  const uint K_ex =
      extended_vertices.ni * extended_vertices.nj * extended_vertices.nk;

  const int64_t ni_ex = extended_vertices.ni;
  const int64_t ninj_ex = extended_vertices.ni * extended_vertices.nj;

  // Destination region in extended array (using global coordinates)
  const int64_t dst_is = fill_region.is - extended_vertices.is;
  const int64_t dst_js = fill_region.js - extended_vertices.js;
  const int64_t dst_ks = fill_region.ks - extended_vertices.ks;
  const int64_t region_ni = fill_region.ni;
  const int64_t region_nj = fill_region.nj;
  const int64_t region_nk = fill_region.nk;

  const uint64_t values_per_grid = num_tiles * 16;

// Iterate (k, j) outer so destination rows are accessed sequentially
#pragma omp parallel for collapse(2)
  for (int64_t k = 0; k < region_nk; k++) {
    for (int64_t j = 0; j < region_nj; j++) {
      // Base grid and buffer addresses for this row
      const int64_t g_ex_row_base =
          dst_is + (dst_js + j) * ni_ex + (dst_ks + k) * ninj_ex;
      const int64_t buf_row_base =
          buffer_offset + j * region_ni + k * region_ni * region_nj;

      for (int64_t i = 0; i < region_ni; i++) {
        const int64_t g_ex = g_ex_row_base + i;
        const T* src_grid = buffer + (buf_row_base + i) * values_per_grid;

        // Copy all tiles for this grid point using SVE
        for (uint tile = 0; tile < num_tiles; tile++) {
          T* dst = extended_packed + (tile * K_ex + g_ex) * 16;
          sve_copy_16_f64(dst, src_grid + tile * 16);
        }
      }
    }
  }
}

// =============================================================================
// Main packed halo exchange function
// Uses existing Exarr_3D_mpi_package vertex lists
//
// SAME data movement as original, but:
// - Original: nb MPI calls (one per band)
// - Packed: 1 MPI call (all bands together)
// =============================================================================
template <typename T>
void fill_domain_par_ex_arr_packed(
    const T* __restrict__ local_packed,  // [num_tiles, K, 16]
    const Vertices_3D& local_vertices,
    T* __restrict__ extended_packed,  // [num_tiles, K_ex, 16]
    const Vertices_3D& extended_vertices, uint nb,
    const Exarr_3D_mpi_package& exarr_mpi_package) {
  static_assert(std::is_same_v<T, double>,
                "Only double precision supported for SVE halo exchange");

  const uint num_tiles = (nb + 15) / 16;
  const uint64_t values_per_grid = num_tiles * 16;

  int comm_size;
  MPI_Comm_size(exarr_mpi_package.comm, &comm_size);

  if (exarr_mpi_package.need_comm) {
    MPI_Datatype mpi_datatype = Linalg::get_mpi_datatype<T>();

    // Buffer sizes: original count * values_per_grid
    const int64_t send_total =
        exarr_mpi_package.send_offsets[comm_size] * values_per_grid;
    const int64_t recv_total =
        exarr_mpi_package.receive_offsets[comm_size] * values_per_grid;

    T* send_buffer = new T[send_total];
    T* recv_buffer = new T[recv_total];

    // Scale send/receive counts and offsets by values_per_grid
    std::vector<int> send_counts_scaled(comm_size);
    std::vector<int> send_offsets_scaled(comm_size + 1);
    std::vector<int> recv_counts_scaled(comm_size);
    std::vector<int> recv_offsets_scaled(comm_size + 1);

    for (int i = 0; i < comm_size; i++) {
      send_counts_scaled[i] =
          exarr_mpi_package.send_nnode_list[i] * values_per_grid;
      recv_counts_scaled[i] =
          exarr_mpi_package.receive_nnode_list[i] * values_per_grid;
    }
    send_offsets_scaled[0] = 0;
    recv_offsets_scaled[0] = 0;
    for (int i = 0; i < comm_size; i++) {
      send_offsets_scaled[i + 1] =
          send_offsets_scaled[i] + send_counts_scaled[i];
      recv_offsets_scaled[i + 1] =
          recv_offsets_scaled[i] + recv_counts_scaled[i];
    }

    // Pack send buffer
    for (int i = 0; i < comm_size; i++) {
      if (exarr_mpi_package.send_nnode_list[i] > 0) {
        fill_vector_packed(local_packed, local_vertices, send_buffer,
                           exarr_mpi_package.send_overlap_vertices_list[i], nb,
                           exarr_mpi_package.send_offsets[i]);
      }
    }

    // Start async MPI exchange
    MPI_Request request;
    MPI_Ialltoallv(send_buffer, send_counts_scaled.data(),
                   send_offsets_scaled.data(), mpi_datatype, recv_buffer,
                   recv_counts_scaled.data(), recv_offsets_scaled.data(),
                   mpi_datatype, exarr_mpi_package.comm, &request);

    // Copy interior while MPI is in flight
    int FDn = (extended_vertices.ni - local_vertices.ni) / 2;
    copy_interior_to_extended_packed(local_packed, extended_packed,
                                     local_vertices.ni, local_vertices.nj,
                                     local_vertices.nk, nb, FDn);

    // Wait for MPI to complete
    MPI_Wait(&request, MPI_STATUS_IGNORE);

    // Unpack received data to extended array
    for (uint i = 0; i < exarr_mpi_package.domain_counts_sum; i++) {
      be_filled_vector_packed(
          extended_packed, extended_vertices, recv_buffer,
          exarr_mpi_package.receive_super_stencil_vertices_list[i],
          exarr_mpi_package.receive_stencil_vertices_list[i], nb,
          exarr_mpi_package.receive_stencil_vertices_offset[i]);
    }

    delete[] send_buffer;
    delete[] recv_buffer;
  } else {
    // No MPI needed - just copy interior and handle local periodic boundaries
    int FDn = (extended_vertices.ni - local_vertices.ni) / 2;
    copy_interior_to_extended_packed(local_packed, extended_packed,
                                     local_vertices.ni, local_vertices.nj,
                                     local_vertices.nk, nb, FDn);

    // For single-rank periodic: copy from local to extended (same rank)
    // The receive_stencil_vertices_list[i] describes the DESTINATION in extended
    // coordinates. The receive_stencil_vertices_offset[i] is the offset into the
    // local (source) array that maps to the correct wrapped position.
    const int64_t local_ni = local_vertices.ni;
    const int64_t local_nj = local_vertices.nj;
    for (uint i = 0; i < exarr_mpi_package.domain_counts_sum; i++) {
      const Vertices_3D& recv_region =
          exarr_mpi_package.receive_stencil_vertices_list[i];
      const uint64_t region_size =
          recv_region.ni * recv_region.nj * recv_region.nk;
      T* temp_buffer = new T[region_size * values_per_grid];

      // Compute source region in local coordinates from the linear offset
      const int64_t offset = exarr_mpi_package.receive_stencil_vertices_offset[i];
      const int64_t src_ks = offset / (local_ni * local_nj);
      const int64_t src_js = (offset % (local_ni * local_nj)) / local_ni;
      const int64_t src_is = offset % local_ni;
      Vertices_3D src_region(src_is + local_vertices.is,
                             (int64_t)recv_region.ni - 1 + src_is + local_vertices.is,
                             src_js + local_vertices.js,
                             (int64_t)recv_region.nj - 1 + src_js + local_vertices.js,
                             src_ks + local_vertices.ks,
                             (int64_t)recv_region.nk - 1 + src_ks + local_vertices.ks);

      fill_vector_packed(local_packed, local_vertices, temp_buffer, src_region,
                         nb, 0);

      be_filled_vector_packed(
          extended_packed, extended_vertices, temp_buffer,
          exarr_mpi_package.receive_super_stencil_vertices_list[i], recv_region,
          nb, 0);

      delete[] temp_buffer;
    }
  }
}

#endif  // HALO_PACKED_TEST_MOCK

}  // namespace Packed
}  // namespace Stencil_method
