#!/bin/sh

git status | grep "Not a git repository"
if [ $? -eq 1 ]; then
    exit
fi

git branch | grep "* master"
is_master=$?

git status --uno | grep 'Your branch is up-to-date'
up_to_date=$?

if [ $up_to_date -eq 0 ] ; then
	if [ $is_master -eq 1 ] ; then
		git push
	else
		echo "Should not push to master"
	fi
else 
    echo "Out of date; Pull first."
fi
