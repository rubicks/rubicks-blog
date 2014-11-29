#!/usr/bin/env bash
#
# rubicks-blog/deploy.sh
#
# derived from:
#
# https://github.com/iKevinY/iKevinY.github.io/blob/src/deploy.sh
#
# http://zonca.github.io/2013/09/automatically-build-pelican-and-publish-to-github-pages.html


# get some paths
_this=$(readlink -f ${BASH_SOURCE})
_here=$(dirname ${_this})

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

git clone    \
    --quiet  \
    --       \
    ${_repo} \
    ${_tdir} || exit 1

cp --verbose                   \
   --recursive                 \
   --target-directory ${_tdir} \
   ${_here}/_site/* || exit 1

cd ${_tdir} || exit 1

git add --all || exit 1

git status --branch --short

git commit -m "${_mess}" || exit 1

git push --quiet --force origin master || exit 1

cd ${_here}
