#!/bin/sh

# Copyright 2017 Sean Kelleher. All rights reserved.

# `$0 <http|https> <domains>` generates Let's Encrypt credentials for a list of
# comma-separated `domains` using the local `http` or `https` port of the
# current host, which must be reachable using `domains`.

set -o errexit

if [ $# -ne 2 ] ; then
    echo "usage: $0 <http|https> <domains>" >&2
    exit 1
fi

method=$1
domains=$2

port=80
if [ "$method" == "https" ] ; then
    method='tls-sni'
    port=443
elif [ "$method" != "http" ] ; then
    echo "usage: $0 <http|https> <out-dir> <domains>" >&2
    exit 1
fi

./certbot-auto \
    certonly \
    --standalone \
    --preferred-challenges "$method" \
    --verbose \
    --register-unsafely-without-email \
    --non-interactive \
    --agree-tos \
    --domains "$domains" \
