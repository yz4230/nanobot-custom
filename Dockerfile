FROM rust:bookworm AS bin-builder

RUN cargo install --git https://github.com/googleworkspace/cli --locked

# ---

FROM alpine:latest AS skill-downloader

WORKDIR /cloned
RUN apk add --no-cache git
RUN git clone --depth 1 https://github.com/googleworkspace/cli.git

# ---

FROM nanobot

USER root

RUN uv pip install --system --no-cache discord.py
COPY --from=gws-builder /usr/local/cargo/bin/gws /usr/local/bin/gws
COPY --from=skill-downloader /cloned/cli/skills /app/nanobot/skills

# Install again to bundle additional skills
RUN uv pip install --system --no-cache .

USER nanobot

