gsed -i 's/^\s*QWT_INSTALL_PREFIX\s*=\(.*\)$/QWT_INSTALL_PREFIX=$PREFIX/' qwtconfig.pri
gsed -i 's/^\s*QWT_CONFIG\s*\+=\s*QwtDesigner$//' qwtconfig.pri

touch $PREFIX/bin/qt.conf
echo '[Paths]' >> $PREFIX/bin/qt.conf
echo 'Prefix = ../' >> $PREFIX/bin/qt.conf


cp -R $PREFIX/mkspecs $PREFIX/bin


qmake -query

#export QMAKESPEC=$PREFIX/mkspecs/unsupported/macx-clang-libc++


qmake -config release -spec macx-g++

make
make install

