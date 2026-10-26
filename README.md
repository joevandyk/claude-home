# claude-home

One git repository that holds how your AI agents work: your instructions, your skills, and your
settings. It works with Claude Code and Codex, and any tool that reads `AGENTS.md`. Every laptop links
to it, so an instruction you add on one laptop is on the other after a pull, and nothing an agent
learns is stuck on one machine.

## The approach

- **Everything lives in git.** Instructions, skills and project notes are files in a repository on
  GitHub. The agent commits and pushes after every change, so GitHub is always the current copy.
- **One instructions file, `AGENTS.md`.** It's the shared standard Codex, Cursor and others read.
  Claude Code reads `CLAUDE.md`, so each `CLAUDE.md` is either a link to `AGENTS.md` or holds just
  `@AGENTS.md`, which pulls it in. You never keep two copies.
- **No hidden memory.** Claude Code's private memory is switched off; Codex's is off by default. When
  you tell an agent to remember something, it writes it into an `AGENTS.md` and pushes it, where you
  can read it, change it, or delete it.
- **Skills in one place.** Every skill is a folder in `skills/`. Codex reads `~/.agents/skills` and
  Claude Code reads `~/.claude/skills`; both are links to that folder, so there is one copy.
- **Log every change.** Each project keeps `docs/activity-log.md`: what changed, where, and how to undo
  it. That covers changes outside git too, like a new account connection or a changed setting.

## What's in it

| Path | What it does | Linked from |
|---|---|---|
| `global/AGENTS.md` | Your standing instructions, loaded in every session in every project. | `~/.claude/CLAUDE.md`, `~/.codex/AGENTS.md` |
| `skills/` | Skills: `remember`, `new-skill`, `new-project`. Add your own. | `~/.claude/skills`, `~/.agents/skills` |
| `claude/settings.json` | Turns off Claude Code's private memory. | `~/.claude/settings.json` |
| `project-template/` | What `new-project` copies into a new repository: `AGENTS.md`, `CLAUDE.md` (`@AGENTS.md`), `.agents/skills/` with `.claude/skills` linked to it, and an activity log. | |
| `install.sh` | Makes the links on a laptop. | |
| `docs/activity-log.md` | This repo's own change log. | |

## Set up a laptop

You need a GitHub account, the GitHub command line tool, and Claude Code or Codex. Do this once per laptop.

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

`install.sh` moves anything already at those paths aside with a `.before-claude-home` ending, then
links each one to this repo. Your history, sign-ins and projects stay where they are.

If you had your own instructions or skills before, ask the agent: "fold my old
`.before-claude-home` instructions and skills into claude-home". It merges them in and pushes.

## Day to day

- **"Remember that…"** The agent writes it into `AGENTS.md` and pushes.
- **"Make a skill for…"** The agent writes it in `skills/` and pushes.
- **"Start a new project for…"** The agent makes a private GitHub repo from `project-template/`.
- **On the other laptop**, the agent pulls this repo at the start of a session (an instruction in
  `global/AGENTS.md` says to), so it picks up what you added elsewhere.
- **To undo something**, ask the agent to revert it. Every change is a commit.
