#!/bin/bash
make
make lib


mkdir -p $PREFIX/bin
mkdir -p $PREFIX/lib
mkdir -p $PREFIX/include
mkdir -p $PREFIX/lib/python$PY_VER/site-packages

mv predict $PREFIX/bin
mv train $PREFIX/bin

ln -s liblinear.dylib liblinear.1.dylib

mv liblinear.1.dylib $PREFIX/lib
mv liblinear.dylib $PREFIX/lib


mv linear.h $PREFIX/include

mv python/liblinearutil.py $PREFIX/lib/python$PY_VER/site-packages
mv python/liblinear.py  $PREFIX/lib/python$PY_VER/site-packages