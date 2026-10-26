---
name: new-skill
description: Use when the user asks for a new skill, or a job has come up a second time and is worth writing down. Creates or extends a skill and pushes.
---

# New skill

1. **Look first.** `ls ~/claude-home/skills/` (and the project's `.agents/skills/`) and read any that
   sound close. Extend one rather than writing a second that overlaps it.
2. **Pick the place.** Useful anywhere → `~/claude-home/skills/<short-name>/`. Only for one project →
   `<project>/.agents/skills/<short-name>/`. Lowercase with dashes.
3. **Write `SKILL.md`** as a cover sheet a person can read in a minute:

   ```
   ---
   name: <short-name>
   description: Use when <the situation that should trigger it>. <What it does, one sentence.>
   ---

   # <Title>

   1. <Step, as an action.>
   2. ...
   ```

   The `description` decides when the agent picks the skill up, so name the situation and the words
   the user would say. Claude Code and Codex both read this format.
4. **Scripts** go next to `SKILL.md`. Run one once on a real case before pushing.
5. **Commit and push**: `git add -A && git commit -m "Skill: <name>" && git push`.
6. Tell the user the skill's name and when it will kick in.
