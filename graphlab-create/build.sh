#!/bin/bash

$PREFIX/bin/pip install $SRC_DIR/GraphLab_Create-1.5.2-cp27-none-macosx_10_5_x86_64.macosx_10_6_intel.macosx_10_9_intel.macosx_10_9_x86_64.macosx_10_10_intel.macosx_10_10_x86_64.whl

#rm -rf grahlab/linux

#$PYTHON setup.py install

# Add more build steps here, if they are necessary.

#for file in $PREFIX/lib/python$PY_VER/site-packages/graphlab/cython/cy*.so
#do
#  install_name_tool -change @rpath/libbase_dep.so @loader_path/libbase_dep.so $file
#done

#rm -rf $PREFIX/lib/python$PY_VER/site-packages/graphlab/osx
#rm -rf $PREFIX/lib/python$PY_VER/site-packages/graphlab/linux


# See
# http://docs.continuum.io/conda/build.html
# for a list of environment variables that are set during the build process.
