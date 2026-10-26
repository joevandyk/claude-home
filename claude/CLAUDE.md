# How I work with Claude

These instructions load in every session on every laptop. They live in `~/claude-home` (this file is
`~/claude-home/claude/CLAUDE.md`); `~/.claude` links to it.

## Start of a session

- Run `git -C ~/claude-home pull --ff-only` before anything else, so rules and skills added on my
  other laptop are here too. If it fails, tell me why in one line and carry on.

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

- **Claude's private memory is off.** When I say "remember", or correct you in a way that should
  stick, use the `remember` skill: write it into this repo as a rule and push.
- Don't write to `~/.claude/projects/*/memory/` or `MEMORY.md`.

## Skills live in one place

- Every skill is a folder in `~/claude-home/claude/skills/`. Look there before writing a new one;
  extend an existing skill rather than making a second.
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

## Writing rules

- Write each rule as the action to take, with one default, not a prohibition or a menu.
- Say it once. Put a long how-to in a skill and link it from here.
