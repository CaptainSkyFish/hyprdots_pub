dofile(vim.g.base46_cache .. "mason")
--
--
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

mason.setup()

mason_lspconfig.setup({
  ensure_installed = {
    -- TypeScript, JavaScript, React
    "ts_ls",
    "eslint",

    -- HTML, CSS
    "html",
    "cssls",
    "tailwindcss",

    -- C, C++
    "clangd",

    -- Python
    "pyright",
    "ruff",

    -- Lua
    "lua_ls",

    -- Prisma
    "prismals",

    -- Rust
    "rust_analyzer",
    
    -- Markdown
    "marksman",
  },
  automatic_installation = true, })

return {
  PATH = "skip",

  ui = {
    border = "rounded",
    icons = {
      package_pending = " ",
      package_installed = " ",
      package_uninstalled = " ",
    },
  },

  max_concurrent_installers = 10,
}

