#!/bin/bash

export CFLAGS="-I$PREFIX/include -L$PREFIX/lib"

./configure --prefix=$PREFIX --disable-dependency-tracking
make
make install