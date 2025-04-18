#!/usr/bin/env bash
set -euo

IMAGE="$(cat "$PWD/server-docker-image.txt")"
SERVICE="example-wif-$ENV"
if [[ -z "$IMAGE" ]]; then
  echo "no image found"
  exit 1
fi

gcloud config set project "$GCLOUD_PROJECT"

SERVICE_URL=$(
  gcloud run deploy "$SERVICE" \
    --image "$IMAGE" \
    --platform managed \
    --allow-unauthenticated \
    --format='value(status.url)' \
    --region "$GCLOUD_REGION"
)

echo "$SERVICE_URL" >server-url.txt
