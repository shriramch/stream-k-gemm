HBMROOT = /home/share/shenchao_common/memory

# Force Clang for SME support
CXX = clang++

# Compiler Flags
CXXFLAGS = -O3 -g -std=c++17 -fopenmp 
CXXFLAGS += -Wall -Wextra -Wpedantic -Wno-c99-extensions

# Mandatory ARM SME Flags
CXXFLAGS += -march=armv9.2-a+sve+sme+sme-f64f64+fa64 -mcpu=native -DSKIP_VERIFY

# Preprocessor & Include Flags
CPPFLAGS = -Iinclude/
CPPFLAGS += -DUSE_OPENMP
CPPFLAGS += -I${HBMROOT}/include -DUSE_HBM

# Linker Flags & Libraries
LDFLAGS = --rtlib=compiler-rt
LDLIBS = -lm -lmemkind -lhwloc -lnuma -L${HBMROOT}/lib -lunwind -latomic

# Targets
TARGETS = gemm_cr gemm_crb gemm_crbp gemm_crg gemm_crgp gemm_crs gemm_crsp

all: $(TARGETS)

# Generic rule: compile each variant directly from its respective .cpp file
%: %.cpp
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) $< -o $@ $(LDFLAGS) $(LDLIBS)

.PHONY: clean
clean:
	rm -f $(TARGETS)