#!/bin/sh

CURRENT_DIR=$(pwd)
for dir in $CURRENT_DIR/*/
do
	folder=${dir%*/}
	echo "processing $folder"

	git_folder=$folder/.git
	if [ -d $git_folder ]; then
		git_upstream=$(git --git-dir $git_folder remote -v | grep upstream | grep fetch | cut -f 2 | cut -d ' ' -f 1)
		if [ -z $git_upstream  ]; then
			echo "Not an upstream"
			git --git-dir $git_folder tag -a qunix-source-manual -m 'requires manual maintenance'
		else
			echo "An upstream defined $git_upstream"
			git --git-dir $git_folder tag -a qunix-source-upstream -m "q-src=$git_upstream" 
		fi
	fi
done
