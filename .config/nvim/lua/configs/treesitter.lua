pcall(function()
  dofile(vim.g.base46_cache .. "syntax")
  dofile(vim.g.base46_cache .. "treesitter")
end)

return {
  ensure_installed = {
    "lua",
    "luadoc",
    "printf",
    "prisma",
    "vim",
    "vimdoc",
    "javascript",
    "typescript",
    "tsx",
    "html",
    "css",
    "rust",
    "go",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
  matchup = { enable = true },
}
