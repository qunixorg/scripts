#!/bin/sh


source $(pwd)/commons.sh

echo "checking user"

checkVar "$INSTALL_USER" || { echo "please set INSTALL_USER " ; exit 1; }
checkme "root" || { echo "Invalid user expected $INSTALL_USER or INSTALL_USER not set" ; exit 1; }
checkVar $INSTALL_LOC ||  { echo "Please set INSTALL_LOC before using this script" ; exit 1; }
checkVar $TERM ||  { echo "Please set TERM variable before using this script" ; exit 1; }


chroot "$INSTALL_LOC" /tools/bin/env -i \
 HOME=/root \
 TERM="$TERM" \
 PS1='($INSTALL_USER chroot) \u:\w\$ ' \
 PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
 /tools/bin/bash --login +h || { echo "can not chroot , please check logs installation aborted" ; exit 1; }
