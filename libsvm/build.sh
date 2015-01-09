#!/bin/bash
export DYLD_LIBRARY_PATH=$PREFIX/lib

make
make lib


mkdir -p $PREFIX/bin
mkdir -p $PREFIX/lib
mkdir -p $PREFIX/include
mkdir -p $PREFIX/lib/python$PY_VER/site-packages

mv svm-scale $PREFIX/bin
mv svm-train $PREFIX/bin
mv svm-predict $PREFIX/bin

mv libsvm.so.2 libsvm.2.dylib
ln -s libsvm.2.dylib libsvm.dylib

mv libsvm.2.dylib $PREFIX/lib
mv libsvm.dylib $PREFIX/lib

install_name_tool -id $PREFIX/lib/libsvm.2.dylib $PREFIX/lib/libsvm.2.dylib

mv svm.h $PREFIX/include

mv python/svmutil.py $PREFIX/lib/python$PY_VER/site-packages
mv python/svm.py  $PREFIX/lib/python$PY_VER/site-packages