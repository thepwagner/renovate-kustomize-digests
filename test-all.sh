#!/bin/bash -e

find . -mindepth 2 -maxdepth 2 \
   -not -path "./.git*" \
   -exec ./test.sh "{}" \;
