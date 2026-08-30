#!/usr/bin/env bash
set -euo pipefail

exit_code=0
npx jscpd -c .jscpd.json AppNamePlaceholder AppNamePlaceholderCore/Sources || exit_code=$?
npx jscpd -c .jscpd-tests.json AppNamePlaceholderTests AppNamePlaceholderCore/Tests || exit_code=$?
exit $exit_code
