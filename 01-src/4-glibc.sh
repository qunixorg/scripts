#!/bin/bash
source ../commons.sh
checkVar $QUNIX_VERSION || { echo "Please set QUNIX_VERSION" ; exit 1 ; }

checkme "$INSTALL_USER" || { echo "Invalid user expected $INSTALL_USER or INSTALL_USER not set" ; exit 1; }
checkVar $MAKEFLAGS ||  { echo "Please set MAKEFLAGS before using this script" ; exit 1; }
checkVar $INSTALL_LOC ||  { echo "Please set INSTALL_LOC before using this script" ; exit 1; }
checkVar $INSTALL_TGT ||  { echo "Please set INSTALL_TGT before using this script" ; exit 1; }

git clone https://github.com/qunixorg/glibc.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }

pushd glibc
checkUpstream

mkdir -v build
cd build

../configure \
 --prefix=/tools \
 --host=$INSTALL_TGT \
 --build=$(../scripts/config.guess) \
 --enable-kernel=3.2 \
 --with-headers=/tools/include || { echo "can not configure project, please check logs installation aborted" ; exit 1; }


make clean
time make -s > make.log || { echo "can not make project, please check logs installation aborted" ; exit 1; }

time make -s install > install.log || { echo "can not install, please check logs installation aborted" ; exit 1; }

popd
