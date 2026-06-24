#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SCRIPT="$REPO_ROOT/scripts/sync-pets.sh"
TMP_DIR="$(mktemp -d)"
RUNS_PET_JSON="$REPO_ROOT/runs/pet.json"
RUNS_SPRITESHEET="$REPO_ROOT/runs/spritesheet.webp"

cleanup() {
  rm -f "$RUNS_PET_JSON" "$RUNS_SPRITESHEET"
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

assert_copied_pet() {
  local pet_path="$1"

  if [[ ! -d "$pet_path" ]]; then
    echo "Expected copied pet directory: $pet_path" >&2
    exit 1
  fi

  if [[ -L "$pet_path" ]]; then
    echo "Expected real directory, got symlink: $pet_path" >&2
    exit 1
  fi

  if [[ ! -f "$pet_path/pet.json" || ! -f "$pet_path/spritesheet.webp" ]]; then
    echo "Expected pet.json and spritesheet.webp in: $pet_path" >&2
    exit 1
  fi
}

CODEX_HOME="$TMP_DIR/codex-home" "$SCRIPT"

assert_copied_pet "$TMP_DIR/codex-home/pets/meimi"
assert_copied_pet "$TMP_DIR/codex-home/pets/meimi-casual"
assert_copied_pet "$TMP_DIR/codex-home/pets/meimi-st-tail"

mkdir -p "$REPO_ROOT/runs"
printf '{"name":"runs should not sync"}\n' > "$RUNS_PET_JSON"
printf 'not a real spritesheet\n' > "$RUNS_SPRITESHEET"
CODEX_HOME="$TMP_DIR/codex-home" "$SCRIPT"
if [[ -e "$TMP_DIR/codex-home/pets/runs" ]]; then
  echo "Expected sync to skip the runs workspace directory" >&2
  exit 1
fi

touch "$TMP_DIR/codex-home/pets/meimi/stale-file"
CODEX_HOME="$TMP_DIR/codex-home" "$SCRIPT"
assert_copied_pet "$TMP_DIR/codex-home/pets/meimi"
if [[ -e "$TMP_DIR/codex-home/pets/meimi/stale-file" ]]; then
  echo "Expected repeated sync to remove stale files" >&2
  exit 1
fi

CONFLICT_HOME="$TMP_DIR/conflict-home"
mkdir -p "$CONFLICT_HOME/pets/meimi"
if CODEX_HOME="$CONFLICT_HOME" "$SCRIPT" >"$TMP_DIR/sync-pets-conflict.out" 2>"$TMP_DIR/sync-pets-conflict.err"; then
  echo "Expected sync to fail on a non-symlink conflict" >&2
  exit 1
fi

echo "sync_pets_test: ok"
