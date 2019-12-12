#!/bin/sh


source $(pwd)/../commons.sh

echo "checking user"

checkme "$INSTALL_USER" || { echo "Invalid user expected $INSTALL_USER or INSTALL_USER not set" ; exit 1; }
checkVar $MAKEFLAGS ||  { echo "Please set MAKEFLAGS before using this script" ; exit 1; }
checkVar $INSTALL_LOC ||  { echo "Please set INSTALL_LOC before using this script" ; exit 1; }
checkVar $INSTALL_TGT ||  { echo "Please set INSTALL_TGT before using this script" ; exit 1; }

checkExist binutils  ||  { echo "binutils folder doesnt exist, we just used , can you look around?" ; exit 1; }

pushd binutils

checkUpstream

rm -Rf build
mkdir -v build
cd build

CC=$INSTALL_TGT-gcc \
CFLAGS="-fPIC" \
AR=$INSTALL_TGT-ar \
RANLIB=$INSTALL_TGT-ranlib \
../configure \
 --prefix=/tools \
 --disable-nls \
 --disable-werror \
 --with-lib-path=/tools/lib \
 --with-sysroot || { echo "can not configure project, please check logs installation aborted" ; exit 1; }


make clean
time make -s > make.log || { echo "can not make project, please check logs installation aborted" ; exit 1; }
case $(uname -m) in
 x86_64) mkdir -v /tools/lib ; ln -sv lib /tools/lib64 ;;
esac
time make -s install > install.log || { echo "can not install, please check logs installation aborted" ; exit 1; }


make -C ld clean
make -C ld LIB_PATH=/usr/lib:/lib
cp -v ld/ld-new /tools/bin

popd
