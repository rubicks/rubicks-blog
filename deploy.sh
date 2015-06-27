#!/usr/bin/env bash

# github.com/rubicks/rubicks-blog/deploy.sh
#
# references:
#
#   https://github.com/iKevinY/iKevinY.github.io/blob/src/deploy.sh
#
#   http://zonca.github.io/2013/09/automatically-build-pelican-and-publish-to-github-pages.html

_pwd=$(pwd)
_here=$(dirname $(readlink -f ${BASH_SOURCE}))

function _return()
{
    cd ${_pwd}
    exit $1
}

trap '_return 1' ERR
set -e

cd ${_here}

# Pull message and hash from most recent commit
_mess=$(git rev-parse HEAD)
_mess+="; "
_mess+=$(git log -1 --pretty=%B)


if [[ "true" == "${TRAVIS}" ]]
then
    git config --global user.email "travis@travis-ci.org"
    git config --global user.name "Travis CI"
    _mess+="; pushed by Travis build ${TRAVIS_BUILD_NUMBER}"
    _repo="https://${GITHUB_TOKEN}@github.com/rubicks/rubicks.github.io.git"
else
    _repo="git@github.com:rubicks/rubicks.github.io.git"
fi

_tdir=$(mktemp -d)

git clone --quiet -- ${_repo} ${_tdir}

cp -v -r -t ${_tdir} ${_here}/_site/*

cd ${_tdir}

git status --branch --short

git commit -am "${_mess}"

git push --quiet --force origin master

_return 0
