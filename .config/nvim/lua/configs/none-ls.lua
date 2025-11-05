local null_ls = require "null-ls"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local opts = {
  sources = {
    -- Formatters
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.prisma_format,
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.goimports_reviser,
    -- null_ls.builtins.formatting.biome   -- Filetypes: { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "jsonc", "css", "graphql" }
    null_ls.builtins.formatting.stylua, -- Lua formatter
    -- null_ls.builtins.formatting.black, -- Python formatter
    null_ls.builtins.formatting.ruff, -- Python formatter
    null_ls.builtins.formatting.mypy, -- Python formatter

    -- Linters
    -- null_ls.builtins.diagnostics.biome,
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.diagnostics.djlint,
    null_ls.builtins.diagnostics.shellcheck,
  },
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      }
    end
  end,
}

return opts
