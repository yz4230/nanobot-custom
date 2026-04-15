#!/bin/bash
set -euo pipefail

docker run \
  -v ~/.nanobot:/home/nanobot/.nanobot \
  --entrypoint /bin/bash \
  ghcr.io/yz4230/nanobot-custom:latest gateway

