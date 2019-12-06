#!/bin/sh


source $(pwd)/commons.sh

echo "checking user"

checkme "$INSTALL_USER" || { echo "Invalid user expected $INSTALL_USER or INSTALL_USER not set" ; exit 1; }
checkVar $MAKEFLAGS ||  { echo "Please set MAKEFLAGS before using this script" ; exit 1; }
checkVar $INSTALL_LOC ||  { echo "Please set INSTALL_LOC before using this script" ; exit 1; }
checkVar $INSTALL_TGT ||  { echo "Please set INSTALL_TGT before using this script" ; exit 1; }

echo "cloning repo"
git clone https://github.com/qunixorg/binutils.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }

cd binutils

checkUpstream

mkdir -v build
cd build
../configure --prefix=/tools \
 --with-sysroot=$INSTALL_LOC \
 --with-lib-path=/tools/lib \
 --target=$INSTALL_TGT \
 --disable-nls \
 --disable-werror || { echo "can not configure project, please check logs installation aborted" ; exit 1; }

make clean
time make -s || { echo "can not make project, please check logs installation aborted" ; exit 1; }
case $(uname -m) in
 x86_64) mkdir -v /tools/lib ; ln -sv lib /tools/lib64 ;;
esac
time make -s install || { echo "can not install, please check logs installation aborted" ; exit 1; }
cd ../..
rm -Rf ./binutils
