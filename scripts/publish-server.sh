#!/usr/bin/env bash
set -euo
IMAGE="$(cat "$PWD/server-docker-image.txt")"

if [[ -z "$IMAGE" ]]; then
  echo "no image found"
  exit 1
fi

gcloud config set project "$GCLOUD_PROJECT"

docker push "$IMAGE"
