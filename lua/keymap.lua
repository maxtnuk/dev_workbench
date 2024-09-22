local keymap = require "core.keymap"
local nmap, imap, cmap, xmap = keymap.nmap, keymap.imap, keymap.cmap, keymap.xmap
local tmap = keymap.tmap
local vmap = keymap.vmap
local silent, noremap = keymap.silent, keymap.noremap
local opts = keymap.new_opts
local cmd = keymap.cmd

-- Use space as leader key
vim.g.mapleader = ","

--- leaderkey
nmap { ",", "", opts(noremap) }
xmap { ",", "", opts(noremap) }

tmap { "<Esc>", "<C-\\><C-n>", opts(noremap) }
