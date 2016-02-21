#!/bin/bash
export CFLAGS="-I$PREFIX/include $CFLAGS" 
export LDFLAGS="-L$PREFIX/lib $LDFLAGS"

git init && git add master/rebar && git commit -a -m 'dummy commit'

gsed -i "s:sysconfdir    = /etc:sysconfdir = $PREFIX/etc:g" Makefile
gsed -i "s:prefix        = /usr:prefix = $PREFIX:g" Makefile

make
make install
gsed -i "s:/etc/disco/:$PREFIX/etc/disco/:g" \
    $PREFIX/lib/python2.7/site-packages/disco/settings.py
    
mkdir -p $PREFIX/libexec/bin
gsed -i "s:/usr/bin/env python:$PREFIX/bin/python:g" $PREFIX/bin/disco
gsed -i "s:/usr/bin/env python:$PREFIX/bin/python:g" $PREFIX/bin/ddfs


mv $PREFIX/bin/disco $PREFIX/libexec/bin
mv $PREFIX/bin/ddfs $PREFIX/libexec/bin

touch $PREFIX/bin/disco 
chmod +x $PREFIX/bin/disco 
touch $PREFIX/bin/ddfs
chmod +x $PREFIX/bin/ddfs

echo "#!/bin/bash" >> $PREFIX/bin/disco
echo "#!/bin/bash" >> $PREFIX/bin/ddfs


echo "PYTHONPATH=\"$PREFIX/lib/python$PY_VER/site-packages\" exec \"$PREFIX/libexec/bin/disco\" \"\$@\"" >> $PREFIX/bin/disco
echo "PYTHONPATH=\"$PREFIX/lib/python$PY_VER/site-packages\" exec \"$PREFIX/libexec/bin/ddfs\" \"\$@\"" >> $PREFIX/bin/ddfs

cd contrib/discodb
git clone https://github.com/discoproject/discodb.git .
gsed -i "s:prefix        = /usr/local:prefix = $PREFIX:g" Makefile

cd python
$PYTHON setup.py install