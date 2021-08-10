#!/bin/bash -e

find . -mindepth 2 -maxdepth 2 \
    -path "*$1*" \
    -not -path "./.git*" \
    -print0 | sort -z | xargs -0 -I '{}' ./test.sh '{}'
