#!/usr/bin/env bash
#
# github.com/rubicks/rubicks-blog/build.sh

set -euv
_here=$(dirname $(readlink -f ${BASH_SOURCE}))
cd ${_here}
go get github.com/spf13/hugo
command -v hugo
hugo version
hugo
