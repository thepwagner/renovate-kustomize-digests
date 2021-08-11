#!/bin/bash -e

if [[ -z "$1" || ! -d "$1" ]]; then
  echo "test not found: $1"
  exit 1
fi

echo "$1"
COMPILED=$(kustomize build $1)
IMAGE=$(echo -e "$COMPILED" | grep "image:" | sed -e 's/.*: //g')
echo "kustomized: $IMAGE"
echo -n "pulled:     "
docker pull -q "$IMAGE"
echo -n "digests:    "
docker inspect "$IMAGE" | jq -r '.[0].RepoDigests[]' | sort | sed -e '2,100s/^/            /g'
echo "-----"
