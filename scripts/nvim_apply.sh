#!/bin/bash

set -ex
BASE_DIR=$(dirname "$(realpath "$0")")

while [[ "$(basename "$BASE_DIR")" != "scripts" && "$BASE_DIR" != "/" ]]; do
  BASE_DIR=$(dirname "$BASE_DIR")
done

if [[ "$(basename "$BASE_DIR")" != "scripts" ]]; then
  echo "scripts 디렉토리를 찾을 수 없습니다."
  exit 1
fi

BASE_DIR=$(dirname "$BASE_DIR")
nvim_path="${BASE_DIR}/tools/nvim"

cp -r ${nvim_path}/* ~/.config/nvim
rm -rf ~/.config/nvim/.git
