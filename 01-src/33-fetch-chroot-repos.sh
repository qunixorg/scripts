#!/bin/sh


source $(pwd)/../commons.sh
checkVar $QUNIX_VERSION || { echo "Please set QUNIX_VERSION" ; exit 1 ; }

echo "checking user"

checkme "$INSTALL_USER" || { echo "Invalid user expected $INSTALL_USER or INSTALL_USER not set" ; exit 1; }
checkVar $MAKEFLAGS ||  { echo "Please set MAKEFLAGS before using this script" ; exit 1; }
checkVar $INSTALL_LOC ||  { echo "Please set INSTALL_LOC before using this script" ; exit 1; }
checkVar $INSTALL_TGT ||  { echo "Please set INSTALL_TGT before using this script" ; exit 1; }


echo "cloning man-pages"
git clone https://github.com/qunixorg/man-pages.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd man-pages
checkUpstream
popd


echo "cloning zlib"
git clone https://github.com/qunixorg/zlib.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd zlib
checkUpstream
popd


echo "cloning readline"
git clone https://github.com/qunixorg/readline.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd readline
checkUpstream
popd

echo "cloning bc"
git clone https://github.com/qunixorg/bc.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd bc
checkUpstream
popd


echo "cloning gmp"
git clone https://github.com/qunixorg/gmp.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd gmp
checkUpstream
popd

echo "cloning mpfr"
git clone https://github.com/qunixorg/mpfr.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd mpfr
checkUpstream
popd

echo "cloning mpc"
git clone https://github.com/qunixorg/mpc.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd mpc
checkUpstream
popd

echo "cloning shadow"
git clone https://github.com/qunixorg/shadow.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd shadow
checkUpstream
popd

echo "cloning pkg-config"
git clone https://github.com/qunixorg/pkg-config.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd pkg-config
checkUpstream
popd

echo "cloning attr"
git clone https://github.com/qunixorg/attr.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd attr
checkUpstream
popd

echo "cloning acl"
git clone https://github.com/qunixorg/acl.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd acl
checkUpstream
popd

echo "cloning libcap"
git clone https://github.com/qunixorg/libcap.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd libcap
checkUpstream
popd

echo "cloning psmisc"
git clone https://github.com/qunixorg/psmisc.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd psmisc
checkUpstream
popd

echo "cloning iana-etc"
git clone https://github.com/qunixorg/iana-etc.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd iana-etc
checkUpstream
popd

echo "cloning flex"
git clone https://github.com/qunixorg/flex.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd flex
checkUpstream
popd

echo "cloning libtool"
git clone https://github.com/qunixorg/libtool.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd libtool
checkUpstream
popd

echo "cloning gdbm"
git clone https://github.com/qunixorg/gdbm.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd gdbm
checkUpstream
popd

echo "cloning gperf"
git clone https://github.com/qunixorg/gperf.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd gperf
checkUpstream
popd

echo "cloning expat"
git clone https://github.com/qunixorg/expat.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd expat
checkUpstream
popd

echo "cloning inetutils"
git clone https://github.com/qunixorg/inetutils.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd inetutils
checkUpstream
popd

echo "cloning xml-parser"
git clone https://github.com/qunixorg/xml-parser.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd xml-parser
checkUpstream
popd


echo "cloning intltool"
git clone https://github.com/qunixorg/intltool.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd intltool
checkUpstream
popd

echo "cloning autoconf"
git clone https://github.com/qunixorg/autoconf.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd autoconf
checkUpstream
popd

echo "cloning automake"
git clone https://github.com/qunixorg/automake.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd automake
checkUpstream
popd

echo "cloning kmod"
git clone https://github.com/qunixorg/kmod.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd kmod
checkUpstream
popd

echo "cloning elfutils"
git clone https://github.com/qunixorg/elfutils.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd elfutils
checkUpstream
popd

echo "cloning libffi"
git clone https://github.com/qunixorg/libffi.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd libffi
checkUpstream
popd

echo "cloning openssl"
git clone https://github.com/qunixorg/openssl.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd openssl
checkUpstream
popd

echo "cloning ninja"
git clone https://github.com/qunixorg/ninja.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd ninja
checkUpstream
popd

echo "cloning meson"
git clone https://github.com/qunixorg/meson.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd meson
checkUpstream
popd

echo "cloning check"
git clone https://github.com/qunixorg/check.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd check
checkUpstream
popd

echo "cloning groff"
git clone https://github.com/qunixorg/groff.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd groff
checkUpstream
popd

echo "cloning grub"
git clone https://github.com/qunixorg/grub.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd grub
checkUpstream
popd

echo "cloning less"
git clone https://github.com/qunixorg/less.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd less
checkUpstream
popd

echo "cloning iproute2"
git clone https://github.com/qunixorg/iproute2.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd iproute2
checkUpstream
popd

echo "cloning kbd"
git clone https://github.com/qunixorg/kbd.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd kbd
checkUpstream
popd

echo "cloning libpipeline"
git clone https://github.com/qunixorg/libpipeline.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd libpipeline
checkUpstream
popd

echo "cloning man-db"
git clone https://github.com/qunixorg/man-db.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd man-db
checkUpstream
popd

echo "cloning vim"
git clone https://github.com/qunixorg/vim.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd vim
checkUpstream
popd

echo "cloning procps"
git clone https://github.com/qunixorg/procps.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd procps
checkUpstream
popd

echo "cloning util linux"
git clone https://github.com/qunixorg/util-linux.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd util-linux
checkUpstream
popd

echo "cloning e2fsprogs"
git clone https://github.com/qunixorg/e2fsprogs.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd e2fsprogs
checkUpstream
popd

echo "cloning sysklogd"
git clone https://github.com/qunixorg/sysklogd.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd sysklogd
checkUpstream
popd

echo "cloning sysvinit"
git clone https://github.com/qunixorg/sysvinit.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd sysvinit
checkUpstream
popd

echo "cloning eudev"
git clone https://github.com/qunixorg/eudev.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd eudev
checkUpstream
popd

echo "cloning curl"
git clone https://github.com/qunixorg/curl.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd curl
checkUpstream
popd

echo "cloning git"
git clone https://github.com/qunixorg/git.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd git
checkUpstream
popd


echo "cloning lfs-bootscripts"
git clone https://github.com/qunixorg/lfs-bootscripts.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd lfs-bootscripts
checkUpstream
popd


echo "cloning udev-lfs"
git clone https://github.com/qunixorg/udev-lfs.git || { echo "can not fetch repository, please check logs installation aborted" ; exit 1; }
pushd udev-lfs
checkUpstream
popd

