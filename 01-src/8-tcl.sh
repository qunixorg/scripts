#!/bin/sh


source $(pwd)/../commons.sh
checkVar $QUNIX_VERSION || { echo "Please set QUNIX_VERSION" ; exit 1 ; }

echo "checking user"

checkme "$INSTALL_USER" || { echo "Invalid user expected $INSTALL_USER or INSTALL_USER not set" ; exit 1; }
checkVar $MAKEFLAGS ||  { echo "Please set MAKEFLAGS before using this script" ; exit 1; }
checkVar $INSTALL_LOC ||  { echo "Please set INSTALL_LOC before using this script" ; exit 1; }
checkVar $INSTALL_TGT ||  { echo "Please set INSTALL_TGT before using this script" ; exit 1; }

echo "cloning repo"
git clone https://github.com/qunixorg/tcl.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }

cd tcl 

git checkout qunix-v0.0.1

cd unix
./configure --prefix=/tools

make clean
time make -s > make.log || { echo "can not make project, please check logs installation aborted" ; exit 1; }
time make -s install > install.log || { echo "can not install, please check logs installation aborted" ; exit 1; }
chmod -v u+w /tools/lib/libtcl*.so
make install-private-headers || { echo "can not install, please check logs installation aborted" ; exit 1; }
ln -sv /tools/bin/tclsh* /tools/bin/tclsh
cd ../..
