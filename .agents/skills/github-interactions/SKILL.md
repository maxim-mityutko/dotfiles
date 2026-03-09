---
name: github-interactions
description: Enforce GitHub CLI for all GitHub interactions in this repository. Use when a task involves PRs, issues, branches, commits, reviews, checks, releases, or any remote GitHub operation. Always execute GitHub-facing operations via `gh` and request elevated network permissions at the start of the task.
---

# GitHub Interactions

## Workflow

1. Start every GitHub-related task by requesting elevated network permissions before the first remote call.
2. Use `gh` for all GitHub interactions, including:
- PR inspection and checkout
- Issue, review, and comment operations
- Remote branch/metadata queries
- GitHub API requests
3. Avoid using non-`gh` commands for remote GitHub operations when an equivalent `gh` action exists.
4. If a command fails because of networking or sandbox restrictions, rerun with elevated permissions immediately.

## Command Guidance

- PR details: `gh pr view <number> --repo <owner>/<repo>`
- PR checkout: `gh pr checkout <number> --repo <owner>/<repo>`
- Repo metadata: `gh repo view <owner>/<repo>`
- Direct API usage: `gh api <endpoint>`

## Execution Rules

- Keep local-only filesystem edits and local validation commands unchanged.
- Before any significant GitHub operation, state briefly which `gh` command will run.
- Prefer explicit `--repo <owner>/<repo>` on `gh` commands when working across repositories.
