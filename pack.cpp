// SME-based Packing Functions for CheFSI
//
// linalg_pack_c16: Pack from column-major [Nd, nb] to [Nd/16, nb, 16]
// linalg_pack_r16: Pack from row-major [nb, Nd] to [Nd/16, nb, 16]
//
// Input layouts:
//   Column-major [Nd, nb]: src[g, b] = src[g + b * Nd]  (Nd grids contiguous
//   per column/band) Row-major [nb, Nd]: src[b, g] = src[b * Nd + g]     (Nd
//   grids contiguous per row/band)
//
// Output packed [Nd/16, nb, 16]:
//   dst[g, b] = dst[(g/16) * nb * 16 + b * 16 + g%16]
//   For each grid tile: nb bands × 16 grids are contiguous

#include <omp.h>

#include <chrono>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <type_traits>

#include "hbm_alloc.hpp"
#include "utils.hpp"

#ifndef NUM_THREADS
#define NUM_THREADS 38
#endif

// Include the sme_pack class from header
#include "sme_pack.hpp"

// =============================================================================
// Test harness
// =============================================================================

template <typename T>
bool test_pack_c16(int Nd, int nb) {
  printf("Testing pack_c16<double>: Nd=%d nb=%d\n", Nd, nb);

  const int g_tiles = Nd / 16;

  // Allocate
  T* src = hbm_alloc<T>(Nd * nb);               // column-major [Nd, nb]
  T* packed = hbm_alloc<T>(g_tiles * nb * 16);  // packed [Nd/16, nb, 16]
  T* unpacked = hbm_alloc<T>(Nd * nb);          // column-major [Nd, nb]

  // Initialize: src[g, b] = g + b * 1000
  for (int b = 0; b < nb; ++b) {
    for (int g = 0; g < Nd; ++g) {
      src[g + b * Nd] = static_cast<T>(g + b * 1000);
    }
  }

  std::memset(packed, 0, g_tiles * nb * 16 * sizeof(T));
  std::memset(unpacked, 0, Nd * nb * sizeof(T));

  // Pack then unpack
  sme_pack<T>::pack_c16(Nd, nb, src, packed);
  sme_pack<T>::unpack_c16(Nd, nb, packed, unpacked);

  // Verify round-trip
  bool pass = true;
  for (int i = 0; i < Nd * nb; ++i) {
    if (src[i] != unpacked[i]) {
      printf("  MISMATCH at %d: src=%.0f, unpacked=%.0f\n", i, src[i],
             unpacked[i]);
      pass = false;
      break;
    }
  }

  // Also verify packed layout directly
  if (pass) {
    for (int g = 0; g < Nd; ++g) {
      for (int b = 0; b < nb; ++b) {
        int g_tile = g / 16;
        int g_local = g % 16;
        T expected = src[g + b * Nd];
        T actual = packed[g_tile * nb * 16 + b * 16 + g_local];
        if (expected != actual) {
          printf("  PACKED MISMATCH at g=%d b=%d: expected=%.0f, actual=%.0f\n",
                 g, b, expected, actual);
          pass = false;
          break;
        }
      }
      if (!pass) break;
    }
  }

  printf("  %s\n", pass ? "PASSED!" : "FAILED!");

  hbm_free(src);
  hbm_free(packed);
  hbm_free(unpacked);

  return pass;
}

template <typename T>
bool test_pack_r16(int Nd, int nb) {
  printf("Testing pack_r16<double>: Nd=%d nb=%d\n", Nd, nb);

  const int g_tiles = Nd / 16;

  // Allocate
  T* src = hbm_alloc<T>(nb * Nd);               // row-major [nb, Nd]
  T* packed = hbm_alloc<T>(g_tiles * nb * 16);  // packed [Nd/16, nb, 16]
  T* unpacked = hbm_alloc<T>(nb * Nd);          // row-major [nb, Nd]

  // Initialize: src[b, g] = g + b * 1000
  for (int b = 0; b < nb; ++b) {
    for (int g = 0; g < Nd; ++g) {
      src[b * Nd + g] = static_cast<T>(g + b * 1000);
    }
  }

  std::memset(packed, 0, g_tiles * nb * 16 * sizeof(T));
  std::memset(unpacked, 0, nb * Nd * sizeof(T));

  // Pack then unpack
  sme_pack<T>::pack_r16(Nd, nb, src, packed);
  sme_pack<T>::unpack_r16(Nd, nb, packed, unpacked);

  // Verify round-trip
  bool pass = true;
  for (int i = 0; i < nb * Nd; ++i) {
    if (src[i] != unpacked[i]) {
      printf("  MISMATCH at %d: src=%.0f, unpacked=%.0f\n", i, src[i],
             unpacked[i]);
      pass = false;
      break;
    }
  }

  // Also verify packed layout directly
  if (pass) {
    for (int g = 0; g < Nd; ++g) {
      for (int b = 0; b < nb; ++b) {
        int g_tile = g / 16;
        int g_local = g % 16;
        T expected = src[b * Nd + g];  // row-major: src[b, g]
        T actual = packed[g_tile * nb * 16 + b * 16 +
                          g_local];  // packed: [g_tile, b, g_local]
        if (expected != actual) {
          printf("  PACKED MISMATCH at g=%d b=%d: expected=%.0f, actual=%.0f\n",
                 g, b, expected, actual);
          pass = false;
          break;
        }
      }
      if (!pass) break;
    }
  }

  printf("  %s\n", pass ? "PASSED!" : "FAILED!");

  hbm_free(src);
  hbm_free(packed);
  hbm_free(unpacked);

  return pass;
}

