#!/usr/bin/env bash
set -euo pipefail

SCHEME='AppNamePlaceholder'
DESTINATION='generic/platform=iOS Simulator'

xcodebuild -configuration Release -scheme $SCHEME -sdk iphonesimulator -destination "$DESTINATION" -disableAutomaticPackageResolution CODE_SIGNING_ALLOWED='NO' | xcbeautify
