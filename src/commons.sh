#!/bin/bash

checkUpstream () {

	GIT_UPSTREAM=$(git show qunix-source-upstream | grep q-src | cut -d = -f2)
	if [ -z $GIT_UPSTREAM  ]; then
		echo "Repository doesnt have another upstream"
	else
		echo "An upstream defined $GIT_UPSTREAM"
		git remote add upstream $GIT_UPSTREAM
		git fetch upstream
		git merge upstream/master
	fi
	return 0
}

checkExist () {

	if [ -e "$1" ]; then
		echo "Accessing $1"
		return 0
	else 
    		echo "File $1 does not exist"
		return 1
	fi 
}

checkme () {
	me=$(whoami)
	if [ "$me" == "$1" ]; then
		echo "Current user validated"
		return 0
	else
		return 1
	fi
}

checkVar () {
	if [ -z $1 ]; then
		return 1
	fi
}
