#!/usr/bin/env bash
#
# rubicks-blog/build.sh

_this=$(readlink -f ${BASH_SOURCE})
_here=$(dirname ${_this})

echo -n                   && \
    cd ${_here}           && \
    which ghc             && \
    ghc --version         && \
    ghc --make site.hs    && \
    ${_here}/site rebuild && \
    find ${_here}/_site -name "*.html" | xargs linkchecker --no-warnings
