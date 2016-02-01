#!/usr/bin/env bash
#
# github.com/rubicks/rubicks-blog/build.sh

set -euv
_here=$(dirname $(readlink -f ${BASH_SOURCE}))
cd ${_here}
command -v hugo
hugo version
hugo
