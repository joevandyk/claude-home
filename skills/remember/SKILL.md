---
name: remember
description: Use when the user says "remember", "from now on", "always" or "never", or corrects you in a way that should apply to future sessions. Saves it as an instruction in an AGENTS.md and pushes.
---

# Remember

The agent's private memory is off, so something worth keeping becomes a written instruction in git.

1. **Pick the file.**
   - Applies everywhere → `~/claude-home/global/AGENTS.md`, under the heading it fits.
   - Only one project → that project's `AGENTS.md`.
   - Steps for one kind of job → a skill (`new-skill`), not an instruction.
2. **Look for an instruction that already covers it.** Update that one; never keep two that disagree.
3. **Write it as an action**: one line saying what to do, plus the reason if it isn't obvious.
   "Send invoices on the 1st from the business account", not "Don't forget invoices".
4. **Commit and push** the repo you changed: `git add -A && git commit -m "Remember: <the rule>" && git push`.
5. Tell the user, in one line, what you wrote and the file it's in.
