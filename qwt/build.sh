ls $PREFIX/mkspecs

gsed -i 's/^\s*QWT_INSTALL_PREFIX\s*=\(.*\)$/QWT_INSTALL_PREFIX=$PREFIX/' qwtconfig.pri
gsed -i 's/^\s*QWT_CONFIG\s*\+=\s*QwtDesigner$//' qwtconfig.pri

export QMAKESPEC=$PREFIX/mkspecs/macx-g++
qmake -set QT_INSTALL_PREFIX $PREFIX


qmake -set QT_INSTALL_PREFIX $PREFIX
qmake -set QT_INSTALL_DATA $PREFIX
qmake -set QT_INSTALL_DOCS $PREFIX/doc
qmake -set QT_INSTALL_HEADERS $PREFIX/include/Qt
qmake -set QT_INSTALL_LIBS $PREFIX/lib
qmake -set QT_INSTALL_BINS $PREFIX/bin
qmake -set QT_INSTALL_PLUGINS $PREFIX/plugins
qmake -set QT_INSTALL_IMPORTS $PREFIX/imports
qmake -set QT_INSTALL_TRANSLATIONS $PREFIX/translations


qmake -config release
make
make install
