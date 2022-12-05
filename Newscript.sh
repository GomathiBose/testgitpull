#!/bin/bash


set -x
git status --porcelain
git fetch 
declare -a LOCAL_BRANCH=$(git branch -l | cut -c3- | tr "\n" " ")
REMOTE_BRANCH=$(git rev-parse --abbrev-ref --symbolic-full-name $LOCAL_BRANCH@{u})

REMOTE_COMMITS=$(git log --oneline $LOCAL_BRANCH..$REMOTE_BRANCH | wc -l)

LOCAL_COMMITS=$(git log --oneline $REMOTE_BRANCH..$LOCAL_BRANCH | wc -l)
CURR_BRANCH=$(git branch | grep '*' | cut -c3-)
if [ $REMOTE_COMMITS != "0" ]; then
	if [ "$CURR_BRANCH" = "$LOCAL_BRANCH" ]; then
		if [ "$(git status --porcelain)" = "" ]; then
			git pull
			echo 'git pull done'
		fi
	else
		git fetch origin $LOCAL_BRANCH:$LOCAL_BRANCH
	fi
fi














 
