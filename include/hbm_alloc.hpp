#pragma once
// HBM Memory Allocation Helper
// Uses HBW (High Bandwidth Memory) when USE_HBM is defined
// Falls back to standard new/delete otherwise

#include <cstdlib>
#include <cstring>

#ifdef USE_HBM
#include <hbwmalloc.h>
#endif

// Initialize HBM policy (call once at program start)
inline void hbm_init() {
#ifdef USE_HBM
  hbw_set_policy(HBW_POLICY_BIND);
#endif
}

// Allocate memory from HBM (or heap if USE_HBM not defined)
template <typename T>
inline T* hbm_alloc(size_t count) {
#ifdef USE_HBM
  return static_cast<T*>(hbw_malloc(sizeof(T) * count));
#else
  return new T[count];
#endif
}

// Allocate and zero-initialize memory from HBM
template <typename T>
inline T* hbm_calloc(size_t count) {
#ifdef USE_HBM
  T* ptr = static_cast<T*>(hbw_malloc(sizeof(T) * count));
  if (ptr) std::memset(ptr, 0, sizeof(T) * count);
  return ptr;
#else
  return new T[count]();
#endif
}

// Free HBM memory
template <typename T>
inline void hbm_free(T* ptr) {
#ifdef USE_HBM
  hbw_free(ptr);
#else
  delete[] ptr;
#endif
}
