#!/bin/bash
$PYTHON configure.py
$PYTHON setup.py build
make
$PYTHON setup.py install
