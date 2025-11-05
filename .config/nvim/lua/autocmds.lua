local autocmd = vim.api.nvim_create_autocmd
local api = require "nvim-tree.api"

local function open_nvim_tree_on_startup()
  -- Check if Neovim was started with arguments (files or directories)
  local args = vim.fn.argv()

  if #args == 0 then
    return
  end
  if #args > 0 then
    -- If an argument is provided, set the root to that directory
    local arg_path = vim.loop.fs_realpath(args[1])
    if not arg_path then
      print("Invalid path: " .. args[1])
      return
    end
    local path = vim.fn.fnamemodify(arg_path, ":p:h")
    vim.fn.chdir(path) -- Change Neovim's working directory
    api.tree.change_root(path) -- Change NvimTree's root
  end
  -- Open NvimTree but keep cursor on the buffer
  api.tree.open()
  -- vim.cmd "wincmd l" -- Move cursor to the right (buffer)
  -- vim.cmd "enew"
end

local function edit_or_open()
  local node = api.tree.get_node_under_cursor()
  if node.nodes ~= nil then
    api.node.open.edit() -- Expand or collapse folder
  else
    api.node.open.edit() -- Open file
    -- api.tree.close()     -- Close the tree after opening a file
  end
end

local function vsplit_preview()
  local node = api.tree.get_node_under_cursor()
  api.node.open.vertical()
  if node and node.nodes ~= nil then
    api.node.open.edit() -- Expand or collapse folder
  else
    api.node.open.vertical() -- Open file in vertical split
  end
  api.tree.focus() -- Refocus on the tree
end

local function bind_nvim_tree(bufnr)
  -- local opts = { noremap = true, silent = true }
  local map = vim.keymap.set
  map("n", "l", edit_or_open, { noremap = true, buffer = bufnr, silent = true, desc = "Edit or Open" })
  map("n", "L", vsplit_preview, { noremap = true, buffer = bufnr, silent = true, desc = "Vsplit Preview" })
  map("n", "h", api.tree.close, { noremap = true, buffer = bufnr, silent = true, desc = "Collapse Folder " })
  map(
    "n",
    "H",
    api.tree.collapse_all,
    { noremap = true, buffer = bufnr, silent = true, desc = "Collapse all folders in NvimTree" }
  )
end

autocmd("VimEnter", {
  callback = open_nvim_tree_on_startup,
})

autocmd("FileType", {
  pattern = "NvimTree",
  callback = function(args)
    bind_nvim_tree(args.buf)
  end,
})
