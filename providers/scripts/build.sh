#!/bin/sh
# Build every provider in this registry to <provider>/bin/obot-provider, where its manifest's
# command points.
set -eu

cd "$(dirname "$0")/.."

# Pure Go binaries run without libc in any image.
export CGO_ENABLED=${CGO_ENABLED:-0}

for gomod in */go.mod; do
    dir=$(dirname "$gomod")
    [ -f "$dir/main.go" ] || continue
    echo "Building providers/$dir"
    (cd "$dir" && go build -trimpath -ldflags="-s -w -buildid=" -o bin/obot-provider .)
done
