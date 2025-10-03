local vscode = require "vscode"

-- keymap
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Treat underscore (_) as word separator
vim.opt.iskeyword:remove "_"
vim.opt.clipboard = "unnamedplus"
vim.g.clipboard = vim.g.vscode_clipboard
vim.notify = vscode.notify

-- remap leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- better indent handling
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- removes highlighting after escaping vim search
keymap("n", "<Esc>", "<Esc>:noh<CR>", opts)

-- general keymaps
keymap(
  { "n", "v" },
  "<leader>lf",
  function() vscode.action "editor.action.formatDocument" end,
  { noremap = true, silent = true }
)
keymap("n", "<leader>w", function() vscode.action "workbench.action.files.save" end, opts)
keymap("n", "<leader>e", function() vscode.action "workbench.view.explorer" end, opts)

keymap({ "n", "v" }, "<leader>b", "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>")
keymap({ "n", "v" }, "<leader>d", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>")
keymap({ "n", "v" }, "<leader>a", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
keymap({ "n", "v" }, "<leader>sp", "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>")
keymap({ "n", "v" }, "<leader>cn", "<cmd>lua require('vscode').action('notifications.clearAll')<CR>")
keymap({ "n", "v" }, "<leader>ff", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
keymap({ "n", "v" }, "<leader>cp", "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>")
