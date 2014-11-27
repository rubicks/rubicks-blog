#!/usr/bin/env bash

echo -n && \
    ghc --make site.hs && \
    ./site build && \
    echo "big win" || echo "oh noes"
