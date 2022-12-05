#!/bin/bash


set -x
git status --porcelain
git fetch
declare -a LOCAL_BRANCH=$(git branch -l | cut  -d " " -f 2)

REMOTE_BRANCH=$(git rev-parse --abbrev-ref --symbolic-full-name $LOCAL_BRANCH@{u})

REMOTE_COMMITS=$(git log --oneline $LOCAL_BRANCH..$REMOTE_BRANCH | wc -l)

LOCAL_COMMITS=$(git log --oneline $REMOTE_BRANCH..$LOCAL_BRANCH | wc -l)
CURR_BRANCH=$(git branch | cut -d " " -f 2)
if [ $REMOTE_COMMITS != "0" ]; then
        echo 'inside git pull'
        git status --porcelain
        git pull
        echo 'git pull done'
else
        echo 'no change required'
fi
