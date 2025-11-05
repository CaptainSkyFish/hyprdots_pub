dofile(vim.g.base46_cache .. "nvimtree")
local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.5

return {
  filters = { dotfiles = false },
  disable_netrw = true,
  hijack_cursor = true,
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  reload_on_bufenter = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  view = {
    float = {
      enable = false,
      quit_on_focus_loss = true,
      open_win_config = function()
        local screen_w = vim.opt.columns:get()
        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
        local window_w = screen_w * WIDTH_RATIO
        local window_h = screen_h * HEIGHT_RATIO
        local window_w_int = math.floor(window_w)
        local window_h_int = math.floor(window_h)
        local center_x = (screen_w - window_w) / 2
        local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
        return {
          border = "rounded",
          relative = "editor",
          row = center_y,
          col = center_x,
          width = window_w_int,
          height = window_h_int,
        }
      end,
    },
    width = 30,
    -- width = function()
    --   return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
    -- end,
    preserve_window_proportions = true,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  renderer = {
    indent_width = 2,
    hidden_display = "all",
    root_folder_label = function(path)
      return vim.fn.fnamemodify(path, ":t") -- Extracts the last part of the path (folder name)
    end,
    highlight_git = true,
    indent_markers = {
      enable = true,
      icons = {
        corner = "╰",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
    icons = {
      glyphs = {
        default = "󰈚",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
}
