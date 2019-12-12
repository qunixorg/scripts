#!/bin/sh


source $(pwd)/../commons.sh

echo "checking user"

checkme "root" || { echo "Invalid user expected $INSTALL_USER or INSTALL_USER not set" ; exit 1; }
checkVar $INSTALL_LOC ||  { echo "Please set INSTALL_LOC before using this script" ; exit 1; }

echo "creating base directories"
mkdir -pv $INSTALL_LOC/{dev,proc,sys,run} || { echo "can not create base directories, please check logs installation aborted" ; exit 1; }

echo "creating initial device nodes"
mknod -m 600 $INSTALL_LOC/dev/console c 5 1  || { echo "can not create nodes, please check logs installation aborted" ; exit 1; }
mknod -m 666 $INSTALL_LOC/dev/null c 1 3  || { echo "can not create nodes, please check logs installation aborted" ; exit 1; }

echo "mounting dev"
mount -v --bind /dev $INSTALL_LOC/dev || { echo "can not create nodes, please check logs installation aborted" ; exit 1; }
 

echo "mounting virtual kernel file systems"
mount -vt devpts devpts $INSTALL_LOC/dev/pts -o gid=5,mode=620 || { echo "can not create nodes, please check logs installation aborted" ; exit 1; }

mount -vt proc proc $INSTALL_LOC/proc || { echo "can not create nodes, please check logs installation aborted" ; exit 1; }

mount -vt sysfs sysfs $INSTALL_LOC/sys || { echo "can not create nodes, please check logs installation aborted" ; exit 1; }

mount -vt tmpfs tmpfs $INSTALL_LOC/run || { echo "can not create nodes, please check logs installation aborted" ; exit 1; }


if [ -h $INSTALL_LOC/dev/shm ]; then
 mkdir -pv $INSTALL_LOC/$(readlink $INSTALL_LOC/dev/shm)  || { echo "can not create nodes, please check logs installation aborted" ; exit 1; }
fi
