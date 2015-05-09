#!/bin/bash

ls

mkdir -vp ${PREFIX}/bin;

export CFLAGS="-Wall -g -m64 -pipe -O2 -march=x86-64 -fPIC"
export CXXLAGS="${CFLAGS}"
export CPPFLAGS="-I${PREFIX}/include"
export LDFLAGS="-L${PREFIX}/lib"


chmod +x configure;

<<<<<<< HEAD
./configure \
    --enable-gpl \
    --enable-nonfree \
    --enable-shared \
    --enable-pic \
    --enable-libx264 \
    --enable-openssl \
    --disable-podpages \
    --prefix=$PREFIX
make 
make install
=======
DarwinInstallation() {

    chmod +x configure;

    ./configure \
        --enable-gpl \
        --enable-nonfree \
        --enable-shared \
        --enable-pic \
        --enable-libx264 \
        --enable-openssl \
        --disable-podpages \
        --prefix=${PREFIX} || return 1;
    make || return 1;
    make install || return 1;

    return 0;
}

case ${ARCH} in
    'Linux')
        LinuxInstallation || exit 1;
        ;;
    'Darwin')
        DarwinInstallation || exit 1;
	;;
    *)
        echo -e "Unsupported machine type: ${ARCH}";
        exit 1;
        ;;
esac
>>>>>>> 9e53383c97afa9454bf4ae59cf7891224e8bdfca
