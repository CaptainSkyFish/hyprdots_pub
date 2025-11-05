require "nvchad.mappings"

-- add yours here
-- local M = {}
--
-- M.general = {
--   n= {
--     ["<C-h>"] = "<cmd> TmuxNavigateLeft<CR>", "window left" },
--     ["<C-l>"] = "<cmd> TmuxNavigateRight<CR>", "window right" },
--     ["<C-j>"] = "<cmd> TmuxNavigateDown<CR>", "window down" },
--     ["<C-k>"] = "<cmd> TmuxNavigateUp<CR>", "window up" },
--   }
-- }

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "tmux window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "tmux window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "tmux window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "tmux window up" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
--
--
--
--
map("n", "<C-t>", function()
  require("nvchad.themes").open { border = true }
end, {})
--
--
-- local api = require("nvim-tree.api")
map("n", "<C-n>", ":NvimTreeToggle<cr>", { silent = true, noremap = true, desc = "Toggle NvimTree" })

-- alt+arrow keys
map("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true, desc = "Moves the current line up." })
map("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true, desc = "Moves the current line don." })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Moves the current line up." })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Moves the current line down." })

map("n", "<leader>u", "<cmd>lua require('undotree').toggle()<cr>", { desc = "Toggle UndoTree" })

map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true, desc = "Hover Docs" })
map("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { silent = true, desc = "Go to Definition" })
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true, desc = "Code Actions" })
map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true, desc = "Rename Symbol" })
map("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true, desc = "Show Diagnostics" })
map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true, desc = "Prev Diagnostic" })
map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true, desc = "Next Diagnostic" })

map("n", "<leader>gsj", "<cmd> GoTagAdd json <CR>", { desc = "Add json struct tags" })
map("n", "<leader>gsy", "<cmd> GoTagAdd yaml <CR>", { desc = "Add yaml struct tags" })
