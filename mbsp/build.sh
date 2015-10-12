#!/bin/bash
shopt -s extglob


TARGET=$PREFIX/lib/python$PY_VER/site-packages/MBSP
mkdir -p $TARGET

TOP_DIR=`pwd`/MBSP

cd $TOP_DIR/mbt
rm !(Mbt)

cd $TOP_DIR/mblem
rm !(mblem_english_bmt)

cd $TOP_DIR/timbl

rm !(Timbl)

cd $TOP_DIR

cp -R * $TARGET

# Add more build steps here, if they are necessary.

# See
# http://docs.continuum.io/conda/build.html
# for a list of environment variables that are set during the build process.
