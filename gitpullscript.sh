#!/bin/bash

# set -x
git status -b
git fetch
LOCAL_BRANCH=$(git branch | cut  -d " " -f 2)
REMOTE_BRANCH=$(git rev-parse --abbrev-ref --symbolic-full-name $LOCAL_BRANCH@{u})
REMOTE_COMMITS=$(git log --oneline $LOCAL_BRANCH..$REMOTE_BRANCH | wc -l)

if [ $REMOTE_COMMITS != "0" ]; then
        echo 'Action Required! Perform Git pull to make remote changes available to your local'
else
	echo 'no action required'
fi

