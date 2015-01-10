#!/bin/bash

mkdir -vp ${PREFIX}/bin;
chmod +x configure
./configure --prefix=$PREFIX \
            --enable-shared \
            --enable-static \
            --enable-strip
make
make install