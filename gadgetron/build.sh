#!/bin/bash

mkdir build
cd build

if [ `uname` == Darwin ]; then
    cmake \
	-DCMAKE_OSX_DEPLOYMENT_TARGET=10.8                                      \
	-DCMAKE_CXX_FLAGS="-mmacosx-version-min=10.8 -std=c++11 -stdlib=libc++" \
	-DCMAKE_SHARED_LINKER_FLAGS="-mmacosx-version-min=10.8 -stdlib=libc++"  \
	-DPYTHON_EXECUTABLE="${PREFIX}/bin/python"                              \
	-DPYTHON_INCLUDE_DIR="${PREFIX}/include/python2.7"                      \
	-DPYTHON_LIBRARY="${PREFIX}/lib/libpython2.7.dylib"                     \
    	-DCMAKE_INSTALL_PREFIX="${PREFIX}" ..
fi

if [ `uname` == Linux ]; then
    cmake \
	-DPYTHON_EXECUTABLE="$PREFIX/bin/python"         \
	-DPYTHON_INCLUDE_DIR="$PREFIX/include/python2.7" \
	-DPYTHON_LIBRARY="$PREFIX/lib/libpython2.7.so"   \
    	-DCMAKE_INSTALL_PREFIX="${PREFIX}" ..
fi

make -j${CPU_COUNT}
make install

