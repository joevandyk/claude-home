#!/usr/bin/env bash
# Links ~/.claude's instructions, rules, skills and settings to this repo. Safe to run again.
set -euo pipefail

REPO="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$HOME/.claude"

for name in CLAUDE.md rules skills settings.json; do
  src="$REPO/claude/$name"
  dst="$HOME/.claude/$name"
  if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
    echo "already linked: ~/.claude/$name"
    continue
  fi
  if [ -e "$dst" ] || [ -L "$dst" ]; then
    mv "$dst" "$dst.before-claude-home"
    echo "moved aside: ~/.claude/$name.before-claude-home"
  fi
  ln -s "$src" "$dst"
  echo "linked: ~/.claude/$name -> $src"
done
