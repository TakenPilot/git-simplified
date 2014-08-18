#!/bin/sh
git branch | grep "* master"
is_master=$?

git branch | grep $1
exists=$?

if [ $exists -eq 1 ] ; then
	if [ $is_master -eq 0 ] ; then
		git checkout -b $1
		git push origin $1
	else
		echo "Must be master"
	fi
else 
    echo "Already exists"
fi
