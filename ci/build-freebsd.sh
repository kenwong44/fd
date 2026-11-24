#!/bin/sh
set -eu

# Receive the exact upstream tag from GitHub Actions
TAG="${1:?Usage: build-freebsd.sh v10.5.2}"

# Build and smoke-test
gmake
test -x target/release/fd
./target/release/fd --version

# Package the binary
mkdir -p dist
tar -czf \
    "dist/fd-${TAG}-x86_64-unknown-freebsd.tar.gz" \
    -C target/release fd

