#!/bin/bash
if [ "\$#" -ne 1 ]; then
    echo "Usage: log-container <container-name>"
    exit 1
fi

CONTAINER_NAME="\$1"
docker logs -f "\$CONTAINER_NAME"
