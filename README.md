
README
======

About
-----

This project is for generating Let's Encrypt credentials using Docker.

Usage
-----

Run `ezanmoto/letsencrypt_docker` to generate Let's Encrypt credentials for the
current host to a `letsencrypt` directory in the current directory.

    docker run \
        --rm \
        -p 80:80 \
        -v $(pwd)/letsencrypt:/etc/letsencrypt \
        ezanmoto/letsencrypt_docker \
        http \
        example.com,www.example.com

Pass `-p 443:443` instead of `-p 80:80` and `https` instead of `http` to allow
Let's Encrypt to discover the host through port 443 instead of port 80.
