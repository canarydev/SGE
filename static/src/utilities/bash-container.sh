#!/bin/bash
if [ "$#" -eq 0 ]; then
    echo "Usage: bash-container <container-name>"
    exit 1
fi

CONTAINER_NAME="$1"
docker exec -it -u 0 "$CONTAINER_NAME" bash
