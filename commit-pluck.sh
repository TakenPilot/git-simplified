#!/bin/sh

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
    exit
fi

git status | grep "Not a git repository"
if [ $? -eq 1 ]; then
    exit
fi

git branch | grep "* master"
is_master=$?

git log --pretty=oneline | grep $1
exists=$?

if [ $exists -eq 0 ] ; then
	if [ $is_master -eq 1 ] ; then
		git rebase --onto $1^ $1
	else
		echo "Cannot be master"
	fi
else 
    echo "Hash must exist"
fi
