#!/bin/bash
set -euo pipefail

docker run -d \
  --name nanobot-gw \
  --restart unless-stopped \
  -v ~/.nanobot:/home/nanobot/.nanobot \
  --entrypoint /bin/bash \
  ghcr.io/yz4230/nanobot-custom:latest gateway

