#!/bin/bash -e

if [[ -z "$1" || ! -d "$1" ]]; then
  echo "test not found: $1"
  exit 1
fi

echo "$1"
COMPILED=$(kustomize build $1)
IMAGE=$(echo -e "$COMPILED" | grep "image:" | sed -e 's/.*: //g')
docker pull -q "$IMAGE"
echo "-----"

