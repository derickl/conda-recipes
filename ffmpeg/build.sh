#!/bin/bash

ls

mkdir -vp ${PREFIX}/bin;

export CFLAGS="-Wall -g -m64 -pipe -O2 -march=x86-64 -fPIC"
export CXXLAGS="${CFLAGS}"
export CPPFLAGS="-I${PREFIX}/include"
export LDFLAGS="-L${PREFIX}/lib"


chmod +x configure;

./configure \
    --enable-gpl \
    --enable-nonfree \
    --enable-shared \
    --enable-pic \
    --enable-libx264 \
    --enable-openssl \
    --disable-podpages \
    --prefix=$PREFIX
make 
make install