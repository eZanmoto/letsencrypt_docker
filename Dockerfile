#!/bin/sh

# Copyright 2017 Sean Kelleher. All rights reserved.

# This Dockerfile is for an image to create Let's Encrypt credentials.

FROM debian:8.6

RUN \
    apt-get update \
    && apt-get install --quiet --assume-yes \
        wget

RUN \
    wget https://dl.eff.org/certbot-auto \
    && chmod a+x certbot-auto \
    && ./certbot-auto --non-interactive \
    || true

COPY gen.sh /

ENTRYPOINT [ "bash", "/gen.sh" ]
