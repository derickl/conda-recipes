gsed -i "s|^\s*QWT_INSTALL_PREFIX\s*=\(.*\)$|QWT_INSTALL_PREFIX=$PREFIX|" qwtconfig.pri
gsed -i 's/^\s*QWT_CONFIG\s*\+=\s*QwtDesigner$//' qwtconfig.pri

touch $PREFIX/bin/qt.conf
echo '[Paths]' >> $PREFIX/bin/qt.conf
echo 'Prefix = ../' >> $PREFIX/bin/qt.conf


cp -R $PREFIX/mkspecs $PREFIX/bin

qmake -config release -spec unsupported/macx-clang-libc++

make
make install

