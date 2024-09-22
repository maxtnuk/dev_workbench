#!/bin/bash

set -ex 

nvim_path=$(realpath ./tools/nvim)

cp -r ${nvim_path}/* ~/.config/nvim
rm -rf ~/.config/nvim/.git
