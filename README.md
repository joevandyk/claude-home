# claude-home

One git repository that holds how Claude Code works for you: your rules, your skills, and your
settings. Every laptop links to it, so a rule you add on one laptop is on the other after a pull,
and nothing Claude learns is stuck on one machine.

## The approach

- **Everything lives in git.** Rules, skills and project notes are files in a repository on GitHub.
  Claude commits and pushes after every change, so GitHub is always the current copy.
- **No hidden memory.** Claude Code's private memory folder is switched off. When you tell Claude
  to remember something, it writes the rule into this repo (`claude/CLAUDE.md` or a file in
  `claude/rules/`) and pushes it, where you can read it, change it, or delete it.
- **Skills in one place.** Every skill is a folder in `claude/skills/`. Each laptop's
  `~/.claude/skills` points here, so there is one copy, not one per machine.
- **Log every change.** Each project keeps `docs/activity-log.md`: what changed, where, and how to undo
  it. That covers changes outside git too, like a new account connection or a changed setting.

## What's in it

| Path | What it does |
|---|---|
| `claude/CLAUDE.md` | Your standing instructions. Claude reads them at the start of every session, in every project. |
| `claude/rules/*.md` | More instructions, one topic per file. Loaded the same way. |
| `claude/skills/` | Skills: `remember`, `new-skill`, `new-project`. Add your own. |
| `claude/settings.json` | Turns off Claude's private memory. |
| `project-template/` | What `new-project` copies into a new repository. |
| `install.sh` | Links `~/.claude` to this repo on a laptop. |
| `docs/activity-log.md` | This repo's own change log. |

## Set up a laptop

You need a GitHub account, the GitHub command line tool and Claude Code. Do this once per laptop.

1. Install the GitHub tool and sign in: `brew install gh`, then `gh auth login` (choose GitHub.com,
   HTTPS, and sign in with a browser).
2. Copy this repo into your own GitHub account, private: on its GitHub page click **Use this template
   → Create a new repository**, name it `claude-home` and choose **Private**. (Second laptop: skip
   this step, the repo already exists.)
3. Download it and link it:

   ```
   gh repo clone <your-github-name>/claude-home ~/claude-home
   ~/claude-home/install.sh
   ```

`install.sh` moves any existing `~/.claude/CLAUDE.md`, `rules`, `skills` and `settings.json` aside
with a `.before-claude-home` ending, then links each one to this repo. Your Claude history,
sign-in and projects stay where they are.

If you had your own instructions or skills before, ask Claude: "fold my old
`~/.claude/*.before-claude-home` instructions and skills into claude-home". It merges them in and pushes.

## Day to day

- **"Remember that…"** Claude writes it as a rule here and pushes.
- **"Make a skill for…"** Claude writes it in `claude/skills/` and pushes.
- **"Start a new project for…"** Claude makes a private GitHub repo from `project-template/`.
- **On the other laptop**, Claude pulls this repo at the start of a session (a rule in
  `claude/CLAUDE.md` says to), so it picks up what you added elsewhere.
- **To undo something**, ask Claude to revert it. Every change is a commit.
