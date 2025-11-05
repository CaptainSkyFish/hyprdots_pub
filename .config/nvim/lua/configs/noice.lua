local colors = require("base46").get_theme_tb "base_30"
local theme = require("base46").get_theme_tb "base_16"

require("noice").setup {
  cmdline = {
    view = "cmdline_popup",
  },

  -- Override Noice views to match base46 style
  views = {
    cmdline_popup = {
      position = {
        row = "50%",
        col = "50%",
      },
      size = {
        width = 60,
        height = "auto",
      },
      border = {
        style = "rounded",
        padding = { 0, 1 },
        highlight = "FloatBorder",
      },
      win_options = {
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
      },
    },

    popupmenu = {
      relative = "editor",
      position = {
        row = "85%",
        col = "50%",
      },
      size = {
        width = 60,
        height = 10,
      },
      border = {
        style = "rounded",
        highlight = "FloatBorder",
      },
      win_options = {
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
      },
    },
  },

  -- Optional: enable lsp doc borders if needed
  presets = {
    lsp_doc_border = true,
  },
}
