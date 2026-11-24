
#!/bin/sh
set -eu

# Require an exact upstream release tag
TAG=$(git describe --tags --exact-match \
    --match 'v[0-9]*')

# Build and smoke-test
gmake
test -x target/release/fd
./target/release/fd --version

# Package
mkdir -p dist
tar -czf \
    "dist/fd-${TAG}-x86_64-unknown-freebsd.tar.gz" \
    -C target/release fd

