#!/bin/bash -e

find . -mindepth 2 -maxdepth 2 -type d \
   -not -path "./.git*" \
   -exec ./test.sh "{}" \;
