#!/bin/bash

./configure --prefix=$PREFIX \
            --disable-debug \
            --disable-dependency-tracking
make
make install