#!/bin/bash

gsed -i "s:sysconfdir    = /etc:sysconfdir = $PREFIX/etc:g" Makefile
gsed -i "s:prefix        = /usr:prefix = $PREFIX:g" Makefile

make
make install

gsed -i "s:/etc/disco/:$PREFIX/etc/disco/:g" \
    $PREFIX/lib/python2.7/site-packages/disco/settings.py