#!/bin/sh -e


if ! command -v git-annex > /dev/null
then
    echo >&2 "git-annex not available, you need to install it"
    exit 1
fi

# Just in case the repo was cloned with --single-branch option
git config remote.origin.fetch refs/heads/*:refs/remotes/origin/*

git annex init
git annex sync -a --no-push

if ! git annex enableremote gonito-https
then
    echo >&2 "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    echo >&2 "Setting httpalso failed, likely because you have an outdated version of git-annex"
    echo >&2 "See https://git-annex.branchable.com/install/"
    echo >&2 "Probably the easiest way is to use conda: conda install -c conda-forge git-annex"
    echo >&2 "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    exit 1
fi

git annex get $@ --from gonito-https
