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
    --enable-darwin-64bit \
    --disable-wx \
    --enable-native-libs \
    --disable-debug \
    --disable-silent-rules \
    --disable-hipe
    
make
make install
