#!/bin/bash

source ../commons.sh

checkme "$INSTALL_USER" || { echo "Invalid user expected $INSTALL_USER or INSTALL_USER not set" ; exit 1; }
checkVar $MAKEFLAGS ||  { echo "Please set MAKEFLAGS before using this script" ; exit 1; }
checkVar $INSTALL_LOC ||  { echo "Please set INSTALL_LOC before using this script" ; exit 1; }
checkVar $INSTALL_TGT ||  { echo "Please set INSTALL_TGT before using this script" ; exit 1; }

git clone https://github.com/qunixorg/gcc.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }

cd gcc
checkUpstream

for file in gcc/config/{linux,i386/linux{,64}}.h
do
 cp -uv $file{,.orig}
 sed -e 's@/lib\(64\)\?\(32\)\?/ld@/tools&@g' \
 -e 's@/usr@/tools@g' $file.orig > $file
 echo '
#undef STANDARD_STARTFILE_PREFIX_1
#undef STANDARD_STARTFILE_PREFIX_2
#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"
#define STANDARD_STARTFILE_PREFIX_2 ""' >> $file
 touch $file.orig
done


case $(uname -m) in
 x86_64)
 sed -e '/m64=/s/lib64/lib/' \
 -i.orig gcc/config/i386/t-linux64
 ;;
esac

git clone https://github.com/qunixorg/gmp.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }

pushd gmp
checkUpstream
popd


git clone https://github.com/qunixorg/mpc.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }

pushd mpc 
checkUpstream
popd


git clone https://github.com/qunixorg/mpfr.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }

pushd mpfr
checkUpstream
popd




mkdir -v build
cd build

GCLIB_VERSION=$(ldd --version | grep ldd | rev | cut -f 1 -d ' ' | rev)
../configure \
 --target=$INSTALL_TGT \
 --prefix=/tools \
 --with-glibc-version=$GCLIB_VERSION \
 --with-sysroot=$INSTALL_LOC \
 --with-newlib \
 --without-headers \
 --with-local-prefix=/tools \
 --with-native-system-header-dir=/tools/include \
 --disable-nls \
 --disable-shared \
 --disable-multilib \
 --disable-decimal-float \
 --disable-threads \
 --disable-libatomic \
 --disable-libgomp \
 --disable-libquadmath \
 --disable-libssp \
 --disable-libvtv \
 --disable-libstdcxx \
 --enable-languages=c,c++ || { echo "can not configure project, please check logs installation aborted" ; exit 1; }

make clean
time make -s > make.log || { echo "can not make project, please check logs installation aborted" ; exit 1; }

time make -s install  > install.log || { echo "can not install, please check logs installation aborted" ; exit 1; }

cd ../..
