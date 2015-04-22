#!/bin/bash
rm graphreduce/relaxmap/ompRelaxmap

cp $RECIPE_DIR/ompRelaxmap graphreduce/graphreduce
$PYTHON setup.py install

