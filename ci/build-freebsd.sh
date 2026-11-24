#!/bin/sh
set -eu

# Build fd using its existing Makefile
gmake

# Verify the resulting executable
test -x target/release/fd
./target/release/fd --version

# Package the FreeBSD binary
mkdir -p dist
tar -czf dist/fd-freebsd-amd64.tar.gz \
    -C target/release fd

