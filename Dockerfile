FROM rust:bookworm AS bin-builder

RUN cargo install --git https://github.com/googleworkspace/cli --locked

# ---

FROM alpine:latest AS skill-downloader

WORKDIR /cloned
RUN apk add --no-cache git
RUN git clone --depth 1 https://github.com/googleworkspace/cli.git

# ---

FROM ghcr.io/yz4230/nanobot-base:latest

COPY --from=bin-builder /usr/local/cargo/bin/gws /usr/local/bin/gws
COPY --from=skill-downloader /cloned/cli/skills /app/nanobot/skills

USER root

# Install discord.py for supporting the Discord channel
RUN uv pip install --system --no-cache discord.py

# Install again to bundle additional skills
RUN uv pip install --system --no-cache .

ENV GOOGLE_WORKSPACE_CLI_CONFIG_DIR=/home/nanobot/.nanobot/credentials/gws

USER nanobot

