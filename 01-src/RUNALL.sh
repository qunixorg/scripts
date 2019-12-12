#!/bin/sh

for prefix in {1..34}
do
	ls -la "$prefix"-*sh || { echo "can not run script $prefix, please check logs installation aborted, after you fix run later scripts manually" ; exit 1; }
done	
