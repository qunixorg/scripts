#!/bin/sh


source $(pwd)/commons.sh

echo "checking user"

checkme "root" || { echo "Invalid user expected root or INSTALL_USER not set" ; exit 1; }
checkVar $INSTALL_LOC ||  { echo "Please set INSTALL_LOC before using this script" ; exit 1; }

chown -Rv root:root $INSTALL_LOC/tools
