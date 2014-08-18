#!/bin/sh
git branch | grep "* master"
if [ $? -eq 0 ] ; then
	git checkout -b $1
	git push origin $1
else
	echo "Must be master"
fi
