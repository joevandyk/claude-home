---
name: remember
description: Use when the user says "remember", "from now on", "always" or "never", or corrects you in a way that should apply to future sessions. Saves it as a rule in claude-home and pushes.
---

# Remember

Claude's private memory is off, so something worth keeping becomes a written rule in git.

1. **Pick the file.**
   - Applies to everything → `~/claude-home/claude/CLAUDE.md`, under the heading it fits.
   - One topic (writing, money, a client) → `~/claude-home/claude/rules/<topic>.md`. Add to an existing
     file before making a new one.
   - Only one project → that project's own `CLAUDE.md`.
   - Steps for one kind of job → a skill (`new-skill`), not a rule.
2. **Look for a rule that already covers it.** Update that one; never keep two that disagree.
3. **Write it as an action**: one line saying what to do, plus the reason if it isn't obvious.
   "Send invoices on the 1st from the business account", not "Don't forget invoices".
4. **Commit and push**: `cd ~/claude-home && git add -A && git commit -m "Remember: <the rule>" && git push`.
5. Tell the user, in one line, the rule you wrote and the file it's in.
