#!/bin/bash
ORIG_PATH=/System/Library/Frameworks/Python.framework/Versions/2.7/Python
NEW_PATH=$PREFIX/lib/libpython$PY_VER.dylib

install_name_tool -change $ORIG_PATH $NEW_PATH _snap.so

${PYTHON} setup.py install || exit 1;

