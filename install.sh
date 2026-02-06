#!/usr/bin/env bash
set -euo pipefail

# datasaa skills installer for Codex (bash 3.2+ compatible; no `mapfile`)
#
# Usage:
#   ./install_v2.sh global [--copy|--link] [--agents|--codex] [--dest <path>]
#   ./install_v2.sh repo   [--copy|--link] [--agents|--codex] [--target <repo>] [--dest <path>]
#
# Scopes:
#   global = user-scoped install (default dest: ~/.agents/skills)
#   repo   = repo-scoped install (default dest: <repo-root>/.agents/skills)
#
# Dest styles:
#   --agents (default) -> .agents/skills
#   --codex            -> .codex/skills (for older setups)
#   --dest <path>      -> override destination completely
#
# Modes:
#   --link (symlink) is nice for global installs (git pull updates automatically)
#   --copy is nice for repo installs (vendor a snapshot)

usage() {
  cat <<'EOF'
datasaa skills installer

Usage:
  ./install_v2.sh global [--copy|--link] [--agents|--codex] [--dest <path>]
  ./install_v2.sh repo   [--copy|--link] [--agents|--codex] [--target <repo>] [--dest <path>]

Examples:
  ./install_v2.sh global
  ./install_v2.sh global --copy
  ./install_v2.sh global --codex
  ./install_v2.sh repo
  ./install_v2.sh repo --target ~/code/my-product
  ./install_v2.sh repo --codex
  ./install_v2.sh repo --dest ~/code/my-product/.agents/skills
EOF
}

SCOPE="${1:-}"
shift || true

if [[ -z "${SCOPE}" || "${SCOPE}" == "-h" || "${SCOPE}" == "--help" ]]; then
  usage
  exit 0
fi

MODE=""
TARGET=""
DEST_OVERRIDE=""
BASE_STYLE="agents"  # agents | codex

while [[ $# -gt 0 ]]; do
  case "$1" in
    --copy) MODE="copy"; shift ;;
    --link|--symlink) MODE="link"; shift ;;
    --target) TARGET="${2:-}"; shift 2 ;;
    --dest) DEST_OVERRIDE="${2:-}"; shift 2 ;;
    --agents) BASE_STYLE="agents"; shift ;;
    --codex) BASE_STYLE="codex"; shift ;;
    *) echo "Unknown arg: $1" >&2; usage; exit 2 ;;
  esac
done

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Determine where the skill folders live (support either:
#  - repo root contains datasaa-*/SKILL.md
#  - or repo contains .agents/skills/datasaa-*/SKILL.md
SKILLS_ROOT="${SCRIPT_DIR}"
if [[ -d "${SCRIPT_DIR}/.agents/skills" ]]; then
  if find "${SCRIPT_DIR}/.agents/skills" -maxdepth 1 -type f -name "SKILL.md" >/dev/null 2>&1; then
    SKILLS_ROOT="${SCRIPT_DIR}/.agents/skills"
  fi
fi

# Gather skill directories (bash 3.2 compatible)
VALID_SKILLS=()
while IFS= read -r d; do
  if [[ -f "${d}/SKILL.md" ]]; then
    VALID_SKILLS+=("${d}")
  fi
done < <(find "${SKILLS_ROOT}" -maxdepth 1 -type d -name "datasaa-*" -print | sort)

if [[ ${#VALID_SKILLS[@]} -eq 0 ]]; then
  echo "No skills found. Expected folders like:" >&2
  echo "  ${SKILLS_ROOT}/datasaa-*/SKILL.md" >&2
  echo "" >&2
  echo "Tip: Ensure you have the Codex structure: each skill is a folder with SKILL.md." >&2
  exit 3
fi

# Resolve destination
DEST=""
if [[ -n "${DEST_OVERRIDE}" ]]; then
  DEST="${DEST_OVERRIDE}"
else
  if [[ "${BASE_STYLE}" == "codex" ]]; then
    BASE_PATH=".codex/skills"
  else
    BASE_PATH=".agents/skills"
  fi

  case "${SCOPE}" in
    global|user)
      DEST="${HOME}/${BASE_PATH}"
      [[ -z "${MODE}" ]] && MODE="link"
      ;;
    repo)
      [[ -z "${MODE}" ]] && MODE="copy"
      if [[ -n "${TARGET}" ]]; then
        REPO_ROOT="${TARGET}"
      else
        if command -v git >/dev/null 2>&1 && git rev-parse --show-toplevel >/dev/null 2>&1; then
          REPO_ROOT="$(git rev-parse --show-toplevel)"
        else
          REPO_ROOT="$(pwd)"
        fi
      fi
      DEST="${REPO_ROOT}/${BASE_PATH}"
      ;;
    *)
      echo "Unknown scope: ${SCOPE}" >&2
      usage
      exit 2
      ;;
  esac
fi

mkdir -p "${DEST}"

echo "Installing datasaa skills from: ${SKILLS_ROOT}"
echo "Installing to:            ${DEST}"
echo "Install mode:             ${MODE}"
echo "Base style:               ${BASE_STYLE}"
echo

for src in "${VALID_SKILLS[@]}"; do
  name="$(basename "${src}")"
  dst="${DEST}/${name}"

  if [[ "${MODE}" == "link" ]]; then
    rm -rf "${dst}" 2>/dev/null || true
    ln -sfn "${src}" "${dst}"
    echo "linked  ${name}"
  else
    rm -rf "${dst}" 2>/dev/null || true
    cp -R "${src}" "${DEST}/"
    echo "copied  ${name}"
  fi
done

cat <<EOF

Done.

Next steps:
- Restart Codex so it reloads skills.
- In Codex CLI: run /skills or invoke a skill with \$datasaa-problem-framing

Notes:
- Codex expects each skill to be a folder containing SKILL.md with YAML front matter (name/description).
- If using --codex, skills are installed under .codex/skills instead of .agents/skills.

EOF
