#!/bin/sh


if  [ ! -z $1 ]
then
    if [ $1 = "--dry" ]
    then
        echo "No commit"
    else
        echo "Creating new commit: $1"
        git add .
        git commit -m "$1"
        git push
    fi
else
    echo "Amending commit"
    git add .
    git commit --amend -m "$(git log -1 --pretty=%B)"
    git push --force-with-lease
fi


flux reconcile source git flux-system