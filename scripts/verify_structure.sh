#!/usr/bin/env bash
set -euo pipefail

# Determine repository root relative to this script.
repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

required_paths=(
  "AGENTS.md"
  "Scientia est lux principium✨"
  "script"
)

recommended_paths=(
  "src"
  "tests"
  "assets"
)

status=0

printf "Repository structure audit (read-only)\n"
printf "Root: %s\n\n" "$repo_root"

for path in "${required_paths[@]}"; do
  if [ -e "$repo_root/$path" ]; then
    printf "[OK]   %s\n" "$path"
  else
    printf "[MISS] %s\n" "$path"
    status=1
  fi
done

for path in "${recommended_paths[@]}"; do
  if [ -e "$repo_root/$path" ]; then
    printf "[OK]   %s\n" "$path"
  else
    printf "[TODO] %s (create when scope requires it)\n" "$path"
  fi
done

exit "$status"
