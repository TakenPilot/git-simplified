#!/bin/sh

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
    exit
fi

git status | grep "Not a git repository"
if [ $? -eq 0 ]; then
    exit
fi

git branch | grep "* master"
is_master=$?

git branch | grep $1
exists=$?

if [ $exists -eq 1 ] ; then
	if [ $is_master -eq 0 ] ; then
		git checkout -b $1
		git push -u origin $1
	else
		echo "Must be master"
	fi
else 
    echo "Already exists"
fi
