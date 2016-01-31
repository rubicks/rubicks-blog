#!/usr/bin/env bash
#
# github.com/rubicks/rubicks-blog/deploy.sh

set -o pipefail
set -euv
_here=$(dirname $(readlink -f ${BASH_SOURCE}))
cd ${_here}

# Pull message and hash from most recent commit
_mess=$(git rev-parse HEAD)
_mess+="; "
_mess+=$(git log -1 --pretty=%B)


if [[ "true" == "${TRAVIS:-}" ]]
then
    git config --global user.email "travis@travis-ci.org"
    git config --global user.name "Travis CI"
    _mess+="; pushed by Travis build ${TRAVIS_BUILD_NUMBER}"
    _repo="https://${GITHUB_TOKEN}@github.com/rubicks/rubicks.github.io.git"
else
    _repo="git@github.com:rubicks/rubicks.github.io.git"
fi

cd $(mktemp -d)
echo $PWD

git clone --quiet -- ${_repo} ${PWD}

rm -vrf ${PWD}/*

cp -vrt ${PWD} ${_here}/public/*

git add *

git status --branch --short

git commit -am "${_mess}"

#git push --dry-run --verbose --force origin master
git push --quiet --force origin master

