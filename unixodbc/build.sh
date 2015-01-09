#!/bin/bash

./configure \
    --prefix=$PREFIX \
    --disable-debug \
    --disable-dependency-tracking \
    --enable-gui=no
   
make install
