#!/bin/bash

mkdir -vp ${PREFIX}/bin;

if [[ $ARCH = 64 ]]; then
    export CFLAGS="-Wall -g -m64 -pipe -O2 -march=x86-64 -fPIC"
else
    export CFLAGS="-Wall -g -m32 -pipe -O2 -march=i386 -fPIC"
fi
export CXXLAGS="${CFLAGS}"

chmod +x configure
./configure --prefix=$PREFIX \
            --enable-shared \
            --enable-static \
            --enable-strip
make
make install