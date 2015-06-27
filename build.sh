#!/usr/bin/env bash
#
# github.com/rubicks/rubicks-blog/build.sh

trap 'exit 1' ERR
set -e

_here=$(dirname $(readlink -f ${BASH_SOURCE}))

cd ${_here}
which ghc
ghc --version
ghc --make site.hs
${_here}/site rebuild

# # maybe someday travis will update its linkchecker, this one throws too many errors
# find ${_here}/_site -name "*.html" | xargs linkchecker --no-warnings