template <typename T>
double benchmark_pack(int Nd, int nb) {
  const int g_tiles = Nd / 16;

  T* src = hbm_alloc<T>(Nd * nb);
  T* dst = hbm_alloc<T>(g_tiles * nb * 16);

  for (int i = 0; i < Nd * nb; ++i) src[i] = static_cast<T>(i % 100);

  // Warmup
  sme_pack<T>::pack_c16(Nd, nb, src, dst);

  auto start = std::chrono::high_resolution_clock::now();
  for (int i = 0; i < 10; ++i) {
    sme_pack<T>::pack_c16(Nd, nb, src, dst);
  }
  auto end = std::chrono::high_resolution_clock::now();

  hbm_free(src);
  hbm_free(dst);

  return std::chrono::duration<double, std::nano>(end - start).count() / 10;
}

// Test band_to_grid and grid_to_band conversion
template <typename T>
bool test_band_grid_convert(int Nd, int nb) {
  printf("Testing band<->grid conversion: Nd=%d nb=%d\n", Nd, nb);

  const int g_tiles = Nd / 16;
  const int b_tiles = nb / 16;

  // Allocate
  T* band_tile = hbm_alloc<T>(b_tiles * Nd * 16);   // [nb/16, Nd, 16] band-tile
  T* grid_tile = hbm_alloc<T>(g_tiles * nb * 16);   // [Nd/16, nb, 16] grid-tile
  T* band_tile2 = hbm_alloc<T>(b_tiles * Nd * 16);  // round-trip result

  // Initialize band_tile with pattern: value[g,b] = g + b * 1000
  // band_tile[(b/16)*Nd*16 + g*16 + b%16]
  for (int g = 0; g < Nd; ++g) {
    for (int b = 0; b < nb; ++b) {
      int bt = b / 16;
      int bl = b % 16;
      band_tile[bt * Nd * 16 + g * 16 + bl] = static_cast<T>(g + b * 1000);
    }
  }

  std::memset(grid_tile, 0, g_tiles * nb * 16 * sizeof(T));
  std::memset(band_tile2, 0, b_tiles * Nd * 16 * sizeof(T));

  // Convert band -> grid -> band
  sme_pack<T>::band_to_grid_tile(Nd, nb, band_tile, grid_tile);
  sme_pack<T>::grid_to_band_tile(Nd, nb, grid_tile, band_tile2);

  // Verify round-trip
  bool pass = true;
  for (int i = 0; i < b_tiles * Nd * 16; ++i) {
    if (band_tile[i] != band_tile2[i]) {
      printf("  ROUND-TRIP MISMATCH at %d: orig=%.0f, result=%.0f\n", i,
             band_tile[i], band_tile2[i]);
      pass = false;
      break;
    }
  }

  // Verify grid_tile format directly
  if (pass) {
    for (int g = 0; g < Nd; ++g) {
      for (int b = 0; b < nb; ++b) {
        int gt = g / 16;
        int gl = g % 16;
        T expected = static_cast<T>(g + b * 1000);
        T actual = grid_tile[gt * nb * 16 + b * 16 + gl];
        if (expected != actual) {
          printf(
              "  GRID_TILE MISMATCH at g=%d b=%d: expected=%.0f, actual=%.0f\n",
              g, b, expected, actual);
          pass = false;
          break;
        }
      }
      if (!pass) break;
    }
  }

  printf("  %s\n", pass ? "PASSED!" : "FAILED!");

  hbm_free(band_tile);
  hbm_free(grid_tile);
  hbm_free(band_tile2);

  return pass;
}

// =============================================================================
// Main
// =============================================================================

int main(int argc, char** argv) {
  hbm_init();
  printf("SME Packing Functions Test\n");
  printf("SVL=%d, SVCNT=%d, Threads=%d\n\n", SVL, sme_pack<double>::SVCNT,
         NUM_THREADS);

  omp_set_num_threads(NUM_THREADS);

  int passed = 0, total = 0;

  // Test pack_c16
  printf("=== Test 1: pack_c16 Nd=64, nb=32 ===\n");
  if (test_pack_c16<double>(64, 32)) passed++;
  total++;

  printf("\n=== Test 2: pack_c16 Nd=256, nb=64 ===\n");
  if (test_pack_c16<double>(256, 64)) passed++;
  total++;

  // Test pack_r16
  printf("\n=== Test 3: pack_r16 Nd=64, nb=32 ===\n");
  if (test_pack_r16<double>(64, 32)) passed++;
  total++;

  printf("\n=== Test 4: pack_r16 Nd=256, nb=64 ===\n");
  if (test_pack_r16<double>(256, 64)) passed++;
  total++;

  // Test band<->grid conversion
  printf("\n=== Test 5: band<->grid Nd=64, nb=32 ===\n");
  if (test_band_grid_convert<double>(64, 32)) passed++;
  total++;

  printf("\n=== Test 6: band<->grid Nd=256, nb=64 ===\n");
  if (test_band_grid_convert<double>(256, 64)) passed++;
  total++;

  printf("\n=== Summary: %d/%d tests passed ===\n", passed, total);

  if (passed == total) {
    // Benchmark
    printf("\n=== Benchmark: pack_c16 Nd=256 nb=64 ===\n");
    double time_ns = benchmark_pack<double>(256, 64);
    double gbps = (double)(256 * 64 * sizeof(double)) / time_ns;
    printf("Time: %.3f us, Bandwidth: %.2f GB/s\n", time_ns / 1e3, gbps);
  }

  return (passed == total) ? 0 : 1;
}
