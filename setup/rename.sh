#!/usr/bin/env bash
set -euo pipefail

OLD="AppNamePlaceholder"
NEW="${1:-}"

if [[ ! "$NEW" =~ ^[A-Za-z][A-Za-z0-9]*$ ]]; then
    echo "usage: ${0##*/} <NewAppName>   (letters and digits, starting with a letter)" >&2
    exit 1
fi

if ! git rev-parse --git-dir >/dev/null 2>&1; then
    echo "Not a git repo. Run 'git init' first, or clone the template instead of downloading the ZIP." >&2
    exit 1
fi

cd "$(git rev-parse --show-toplevel)"

if [[ "$NEW" == "$OLD" ]]; then
    echo "Already named $OLD" >&2
    exit 1
fi

if ! git diff --quiet || ! git diff --cached --quiet; then
    echo "Working tree not clean. Commit or stash first." >&2
    exit 1
fi

self="setup/${0##*/}"

git grep -lI "$OLD" -- . ":!$self" | while IFS= read -r file; do
    sed -i '' "s/$OLD/$NEW/g" "$file"
done

git ls-files | grep "$OLD" | while IFS= read -r file; do
    new="${file//$OLD/$NEW}"
    mkdir -p "$(dirname "$new")"
    git mv "$file" "$new"
done

rm -rf "${NEW}Core/.build"
find . -type d -empty -not -path './.git/*' -delete

echo "Renamed $OLD -> $NEW. Review with: git status"
