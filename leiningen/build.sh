#!/bin/bash

mkdir -p $PREFIX/bin
curl -o $PREFIX/bin/lein 'https://raw.githubusercontent.com/technomancy/leiningen/2.5.1/bin/lein'
chmod a+x $PREFIX/bin/lein
$PREFIX/bin/lein