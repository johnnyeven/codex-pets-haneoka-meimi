#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
CODEX_HOME_DIR="${CODEX_HOME:-"$HOME/.codex"}"
PETS_DIR="$CODEX_HOME_DIR/pets"
EXCLUDED_DIRS=("runs")

is_excluded_dir() {
  local dir_name="$1"

  for excluded in "${EXCLUDED_DIRS[@]}"; do
    if [[ "$dir_name" == "$excluded" ]]; then
      return 0
    fi
  done

  return 1
}

usage() {
  cat <<'EOF'
Usage: scripts/sync-pets.sh

把当前仓库中的 Codex 宠物包复制同步到 ${CODEX_HOME:-$HOME/.codex}/pets。

有效宠物包需要位于仓库一级子目录中，并同时包含：
  - pet.json
  - spritesheet.webp
EOF
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

mkdir -p "$PETS_DIR"

found=0
failed=0

for pet_json in "$REPO_ROOT"/*/pet.json; do
  [[ -e "$pet_json" ]] || continue

  pet_dir="$(cd "$(dirname "$pet_json")" && pwd)"
  pet_name="$(basename "$pet_dir")"
  if is_excluded_dir "$pet_name"; then
    continue
  fi

  spritesheet="$pet_dir/spritesheet.webp"
  target="$PETS_DIR/$pet_name"
  found=1

  if [[ ! -f "$spritesheet" ]]; then
    echo "跳过 $pet_name：缺少 spritesheet.webp" >&2
    failed=1
    continue
  fi

  if [[ -e "$target" && ! -L "$target" && ! -f "$target/pet.json" ]]; then
    echo "冲突：$target 已存在，但看起来不是由本脚本管理的宠物包，请手动处理后重试。" >&2
    failed=1
    continue
  fi

  tmp_target="$PETS_DIR/.$pet_name.tmp.$$"
  rm -rf "$tmp_target"
  mkdir -p "$tmp_target"
  cp -R "$pet_dir/." "$tmp_target/"

  rm -rf "$target"
  mv "$tmp_target" "$target"
  echo "已同步：$pet_name -> $target"
done

if [[ "$found" -eq 0 ]]; then
  echo "未找到可同步的宠物包。需要一级子目录同时包含 pet.json 和 spritesheet.webp。" >&2
  exit 1
fi

if [[ "$failed" -ne 0 ]]; then
  exit 1
fi
