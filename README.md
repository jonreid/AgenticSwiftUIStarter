# Agentic SwiftUI Starter

A SwiftUI app template wired for test-driven development and agentic coding:

- “Core” Swift Package for view-independent logic with blazingly fast tests.
- Expressive tests of SwiftUI views using ViewInspector with boilerplate helpers.
- Pre-commit gate that does build, formatting, linting, and copy-paste detection.

## Getting started

Create a repo from this template. Then from the project root:

```sh
./setup/rename.sh NameOfYourApp  # rename AppNamePlaceholder everywhere
./setup/install.sh               # install tools + pre-commit hook
```

`install.sh` does the following:

- Uses Homebrew to install SwiftFormat, SwiftLint, jscpd, and cloc.
- Installs a pre-commit hook that runs `./pre_commit_checks.sh`.
- Does an initial build to resolve package dependencies so that per-commit builds can skip package resolution.

## About the Author

Jon Reid is the author of _[iOS Unit Testing by Example](https://iosunittestingbyexample.com)._  
Find more at [Quality Coding](https://qualitycoding.org).

[![Bluesky](https://img.shields.io/bluesky/followers/qualitycoding.org)](https://bsky.app/profile/qualitycoding.org)
[![Mastodon](https://img.shields.io/mastodon/follow/109765011064804734?domain=https%3A%2F%2Fiosdev.space)](https://iosdev.space/@qcoding)
[![GitHub](https://img.shields.io/github/stars/jonreid)](https://github.com/jonreid)
