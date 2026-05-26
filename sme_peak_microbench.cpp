#include <chrono>
#include <cstdint>
#include <cstdio>
#include <cstdlib>

#include "utils.hpp"

namespace {

using T = double;
constexpr int SVCNT = SVL / sizeof(T);
constexpr int ZA_TILE_M = 2 * SVCNT;  // 16 for f64 when SVL=64
constexpr int ZA_TILE_N = 4 * SVCNT;  // 32 for f64 when SVL=64
constexpr int FMOPA_PER_ITER = 4;

#ifndef __arm_sim
__arm_new("za")
#endif
    __arm_locally_streaming static void run_fmopa_loop(
        const uint64_t iters, const T* __restrict__ a, const T* __restrict__ b,
        T* __restrict__ checksum_out) {

  svfloat64_t va = svld1(svptrue_b64(), a);
  svfloat64_t vb0 = svld1_vnum(svptrue_b64(), b, 0);
  svfloat64_t vb1 = svld1_vnum(svptrue_b64(), b, 1);
  svfloat64_t vb2 = svld1_vnum(svptrue_b64(), b, 2);
  svfloat64_t vb3 = svld1_vnum(svptrue_b64(), b, 3);

  auto start = std::chrono::high_resolution_clock::now();

  for (uint64_t i = 0; i < iters; i++) {
    svmopa_za64_f64_m(0, svptrue_b64(), svptrue_b64(), va, vb0);
    svmopa_za64_f64_m(1, svptrue_b64(), svptrue_b64(), va, vb1);
    svmopa_za64_f64_m(2, svptrue_b64(), svptrue_b64(), va, vb2);
    svmopa_za64_f64_m(3, svptrue_b64(), svptrue_b64(), va, vb3);
    asm volatile("" : : : "memory");
  }

  auto end = std::chrono::high_resolution_clock::now();
  const double time_ns =
      std::chrono::duration<double, std::nano>(end - start).count();

  // Performance
  const double flops = static_cast<double>(FMOPA_PER_ITER) * SVCNT * SVCNT * 2;
  const double gflops = (flops * iters) / time_ns;
  std::printf("Time: %.3f ms, Throughput: %.3f GFMOPA/s, %.2f GFLOP/s\\n",
              time_ns / 1e6, gflops / 1e9, gflops);

  const svbool_t ptrue = svptrue_b64();
  svfloat64_t row0;
  row0 = svread_hor_za64_f64_m(row0, ptrue, 0, 0);

  alignas(64) T tmp[SVCNT];
  svst1_f64(ptrue, tmp, row0);

  T checksum = 0.0;
  for (int i = 0; i < SVCNT; ++i) {
    checksum += tmp[i];
  }
  *checksum_out = checksum;
}

}  // namespace

int main(int argc, char** argv) {
  const uint64_t iters =
      (argc >= 2) ? std::strtoull(argv[1], nullptr, 10) : 1000000000ULL;
  const uint64_t warmup =
      (argc >= 3) ? std::strtoull(argv[2], nullptr, 10) : 1000000ULL;

  if (iters == 0 || warmup == 0) {
    std::printf("Usage: ./sme_peak_microbench [iters] [warmup]\\n");
    return 1;
  }

  alignas(64) T a[SVCNT];
  alignas(64) T b[SVCNT];
  for (int i = 0; i < SVCNT; ++i) {
    a[i] = static_cast<T>(1.0 + 0.001 * i);
    b[i] = static_cast<T>(2.0 + 0.001 * i);
  }

  T checksum = 0.0;
  run_fmopa_loop(iters, a, b, &checksum);

  return 0;
}
