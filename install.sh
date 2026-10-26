#!/usr/bin/env bash
# Links Claude Code's and Codex's global instructions, skills and settings to this repo. Safe to run again.
set -euo pipefail

REPO="$(cd "$(dirname "$0")" && pwd)"

link() {  # link <file in this repo> <path under $HOME>
  local src="$REPO/$1" dst="$HOME/$2"
  mkdir -p "$(dirname "$dst")"
  if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
    echo "already linked: ~/$2"
    return
  fi
  if [ -e "$dst" ] || [ -L "$dst" ]; then
    mv "$dst" "$dst.before-claude-home"
    echo "moved aside: ~/$2.before-claude-home"
  fi
  ln -s "$src" "$dst"
  echo "linked: ~/$2 -> $src"
}

link global/AGENTS.md      .claude/CLAUDE.md
link global/AGENTS.md      .codex/AGENTS.md
link skills                .claude/skills
link skills                .agents/skills
link claude/settings.json  .claude/settings.json
