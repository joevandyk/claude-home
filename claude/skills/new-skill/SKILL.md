---
name: new-skill
description: Use when the user asks for a new skill, or a job has come up a second time and is worth writing down. Creates or extends a skill in claude-home and pushes.
---

# New skill

1. **Look first.** `ls ~/claude-home/claude/skills/` and read any that sound close. Extend one
   rather than writing a second that overlaps it.
2. **Make the folder**: `~/claude-home/claude/skills/<short-name>/SKILL.md`, lowercase with dashes.
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

   The `description` decides when Claude picks the skill up, so name the situation and the words
   the user would say.
4. **Scripts** go next to `SKILL.md`. Run one once on a real case before pushing.
5. **Commit and push**: `cd ~/claude-home && git add -A && git commit -m "Skill: <name>" && git push`.
6. Tell the user the skill's name and when it will kick in.
