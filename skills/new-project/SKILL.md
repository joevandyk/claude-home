---
name: new-project
description: Use when the user wants to start a new project, folder of documents or repository. Creates a private GitHub repo from claude-home's project template, with its own AGENTS.md and activity log.
---

# New project

1. **Name it** with the user: short, lowercase, dashes (`spring-launch`).
2. **Create it** under `~/projects` from the template:

   ```
   mkdir -p ~/projects && cp -R ~/claude-home/project-template ~/projects/<name>
   cd ~/projects/<name> && git init -b main
   ```

3. **Fill in `README.md` and `AGENTS.md`** from what the user told you: the goal, who it's for, and
   anything that's true only for this project. Keep each to a screen. Leave `CLAUDE.md` as `@AGENTS.md`.
4. **Push it, private**:

   ```
   git add -A && git commit -m "Start <name>"
   gh repo create <name> --private --source . --push
   ```

5. Tell the user the GitHub link.
