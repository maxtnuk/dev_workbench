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
nmap { "<Space>", "<Esc>:", opts(noremap) }
imap { "<C-;>", "<Esc>", opts(noremap) }

nmap {
  -- noremal remap
  -- vertical split
  { "vs", cmd "vsplit", opts(noremap) },
  -- close buffer
  { "<C-x>k", cmd "bdelete", opts(noremap, silent) },
  -- save
  { "<C-s>", cmd "write", opts(noremap) },
  -- yank
  { "Y", "y$", opts(noremap) },
  -- toggle tree
  { "<F2>", cmd "Neotree toggle", opts(noremap) },
  -- spectre
  { "<Leader>S", cmd "Spectre open", opts(noremap) },
  { "<Leader>sw", cmd "Spectre open_visual {select_word=true}", opts(noremap) },
  { "<Leader>sp", cmd "Spectre open_file_search", opts(noremap) },
  -- comment
  { "<A-/>", cmd "CommentToggle", opts(noremap, silent) },
  -- diff view
  { "<Leader>dh", cmd "DiffviewFileHistory %", opts(noremap, silent) },
  { "<Leader>fl", cmd "Flog", opts(noremap, silent) },
  { "<Leader>do", cmd "DiffviewOpen", opts(noremap, silent) },
  { "<Leader>dc", cmd "DiffviewClose", opts(noremap, silent) },
  -- terminal
  { "tt", cmd 'ToggleTerm size=20 direction="horizontal" shell="zsh" ', opts(noremap, silent) },
  -- buffer jump
  { "]b", cmd "bn", opts(noremap) },
  { "[b", cmd "bp", opts(noremap) },
  { "<Leader>sc", cmd "set spell!", opts(noremap, silent) },
  -- remove trailing white space
  { "<Leader>t", cmd "TrimTrailingWhitespace", opts(noremap) },
  -- window jump
  { "<A-Left>", "<C-w>h", opts(noremap) },
  { "<A-Right>", "<C-w>l", opts(noremap) },
  { "<A-Down>", "<C-w>j", opts(noremap) },
  { "<A-Up>", "<C-w>k", opts(noremap) },
  { "<A-q>", "<C-w>q", opts(noremap) },
  { "<F3>", cmd "KeySeer", opts(noremap) },
  -- quite all
  { "qq", cmd "qa", opts(noremap) },
}

-- Telescope
nmap {
  { "<Leader>ff", cmd "Telescope find_files", opts(noremap) },
  { "<Leader><Leader>", cmd "Telescope oldfiles", opts(noremap, silent) },
  { "<Leader>lg", cmd "Telescope live_grep", opts(noremap) },
}

-- VGit setting
nmap {
  { "<C-k>", cmd "VGit hunk_up", opts(noremap) },
  { "<C-j>", cmd "VGit hunk_down", opts(noremap) },
  { "<Leader>gs", cmd "VGit buffer_hunk_stage", opts(noremap) },
  { "<Leader>gr", cmd "VGit buffer_hunk_reset", opts(noremap) },
  { "<Leader>gp", cmd "VGit buffer_hunk_preview", opts(noremap) },
  { "<Leader>gb", cmd "VGit buffer_blame_preview", opts(noremap) },
  { "<Leader>gf", cmd "VGit buffer_diff_preview", opts(noremap) },
  { "<Leader>gh", cmd "VGit buffer_history_preview", opts(noremap) },
  { "<Leader>gu", cmd "VGit buffer_reset", opts(noremap) },
  { "<Leader>gg", cmd "VGit buffer_gutter_blame_preview", opts(noremap) },
  { "<Leader>glu", cmd "VGit buffer_hunks_preview", opts(noremap) },
  { "<Leader>gls", cmd "VGit project_hunks_staged_preview", opts(noremap) },
  { "<Leader>gd", cmd "VGit project_diff_preview", opts(noremap) },
  { "<Leader>gq", cmd "VGit project_hunks_qf", opts(noremap) },
  { "<Leader>gx", cmd "VGit toggle_diff_preference", opts(noremap) },
}

-- barbar keymap
nmap {
  { "<A-,>", cmd "BufferPrevious", opts(noremap, silent) },
  { "<A-.>", cmd "BufferNext", opts(noremap, silent) },
  { "<A-<>", cmd "BufferMovePrevious", opts(noremap, silent) },
  { "<A->>", cmd "BufferMoveNext", opts(noremap, silent) },
  { "<A-c>", cmd "BufferClose", opts(noremap, silent) },
  { "<A-p>", cmd "BufferPin", opts(noremap, silent) },
}

-- lang setting
nmap {
  { "K", cmd "RustLsp hover actions", opts(noremap, silent) },
  { "<Leader>A", cmd "RustLsp codeAction", opts(noremap, silent) },
  { "ee", cmd "RustLsp explainError", opts(noremap, silent) },
  { "D", cmd "RustLsp renderDiagnostic", opts(noremap, silent) },
  { "R", cmd "RustLsp relatedDiagnostics", opts(noremap, silent) },
  { "em", cmd "RustLsp expandMacro", opts(noremap, silent) },
  { "od", cmd "RustLsp openDocs", opts(noremap, silent) },
  { "pm", cmd "RustLsp parentModule", opts(noremap, silent) },
  { "st", cmd "RustLsp syntaxTree", opts(noremap, silent) },
  { "vh", cmd "RustLsp view hir", opts(noremap, silent) },
  { "vm", cmd "RustLsp view mir", opts(noremap, silent) },
  -- debug
  { "<Leader>bb", cmd 'lua require"dap".toggle_breakpoint()', opts(noremap, silent) },
  { "<F9>", cmd 'lua require"dap".step_into()', opts(noremap, silent) },
  { "<F8>", cmd 'lua require"dap".step_over()', opts(noremap, silent) },
  { "<F10>", cmd 'lua require"dap".step_out()', opts(noremap, silent) },
  { "<F5>", cmd 'lua require"dap".continue()', opts(noremap, silent) },
  { "<Leader>dd", cmd 'lua require"dapui".toggle()', opts(noremap, silent) },
}

-- commandline remap
cmap { "<C-b>", "<Left>", opts(noremap) }
