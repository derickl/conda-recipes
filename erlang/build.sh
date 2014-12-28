#!/bin/bash

./configure \
    --with-ssl=$PREFIX \
    --prefix=$PREFIX \
    --enable-kernel-poll \
    --enable-threads \
    --enable-sctp \
    --enable-dynamic-ssl-lib \
    --enable-shared-zlib \
    --enable-smp-support \
    --enable-darwin-64bit
    
make
make install
