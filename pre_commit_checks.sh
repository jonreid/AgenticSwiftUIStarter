#!/usr/bin/env bash
set -euo pipefail

for tool in swiftformat swiftlint; do
    if ! command -v "$tool" >/dev/null 2>&1; then
        echo "$tool not found. Install it with: brew install $tool" >&2
        exit 1
    fi
done

staged_files=$(git diff --cached --name-only)
[[ -z "$staged_files" ]] && echo "Nothing staged to commit" && exit 1
staged_swift=$(git diff --cached --name-only --diff-filter=d -- '*.swift' | grep -v '/ThirdParty/' || true)

./build_release.sh
if [[ -n "$staged_swift" ]]; then
    swiftlint lint --fix --force-exclude --quiet $staged_swift
    swiftformat $staged_swift
    git add -- $staged_swift
fi
if git diff --cached --quiet; then
    echo "⚠️ Nothing to commit after formatting"
    exit 1
fi
if [[ -n "$staged_swift" ]]; then
    swiftlint lint --force-exclude --quiet --strict $staged_swift
    ./cpd.sh
fi
