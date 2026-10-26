# How I work with AI agents

These instructions load in every session, in every project, for Claude Code and Codex alike. They
live in `~/claude-home/global/AGENTS.md`; `~/.claude/CLAUDE.md` and `~/.codex/AGENTS.md` both link to it.

## Start of a session

- Run `git -C ~/claude-home pull --ff-only` before anything else, so instructions and skills added on
  my other laptop are here too. If it fails, tell me why in one line and carry on.

## Git is the record

- **Commit and push after every change** to a file in a repository: `git add`, `git commit`, `git push`,
  before you end the turn. GitHub is the copy I trust; a change only on this laptop is lost to me.
  Group related edits into one commit with a message saying what changed and why.
- **Check it landed:** `git status` is clean and `git log origin/HEAD..HEAD` prints nothing.
- **Push straight to `main`** in my own repositories. Open a pull request only where someone else owns
  the repo or asked for one.
- **Never commit a secret.** No passwords, API keys, tokens, or files holding them. Keep them in the
  app's own settings or a password manager, and add the file to `.gitignore`.

## Memory goes in git

- **Your tool's private memory stays off.** When I say "remember", or correct you in a way that should
  stick, use the `remember` skill: write it into an `AGENTS.md` and push.
- Don't write to Claude's `~/.claude/projects/*/memory/` or Codex's `~/.codex/memories/`.

## Instructions and skills live in one place

- **Instructions go in `AGENTS.md`**, never only in `CLAUDE.md`: these here, and a project's own at its
  root. A project's `CLAUDE.md` holds just `@AGENTS.md`, so Claude reads the same file.
- **Skills are folders in `~/claude-home/skills/`**, which both Claude Code and Codex read. A skill for
  one project goes in that project's `.agents/skills/`. Look before writing a new one; extend an
  existing skill rather than making a second.
- Build a skill the second time a job comes up, using the `new-skill` skill.

## Log every change

- Each project has `docs/activity-log.md`. Add a line for every change you make outside its files:
  an account connection, a setting in a web app, a scheduled job, a file moved somewhere else.
  Say what, where, and how to undo it, in the same push.

## Records hold correct facts

- When something turns out to be wrong, replace it with the right fact and delete the wrong one.
  No "(previously X)" notes; git history keeps the old version.
- When a fact changes, search the project for everything that depended on it and fix those too.

## Ask first

- Ask before anything that sends, pays, deletes, or publishes: emails, messages to other people,
  payments, deleting files or accounts, making something public.

## Writing

- Plain and short. Lead with the answer, then the reason.
- Use everyday words; explain a technical term the first time, or skip it.
- Link what you name: a file, task, page or document gets its link.
- Write each instruction as the action to take, with one default, not a prohibition or a menu.
  Say it once; put a long how-to in a skill.
