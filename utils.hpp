
#include <arm_sme.h>
#include <arm_sve.h>

#ifndef SVL
#define SVL 64  // SVL in bytes for armie -msvl=64
#endif

#ifndef TYPE
#define TYPE double
#endif

#ifndef __forceinline
#define __forceinline inline __attribute__((always_inline))
#endif

// =============================================================================
// ZA tile store/load helpers
// =============================================================================

template <typename T>
__forceinline void za_st1_hor(int tile, int slice, void* ptr) __arm_streaming
#ifndef __arm_sim
    __arm_inout("za")
#endif
{
  if constexpr (std::is_same_v<T, float>) {
    switch (tile) {
      case 0:
        svst1_hor_za32(0, slice, svptrue_b32(), ptr);
        break;
      case 1:
        svst1_hor_za32(1, slice, svptrue_b32(), ptr);
        break;
      case 2:
        svst1_hor_za32(2, slice, svptrue_b32(), ptr);
        break;
      case 3:
        svst1_hor_za32(3, slice, svptrue_b32(), ptr);
        break;
    }
  } else if constexpr (std::is_same_v<T, double>) {
    switch (tile) {
      case 0:
        svst1_hor_za64(0, slice, svptrue_b64(), ptr);
        break;
      case 1:
        svst1_hor_za64(1, slice, svptrue_b64(), ptr);
        break;
      case 2:
        svst1_hor_za64(2, slice, svptrue_b64(), ptr);
        break;
      case 3:
        svst1_hor_za64(3, slice, svptrue_b64(), ptr);
        break;
      case 4:
        svst1_hor_za64(4, slice, svptrue_b64(), ptr);
        break;
      case 5:
        svst1_hor_za64(5, slice, svptrue_b64(), ptr);
        break;
      case 6:
        svst1_hor_za64(6, slice, svptrue_b64(), ptr);
        break;
      case 7:
        svst1_hor_za64(7, slice, svptrue_b64(), ptr);
        break;
    }
  }
}

template <typename T>
__forceinline void za_ld1_hor(int tile, int slice,
                              const void* ptr) __arm_streaming
#ifndef __arm_sim
    __arm_inout("za")
#endif
{
  if constexpr (std::is_same_v<T, float>) {
    switch (tile) {
      case 0:
        svld1_hor_za32(0, slice, svptrue_b32(), ptr);
        break;
      case 1:
        svld1_hor_za32(1, slice, svptrue_b32(), ptr);
        break;
      case 2:
        svld1_hor_za32(2, slice, svptrue_b32(), ptr);
        break;
      case 3:
        svld1_hor_za32(3, slice, svptrue_b32(), ptr);
        break;
    }
  } else if constexpr (std::is_same_v<T, double>) {
    switch (tile) {
      case 0:
        svld1_hor_za64(0, slice, svptrue_b64(), ptr);
        break;
      case 1:
        svld1_hor_za64(1, slice, svptrue_b64(), ptr);
        break;
      case 2:
        svld1_hor_za64(2, slice, svptrue_b64(), ptr);
        break;
      case 3:
        svld1_hor_za64(3, slice, svptrue_b64(), ptr);
        break;
      case 4:
        svld1_hor_za64(4, slice, svptrue_b64(), ptr);
        break;
      case 5:
        svld1_hor_za64(5, slice, svptrue_b64(), ptr);
        break;
      case 6:
        svld1_hor_za64(6, slice, svptrue_b64(), ptr);
        break;
      case 7:
        svld1_hor_za64(7, slice, svptrue_b64(), ptr);
        break;
    }
  }
}

// =============================================================================
// ZA MMA helpers: svmopa accumulates outer product into ZA tile
// =============================================================================

template <typename T, typename VEC_T>
__forceinline void za_mopa(int tile, VEC_T a, VEC_T b) __arm_streaming
#ifndef __arm_sim
    __arm_inout("za")
#endif
{
  if constexpr (std::is_same_v<T, float>) {
    switch (tile) {
      case 0:
        svmopa_za32_f32_m(0, svptrue_b32(), svptrue_b32(), a, b);
        break;
      case 1:
        svmopa_za32_f32_m(1, svptrue_b32(), svptrue_b32(), a, b);
        break;
      case 2:
        svmopa_za32_f32_m(2, svptrue_b32(), svptrue_b32(), a, b);
        break;
      case 3:
        svmopa_za32_f32_m(3, svptrue_b32(), svptrue_b32(), a, b);
        break;
    }
  } else if constexpr (std::is_same_v<T, double>) {
    switch (tile) {
      case 0:
        svmopa_za64_f64_m(0, svptrue_b64(), svptrue_b64(), a, b);
        break;
      case 1:
        svmopa_za64_f64_m(1, svptrue_b64(), svptrue_b64(), a, b);
        break;
      case 2:
        svmopa_za64_f64_m(2, svptrue_b64(), svptrue_b64(), a, b);
        break;
      case 3:
        svmopa_za64_f64_m(3, svptrue_b64(), svptrue_b64(), a, b);
        break;
      case 4:
        svmopa_za64_f64_m(4, svptrue_b64(), svptrue_b64(), a, b);
        break;
      case 5:
        svmopa_za64_f64_m(5, svptrue_b64(), svptrue_b64(), a, b);
        break;
      case 6:
        svmopa_za64_f64_m(6, svptrue_b64(), svptrue_b64(), a, b);
        break;
      case 7:
        svmopa_za64_f64_m(7, svptrue_b64(), svptrue_b64(), a, b);
        break;
    }
  }
}

// =============================================================================
// ZA read helper: read ZA slice directly to SVE register (no buffer!)
// =============================================================================

template <typename T>
__forceinline auto za_read_hor(int tile, int slice) __arm_streaming
#ifndef __arm_sim
    __arm_in("za")
#endif
{
  if constexpr (std::is_same_v<T, float>) {
    svfloat32_t zero = svdup_f32(0.0f);
    switch (tile) {
      case 0:
        return svread_hor_za32_f32_m(zero, svptrue_b32(), 0, slice);
      case 1:
        return svread_hor_za32_f32_m(zero, svptrue_b32(), 1, slice);
      case 2:
        return svread_hor_za32_f32_m(zero, svptrue_b32(), 2, slice);
      case 3:
        return svread_hor_za32_f32_m(zero, svptrue_b32(), 3, slice);
      default:
        return zero;
    }
  } else {
    svfloat64_t zero = svdup_f64(0.0);
    switch (tile) {
      case 0:
        return svread_hor_za64_f64_m(zero, svptrue_b64(), 0, slice);
      case 1:
        return svread_hor_za64_f64_m(zero, svptrue_b64(), 1, slice);
      case 2:
        return svread_hor_za64_f64_m(zero, svptrue_b64(), 2, slice);
      case 3:
        return svread_hor_za64_f64_m(zero, svptrue_b64(), 3, slice);
      case 4:
        return svread_hor_za64_f64_m(zero, svptrue_b64(), 4, slice);
      case 5:
        return svread_hor_za64_f64_m(zero, svptrue_b64(), 5, slice);
      case 6:
        return svread_hor_za64_f64_m(zero, svptrue_b64(), 6, slice);
      case 7:
        return svread_hor_za64_f64_m(zero, svptrue_b64(), 7, slice);
      default:
        return zero;
    }
  }
}
