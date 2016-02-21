#!/bin/bash

export LDFLAGS="-Wall -undefined dynamic_lookup -bundle -arch x86_64"

$PYTHON setup.py build
$PYTHON setup.py install
