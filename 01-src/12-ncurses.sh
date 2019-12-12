#!/bin/sh


source $(pwd)/../commons.sh

echo "checking user"

checkme "$INSTALL_USER" || { echo "Invalid user expected $INSTALL_USER or INSTALL_USER not set" ; exit 1; }
checkVar $MAKEFLAGS ||  { echo "Please set MAKEFLAGS before using this script" ; exit 1; }
checkVar $INSTALL_LOC ||  { echo "Please set INSTALL_LOC before using this script" ; exit 1; }
checkVar $INSTALL_TGT ||  { echo "Please set INSTALL_TGT before using this script" ; exit 1; }

echo "cloning repo"
git clone https://github.com/qunixorg/ncurses.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }

pushd ncurses 

git checkout qunix-v0.0.1

sed -i s/mawk// configure

./configure --prefix=/tools \
 --with-shared \
 --without-debug \
 --without-ada \
 --enable-widec \
 --enable-overwrite

make clean
time make -s > make.log || { echo "can not make project, please check logs installation aborted" ; exit 1; }
time make -s install > install.log || { echo "can not install, please check logs installation aborted" ; exit 1; }

ln -s libncursesw.so /tools/lib/libncurses.so
popd
