#!/bin/bash

./configure --prefix=$PREFIX \
            --disable-demos \
            --enable-double-precision \
            --enable-libccd
make
make install
