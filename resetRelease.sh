#!/bin/bash
. "$(dirname $0)/utils.sh"

SCHEME=release/5.8

echo "♻️  Resetting the repositories..."
find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c "[ -d '{}'/.git ] && echo ■ Cleaning '{}' && cd '{}' && git reset --hard HEAD && git clean -fd" \;
echo "✳️  Switching all the repositories to ${SCHEME}..."
./swift/utils/update-checkout --clone --scheme "$SCHEME"
