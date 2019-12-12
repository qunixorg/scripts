#!/bin/bash

source $(pwd)/commons.sh

checkExist /tools &&  { echo "/tools directory or link exist please remove or backup before running" ; exit 1; }

echo "checking user"

checkVar $INSTALL_USER || { echo "Invalid user expected $INSTALL_USER or INSTALL_USER not set" ; exit 1; }
checkVar $MAKEFLAGS ||  { echo "Please set MAKEFLAGS before using this script" ; exit 1; }
checkVar $INSTALL_LOC ||  { echo "Please set INSTALL_LOC before using this script" ; exit 1; }
export INSTALL_TGT=$(uname -m)-$INSTALL_USER-linux-gnu

groupadd $INSTALL_USER

mkdir -p $INSTALL_LOC/tools
mkdir -p /tmp/skel 
cat > /tmp/skel/.bash_profile << "EOF"
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
EOF
echo "bash profile created for new user"
cat > /tmp/skel/.bashrc << EOF
set +h
umask 022
INSTALL_LOC=$INSTALL_LOC
INSTALL_USER=$INSTALL_USER
MAKEFLAGS="$MAKEFLAGS"
LC_ALL=POSIX
INSTALL_TGT=$INSTALL_TGT
PATH=/tools/bin:/bin:/usr/bin
export INSTALL_LOC LC_ALL INSTALL_TGT INSTALL_USER MAKEFLAGS PATH
EOF
echo "bashrc created for new user"
useradd -s /bin/bash -g $INSTALL_USER -m -d $INSTALL_LOC/sources -k /dev/null -k /tmp/skel $INSTALL_USER
chown -vR $INSTALL_USER:$INSTALL_USER $INSTALL_LOC/tools
chown -vR $INSTALL_USER:$INSTALL_USER $INSTALL_LOC/sources
ln -sv $INSTALL_LOC/tools /tools
exit 0
