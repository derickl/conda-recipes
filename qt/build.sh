#!/bin/bash

if [ `uname` == Linux ]; then
    chmod +x configure

    if [ $ARCH == 64 ]; then
        MARCH=x86-64
    else
        MARCH=i686
    fi

    # Building QtWebKit on CentOS 5 fails without setting these flags
    # explicitly. This is caused by using an old gcc version
    # See https://bugs.webkit.org/show_bug.cgi?id=25836#c5
    CFLAGS="-march=${MARCH}" CXXFLAGS="-march=${MARCH}" \
    CPPFLAGS="-march=${MARCH}" LDFLAGS="-march=${MARCH}" \
    ./configure \
        -release -fast -no-qt3support \
        -nomake examples -nomake demos -nomake docs \
        -webkit -qt-libpng -qt-zlib -gtkstyle -dbus -openssl \
        -L $LIBRARY_PATH -I $INCLUDE_PATH -prefix $PREFIX

    # Build on RPM based distros fails without setting LD_LIBRARY_PATH
    # to the build lib dir
    # See https://bugreports.qt.io/browse/QTBUG-5385
    LD_LIBRARY_PATH=$SRC_DIR/lib make -j $CPU_COUNT
    
    make install

    cp $SRC_DIR/bin/* $PREFIX/bin/
    cd $PREFIX
    rm -rf doc imports mkspecs phrasebooks q3porting.xml translations
    rm -rf demos examples tests
    cd $PREFIX/bin
    rm -f *.bat *.pl qt3to4 qdoc3
fi

if [ `uname` == Darwin ]; then
    # Leave Qt set its own flags and vars, else compilation errors
    # will occur
    for x in OSX_ARCH CFLAGS CXXFLAGS LDFLAGS
    do
	unset $x
    done

    chmod +x configure
    ./configure \
        -platform macx-g++ -release -prefix $PREFIX \
        -no-qt3support -nomake examples -nomake demos -nomake docs \
        -opensource -no-framework -fast -verbose -openssl \
        -L $LIBRARY_PATH -I $INCLUDE_PATH -arch `uname -m`

    make -j $(sysctl -n hw.ncpu)
    make install

    # cd $PREFIX
    # for fn in lconvert lrelease lupdate macdeployqt moc qmake rcc uic
    # do
    #     cp /usr/bin/$fn $PREFIX/bin
    # done
    #
    # for x in QtCore QtDBus QtDeclarative QtGui QtMultimedia QtNetwork \
    #     QtOpenGL QtScript QtSql QtSvg QtWebKit QtXml QtXmlPatterns phonon
    # do
    #     cd $PREFIX/include
    #     cp -r /Library/Frameworks/$x.framework/Versions/4/Headers $x
    #
    #     cd $PREFIX/lib
    #     fn=lib$x.4.8.5.dylib
    #     cp /Library/Frameworks/$x.framework/Versions/4/$x $fn
    #     chmod +x $fn
    #     ln -s $fn lib$x.4.8.dylib
    #     ln -s $fn lib$x.4.dylib
    #     ln -s $fn lib$x.dylib
    # done
fi
