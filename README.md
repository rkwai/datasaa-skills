# datasaa-skills

A curated set of high-leverage `datasaa-*` skills packaged in the **standard OpenAI Codex skill format** (each skill is a folder containing a `SKILL.md`).

These skills are designed to produce **measurable product artifacts** (briefs, hypotheses, ADRs, plans, rollout checklists, etc.) and to be directly usable by coding agents (Codex / Claude-style agents).

---

## Repo structure

Each skill lives in:

```text
datasaa-<skill-name>/
  SKILL.md
```

Example:

```text
datasaa-problem-framing/
  SKILL.md
```

> Codex detects skills from `~/.agents/skills` (user-scoped) and `.agents/skills` inside repos (repo-scoped).  
> This repo is designed so you can install by copying or symlinking these folders into one of those locations.

---

## Install

### Terminology

- **Global install** (aka *user-scoped*): install skills for your user on this machine  
  → `~/.agents/skills/`
- **Repo install** (aka *repo-scoped*): install skills for a specific codebase  
  → `<repo-root>/.agents/skills/`

> Optional / legacy: some setups use `.codex/skills/` instead of `.agents/skills/`. The installer supports both.

---

### macOS / Linux

#### 1) Clone
```bash
git clone <YOUR_PUBLIC_REPO_URL>
cd datasaa-skills
```

#### 2) Global install (recommended)
Default mode is **symlink** (so `git pull` updates skills automatically):
```bash
./install.sh global
```

Copy instead of symlink:
```bash
./install.sh global --copy
```

#### 3) Repo install (vendor into a project)
From inside the target repo:
```bash
./path/to/datasaa-skills/install.sh repo
```

Or specify a repo target explicitly:
```bash
./install.sh repo --target ~/code/my-product
```

#### 4) Restart Codex
Codex loads skills at startup. Restart your Codex CLI/app.

#### 5) Verify
In Codex:
- Run `/skills`, or
- Invoke directly: `$datasaa-problem-framing`

---

### Windows (PowerShell)

#### 1) Clone
```powershell
git clone <YOUR_PUBLIC_REPO_URL>
cd datasaa-skills
```

#### 2) Global install
```powershell
.\install.ps1 -Scope global
```

#### 3) Repo install
```powershell
.\install.ps1 -Scope repo
```

> Note: symlinks on Windows may require Administrator privileges or Developer Mode.  
> If you try `-Mode link` and it fails, the script will fall back to copy.

#### 4) Restart + verify
- Restart Codex
- In Codex: `/skills` or `$datasaa-problem-framing`

---

## Installer usage

### `install.sh` (macOS/Linux)

```bash
./install.sh global [--copy|--link] [--agents|--codex] [--dest <path>]
./install.sh repo   [--copy|--link] [--agents|--codex] [--target <repo>] [--dest <path>]
```

Examples:
```bash
./install.sh global
./install.sh global --copy
./install.sh repo
./install.sh repo --target ~/code/my-product
./install.sh global --codex
./install.sh repo --dest ~/code/my-product/.agents/skills
```

### `install.ps1` (Windows)

```powershell
.\install.ps1 -Scope global [-Mode copy|link]
.\install.ps1 -Scope repo   [-Mode copy|link] [-Target C:\path\to\repo]
```

---

## Updating

- If you installed with **symlinks** (default for `global` on macOS/Linux):  
  just `git pull` in this repo and restart Codex if needed.
- If you installed with **copy**:  
  re-run the installer to overwrite the installed skill folders.

---

## Troubleshooting

### Skills don’t show up
- Restart Codex (skills are loaded at startup).
- Confirm the destination contains folders like:
  - `~/.agents/skills/datasaa-*/SKILL.md` (global), or
  - `<repo>/.agents/skills/datasaa-*/SKILL.md` (repo)
- Confirm the file name is exactly `SKILL.md`.
- Confirm `SKILL.md` starts with YAML front matter:
  ```yaml
  ---
  name: datasaa-problem-framing
  description: "..."
  ---
  ```

### “mapfile: command not found” on macOS
You’re running an old Bash 4+ script on macOS’s default Bash 3.2.

Fix:
- Use the latest `install.sh` from this repo (bash 3.2 compatible), or
- Install a newer bash via Homebrew and run:
  ```bash
  /opt/homebrew/bin/bash ./install.sh global
  ```

### Symlink problems
Some environments restrict symlinks. Use copy mode:
```bash
./install.sh global --copy
```

---

## Included skills

- `datasaa-problem-framing`
- `datasaa-user-value-modeling`
- `datasaa-product-discovery`
- `datasaa-system-decomposition`
- `datasaa-tradeoff-reasoning`
- `datasaa-data-centric-design`
- `datasaa-ml-systemization`
- `datasaa-agent-orchestration`
- `datasaa-human-in-the-loop-design`
- `datasaa-code-quality-enforcement`
- `datasaa-system-observability`
- `datasaa-iterative-delivery`


