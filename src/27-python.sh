#!/bin/sh


source $(pwd)/commons.sh

echo "checking user"

checkme "$INSTALL_USER" || { echo "Invalid user expected $INSTALL_USER or INSTALL_USER not set" ; exit 1; }
checkVar $MAKEFLAGS ||  { echo "Please set MAKEFLAGS before using this script" ; exit 1; }
checkVar $INSTALL_LOC ||  { echo "Please set INSTALL_LOC before using this script" ; exit 1; }
checkVar $INSTALL_TGT ||  { echo "Please set INSTALL_TGT before using this script" ; exit 1; }

export GNULIB_SRCDIR=$(pwd)/gnulib

echo "cloning repo"
git clone https://github.com/qunixorg/cpython.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }

pushd cpython

checkUpstream

sed -i '/def add_multiarch_paths/a \ \ \ \ \ \ \ \ return' setup.py

./configure --prefix=/tools --without-ensurepip

time make -s > make.log || { echo "can not make project, please check logs installation aborted" ; exit 1; }

time make -s install > install.log || { echo "can not install, please check logs installation aborted" ; exit 1; }

popd
