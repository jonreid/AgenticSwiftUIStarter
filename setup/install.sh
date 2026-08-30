#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "$0")" && pwd)"

if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew not found. Install it from https://brew.sh then re-run ./setup/install.sh" >&2
    exit 1
fi

brew bundle --file "$script_dir/Brewfile"

repo_root="$(git rev-parse --show-toplevel 2>/dev/null)" || {
    echo "Not a git repo; skipping pre-commit hook." >&2
    exit 0
}

hook="$repo_root/.git/hooks/pre-commit"
cat > "$hook" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

./pre_commit_checks.sh
EOF
chmod +x "$hook"
echo "Installed pre-commit hook."

echo "Resolving Swift package dependencies..."
( cd "$repo_root" && xcodebuild -resolvePackageDependencies >/dev/null )
echo "Resolved Package.resolved (build_release.sh skips resolution)."
