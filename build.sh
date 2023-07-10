#g++ # 7.5.0, succeeds
#/opt/rocm-5.4.0/llvm/bin/clang++ # amd-clang 15, fails
# /sw/frontier/spack-envs/base/opt/linux-sles15-x86_64/gcc-7.5.0/llvm-12.0.1-izizukzg4567koqlyog5ln3xwvquuyhm/bin/clang++  # llvm-clang 12, fails

clang++ \
	-Iinc -Iinc/mpi -Iinc/dealii -Iinc/boost-1.70.0/include \
	-std=c++14 -o tmp.o -c grid_generator.cc

#
# % bash build.sh
# PLEASE submit a bug report to https://bugs.llvm.org/ and include the crash backtrace, preprocessed source, and associated run script.
# Stack dump:
# 0.	Program arguments: /sw/frontier/spack-envs/base/opt/linux-sles15-x86_64/gcc-7.5.0/llvm-12.0.1-izizukzg4567koqlyog5ln3xwvquuyhm/bin/clang++ -Iinc -Iinc/mpi -Iinc/dealii -Iinc/boost-1.70.0/include -std=c++14 -o tmp.o -c grid_generator.cc
# 1.	grid_generator.cc:6106:3: current parser token 'template'
# 2.	grid_generator.cc:36:1 <Spelling=inc/dealii/deal.II/base/config.h:73:32>: parsing namespace 'dealii'
# 3.	grid_generator.cc:42:1: parsing namespace 'dealii::build.sh: line 18: 127546 Segmentation fault      /sw/frontier/spack-envs/base/opt/linux-sles15-x86_64/gcc-7.5.0/llvm-12.0.1-izizukzg4567koqlyog5ln3xwvquuyhm/bin/clang++ -Iinc -Iinc/mpi -Iinc/dealii -Iinc/boost-1.70.0/include -std=c++14 -o tmp.o -c grid_generator.cc
#
