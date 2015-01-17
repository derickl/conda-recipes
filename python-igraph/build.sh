#!/bin/bash
$PYTHON setup.py build
cp $PREFIX/lib/libigraph.0.dylib build/lib*/igraph/
install_name_tool -change libigraph.0.dylib @loader_path/libigraph.0.dylib build/lib*/igraph/_igraph.so
$PYTHON setup.py install


# Add more build steps here, if they are necessary.

# See
# http://docs.continuum.io/conda/build.html
# for a list of environment variables that are set during the build process.
