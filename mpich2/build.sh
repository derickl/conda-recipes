#!/bin/bash
./configure --prefix=$PREFIX \
            --disable-dependency-tracking \
            --disable-silent-rules \
            --mandir=$PREFIX/man \
            --disable-fortran
make
make testing
make install
