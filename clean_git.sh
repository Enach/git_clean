#!/bin/bash
for D in *; do
    if [ -d "${D}" ]; then
	cd "${D}"
	if [ -d .git ]; then
	    echo "${D}" `git rev-parse --abbrev-ref HEAD`
	    git branch | grep -ve " master$" | xargs git branch -D
	    git fetch
	fi
	cd ../
    fi
done
