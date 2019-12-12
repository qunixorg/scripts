#!/bin/bash

source ../commons.sh
checkVar $QUNIX_VERSION || { echo "Please set QUNIX_VERSION" ; exit 1 ; }

checkme "$INSTALL_USER" || { echo "Invalid user expected $INSTALL_USER or INSTALL_USER not set" ; exit 1; }
checkVar $MAKEFLAGS ||  { echo "Please set MAKEFLAGS before using this script" ; exit 1; }
checkVar $INSTALL_LOC ||  { echo "Please set INSTALL_LOC before using this script" ; exit 1; }
checkVar $INSTALL_TGT ||  { echo "Please set INSTALL_TGT before using this script" ; exit 1; }

checkExist gcc  ||  { echo "gcc folder doesnt exist, we just used , can you look around?" ; exit 1; }

pushd gcc


cat gcc/limitx.h gcc/glimits.h gcc/limity.h > \
 `dirname $($INSTALL_TGT-gcc -print-libgcc-file-name)`/include-fixed/limits.h

rm -Rf build
mkdir -v build
cd build

CC=$INSTALL_TGT-gcc \
CXX=$INSTALL_TGT-g++ \
AR=$INSTALL_TGT-ar \
RANLIB=$INSTALL_TGT-ranlib \
../configure \
 --prefix=/tools \
 --with-local-prefix=/tools \
 --with-native-system-header-dir=/tools/include \
 --enable-languages=c,c++ \
 --disable-libstdcxx-pch \
 --disable-multilib \
 --disable-bootstrap \
 --disable-libgomp

make clean
time make -s > make.log || { echo "can not make project, please check logs installation aborted" ; exit 1; }

time make -s install > install.log || { echo "can not install, please check logs installation aborted" ; exit 1; }

ln -sv gcc /tools/bin/cc

popd
