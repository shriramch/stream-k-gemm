// Integration test for SME TRP GEMM with band-tile format
// Tests full pipeline: band-tile → grid-tile → TRP → grid-tile → band-tile

#include <omp.h>

#include <cmath>
#include <cstdio>
#include <cstdlib>

#include "sme_trp.hpp"

template <typename T>
void init_band_tile(int Nd, int nb, T* data, int seed) {
  // Initialize band-tile format [nb/16, Nd, 16]
  srand(seed);
  for (int bt = 0; bt < nb / 16; ++bt) {
    for (int g = 0; g < Nd; ++g) {
      for (int b_local = 0; b_local < 16; ++b_local) {
        int b = bt * 16 + b_local;
        data[bt * Nd * 16 + g * 16 + b_local] = (T)(rand() % 100) / 100.0;
      }
    }
  }
}

template <typename T>
void init_Q(int nb, T* Q, int seed) {
  // Row-major Q [nb, nb]
  srand(seed);
  for (int i = 0; i < nb * nb; ++i) {
    Q[i] = (T)(rand() % 100) / 100.0;
  }
}

template <typename T>
T band_tile_get(int Nd, int nb, const T* data, int g, int b) {
  // Access band-tile format [nb/16, Nd, 16]
  return data[(b / 16) * Nd * 16 + g * 16 + b % 16];
}

template <typename T>
void compute_reference(int Nd, int nb, const T* psi_in, const T* Q,
                       T* psi_out) {
  // Reference: psi_out[g,b'] = sum_b psi_in[g,b] * Q[b,b']
  for (int g = 0; g < Nd; ++g) {
    for (int bp = 0; bp < nb; ++bp) {
      T sum = 0;
      for (int b = 0; b < nb; ++b) {
        T psi_val = band_tile_get(Nd, nb, psi_in, g, b);
        T q_val = Q[b * nb + bp];  // Q is row-major
        sum += psi_val * q_val;
      }
      // Store in band-tile format
      psi_out[(bp / 16) * Nd * 16 + g * 16 + bp % 16] = sum;
    }
  }
}

template <typename T>
bool verify(int Nd, int nb, const T* ref, const T* actual, T tol) {
  T max_err = 0;
  int err_count = 0;
  for (int bt = 0; bt < nb / 16; ++bt) {
    for (int g = 0; g < Nd; ++g) {
      for (int b_local = 0; b_local < 16; ++b_local) {
        int idx = bt * Nd * 16 + g * 16 + b_local;
        T err = std::abs(ref[idx] - actual[idx]);
        if (err > tol) {
          if (err_count < 5) {
            int b = bt * 16 + b_local;
            printf(
                "  Mismatch at g=%d, b=%d: ref=%.6f, actual=%.6f, err=%.6f\n",
                g, b, (double)ref[idx], (double)actual[idx], (double)err);
          }
          err_count++;
        }
        max_err = std::max(max_err, err);
      }
    }
  }
  printf("  Max error: %.6e, errors: %d/%d\n", (double)max_err, err_count,
         Nd * nb);
  return max_err < tol;
}

int main() {
  printf("=== SME TRP Integration Test ===\n");
  printf("SVL=%d, Threads=%d\n\n", SVL, omp_get_max_threads());

  using T = double;

  struct TestCase {
    int Nd;
    int nb;
  };

  TestCase tests[] = {
      {64, 32},
      {256, 64},
      {512, 96},
      {1024, 128},
  };

  int passed = 0;
  int total = sizeof(tests) / sizeof(tests[0]);

  for (int t = 0; t < total; ++t) {
    int Nd = tests[t].Nd;
    int nb = tests[t].nb;

    printf("Test %d: Nd=%d, nb=%d\n", t + 1, Nd, nb);

    T* psi_in = new (std::align_val_t(64)) T[nb / 16 * Nd * 16]();
    T* Q = new (std::align_val_t(64)) T[nb * nb]();
    T* psi_out_ref = new (std::align_val_t(64)) T[nb / 16 * Nd * 16]();
    T* psi_out_sme = new (std::align_val_t(64)) T[nb / 16 * Nd * 16]();

    init_band_tile(Nd, nb, psi_in, 42 + t);
    init_Q(nb, Q, 123 + t);

    // Reference computation
    compute_reference(Nd, nb, psi_in, Q, psi_out_ref);

    // SME TRP computation
    sme_subspace_rotation(Nd, nb, psi_in, Q, psi_out_sme);

    // Verify
    bool ok = verify(Nd, nb, psi_out_ref, psi_out_sme, 1e-9);
    printf("  Result: %s\n\n", ok ? "PASSED" : "FAILED");
    if (ok) passed++;

    delete[] psi_in;
    delete[] Q;
    delete[] psi_out_ref;
    delete[] psi_out_sme;
  }

  printf("=== Summary: %d/%d tests passed ===\n", passed, total);
  return passed == total ? 0 : 1;
}
