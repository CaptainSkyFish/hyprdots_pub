require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!
--
o.number = true
o.relativenumber = true

-- More comprehensive line wrapping settings
o.wrap = true -- Enable visual line wrapping
o.linebreak = true -- Wrap at word boundaries when possible
o.breakindent = true -- Maintain indent level on wrapped lines
o.showbreak = "↪ " -- Show indicator at the start of wrapped lines
o.sidescroll = 1 -- Smoother horizontal scrolling
o.sidescrolloff = 5 -- Start scrolling 5 columns before edge

o.undofile = true -- enable undofile
local undo_dir = vim.fn.stdpath "data" .. "/undo//"
o.undodir = undo_dir
vim.fn.mkdir(undo_dir, "p")
