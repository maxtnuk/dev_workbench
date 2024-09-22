#!/bin/bash

set -ex
BASE_DIR=$(dirname $(realpath $0))
nvim_path="${BASE_DIR}/../tools/nvim"

cp -r ${nvim_path}/* ~/.config/nvim
rm -rf ~/.config/nvim/.git
