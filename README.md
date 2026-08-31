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

