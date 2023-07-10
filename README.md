Initially, this was discovered during a compile of
deal.II following instructions [here](https://github.com/frobnitzem/install_DFT-FE).
The only key prerequisite before compiling deal.II in this instance
is p4est.  The following fork of Deal.II is used:
```
git clone --recurse-submodules -b dealiiCustomizedCUDARelease \
        https://github.com/dftfeDevelopers/dealii.git
```
Note that it installs its own bundled version of boost.

The original compile line generated by the cray compiler wrapper
for llvm included the variables below:

    FLAGS="-march=native -D__CRAY_X86_TRENTO -D__CRAY_AMD_GFX90A -D__CRAYXT_COMPUTE_LINUX_TARGET -DBOOST_NO_AUTO_PTR -fPIC -std=c++14 -O2 -funroll-loops -std=g++14 -fstrict-aliasing"

    HDRS="-I/lustre/orion/stf006/world-shared/rogersdd/DFT-FE/src/dealii/build/source/grid -I/lustre/orion/stf006/world-shared/rogersdd/DFT-FE/src/dealii/build/include -I/lustre/orion/stf006/world-shared/rogersdd/DFT-FE/src/dealii/include -I/lustre/orion/stf006/world-shared/rogersdd/DFT-FE/src/dealii/bundled/boost-1.70.0/include -I/lustre/orion/stf006/world-shared/rogersdd/DFT-FE/src/dealii/bundled/umfpack/UMFPACK/Include -I/lustre/orion/stf006/world-shared/rogersdd/DFT-FE/src/dealii/bundled/umfpack/AMD/Include -I/lustre/orion/stf006/world-shared/rogersdd/DFT-FE/src/dealii/bundled/muparser_v2_2_4/include -isystem /lustre/orion/stf006/world-shared/rogersdd/DFT-FE/env3/include"

    DEPS="-MD -MT source/grid/CMakeFiles/obj_grid_release.dir/grid_generator.cc.o -MF CMakeFiles/obj_grid_release.dir/grid_generator.cc.o.d"
	
    END_ARGS="-I/opt/cray/pe/mpich/8.1.23/ofi/cray/10.0/include -I/opt/cray/pe/libsci/22.12.1.1/CRAY/9.0/x86_64/include -I/opt/cray/pe/dsmml/0.2.2/dsmml//include -I/opt/cray/pe/pmi/6.1.8/include -I/opt/cray/xpmem/2.5.2-2.4_3.45__gd0f7936.shasta/include"

However, I have shortened these and moved the necessary headers into
an 'inc' directory to make a self-contained bug reproducer.
