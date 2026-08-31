#!/usr/bin/env bash
set -euo pipefail

usage() {
    echo "Usage: $0 [prod|test|all]" >&2
    exit 1
}

mode="${1:-prod}"

case "$mode" in
    prod) exclude_dirs="build,.build,DerivedData,AppNamePlaceholderTests,Tests,ThirdParty,vendor" ;;
    test) paths="AppNamePlaceholderTests AppNamePlaceholderCore/Tests"; exclude_dirs="build,.build,DerivedData,ThirdParty,vendor" ;;
    all)  exclude_dirs="build,.build,DerivedData,ThirdParty,vendor" ;;
    *)    usage ;;
esac

cloc ${paths:-.} --include-lang=Swift --exclude-dir="$exclude_dirs" | tail -3
