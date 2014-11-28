#!/usr/bin/env bash
#
# rubicks-blog/build.sh

_this=$(readlink -f ${BASH_SOURCE})
_here=$(dirname ${_this})

cd ${_here}        || exit 1
which ghc          || exit 1
ghc --version      || exit 1
ghc --make site.hs || exit 1
./site build       || exit 1
