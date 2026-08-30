#!/usr/bin/env bash
set -euo pipefail

if ! command -v jscpd >/dev/null 2>&1; then
    echo "jscpd not found. Install it with: brew install jscpd" >&2
    exit 1
fi

exit_code=0
jscpd -c .jscpd.json AppNamePlaceholder AppNamePlaceholderCore/Sources || exit_code=$?
jscpd -c .jscpd-tests.json AppNamePlaceholderTests AppNamePlaceholderCore/Tests || exit_code=$?
exit $exit_code
