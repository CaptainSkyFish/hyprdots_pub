require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "lua_ls",
  "clangd",
  "ts_ls",
  "pyright",
  "rust_analyzer",
  "tailwindcss",
  "marksman",
  "bash_language_server",
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
