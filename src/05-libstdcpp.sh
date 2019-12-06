#!/bin/bash

source commons.sh

checkme "$INSTALL_USER" || { echo "Invalid user expected $INSTALL_USER or INSTALL_USER not set" ; exit 1; }
checkVar $MAKEFLAGS ||  { echo "Please set MAKEFLAGS before using this script" ; exit 1; }
checkVar $INSTALL_LOC ||  { echo "Please set INSTALL_LOC before using this script" ; exit 1; }
checkVar $INSTALL_TGT ||  { echo "Please set INSTALL_TGT before using this script" ; exit 1; }

checkExist gcc  ||  { echo "gcc folder doesnt exist, we just used , can you look around?" ; exit 1; }

pushd gcc

rm -Rf build
mkdir -v build
cd build

../libstdc++-v3/configure \
 --host=$INSTALL_TGT \
 --prefix=/tools \
 --disable-multilib \
 --disable-nls \
 --disable-libstdcxx-threads \
 --disable-libstdcxx-pch \
 --with-gxx-include-dir=/tools/$INSTALL_TGT/include/c++/9.2.0 || { echo "can not configure project, please check logs installation aborted" ; exit 1; }

make clean
time make -s  || { echo "can not make project, please check logs installation aborted" ; exit 1; }

time make -s install  || { echo "can not install, please check logs installation aborted" ; exit 1; }

cd ../..

rm -Rf ./gcc
