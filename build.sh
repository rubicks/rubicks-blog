#!/usr/bin/env bash

echo -n && \
    ghc --make site.hs && \
    ./site build && \
    cd ./_site && \
    git commit -am "and another one" && \
    git push
