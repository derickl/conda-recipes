#!/bin/bash

$PYTHON setup.py install

# Add more build steps here, if they are necessary.

for file in $PREFIX/lib/python$PY_VER/site-packages/graphlab/cython/cy*.so
do
  install_name_tool -change @rpath/libbase_dep.so @loader_path/libbase_dep.so $file
done
# See
# http://docs.continuum.io/conda/build.html
# for a list of environment variables that are set during the build process.
