#!/bin/sh

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
    exit
fi

git status | grep "Not a git repository"
if [ $? -eq 0 ]; then
    exit
fi

git branch | grep $1
exists=$?

if [ $exists -eq 1 ] ; then
    git checkout $1
    gulp & sudo grunt & node app.js & wait
else
    echo "Already exists"
fi
