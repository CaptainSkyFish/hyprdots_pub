-- Create this file at ~/.config/nvim/lua/custom/themes/kanso.lua

local M = {}

-- First, let's load the official kanso theme colors
local kanso_loaded, kanso = pcall(require, "kanso.colors")
local palette

if kanso_loaded then
  -- Use the theme's actual palette
  palette = kanso.setup() -- This should get the theme's colors
else
  -- Fallback colors if we can't load the theme
  vim.notify("Couldn't load kanso.nvim colors, using fallback palette", vim.log.levels.WARN)
  palette = {
    -- Fallback colors - replace with actual colors later
    bg = "#1a2026",
    fg = "#e4e9f0",
    -- Add more fallback colors here
  }
end

-- Map kanso colors to base46 format
M.base_30 = {
  white = palette.fg or "#e4e9f0",
  darker_black = palette.bg_dark or "#151a1f",
  black = palette.bg or "#1a2026", -- NvChad bg
  black2 = palette.bg_highlight or "#20262d",
  one_bg = palette.bg_alt or "#262c33",
  one_bg2 = palette.bg_alt2 or "#2d333a",
  one_bg3 = palette.bg_alt3 or "#343a41",
  grey = palette.gray or "#3d444b",
  grey_fg = palette.gray_alt or "#474e55",
  grey_fg2 = palette.gray_alt2 or "#52595f",
  light_grey = palette.light_gray or "#5c636a",
  red = palette.red or "#e76767",
  baby_pink = palette.pink_alt or "#f09292",
  pink = palette.pink or "#f07178",
  line = palette.line or "#2d333a",
  green = palette.green or "#96c56f",
  vibrant_green = palette.green_alt or "#b6de91",
  nord_blue = palette.blue_alt or "#88abf9",
  blue = palette.blue or "#6e9ef7",
  yellow = palette.yellow or "#e5c76b",
  sun = palette.yellow_alt or "#ffd15c",
  purple = palette.purple or "#ba95e5",
  dark_purple = palette.purple_alt or "#a374df",
  teal = palette.teal or "#60b6b6",
  orange = palette.orange or "#f0906a",
  cyan = palette.cyan or "#72d5d2",
  statusline_bg = palette.statusline_bg or "#1e242a",
  lightbg = palette.lightbg or "#2d333a",
  pmenu_bg = palette.pmenu_bg or palette.green or "#96c56f",
  folder_bg = palette.folder_bg or palette.blue or "#6e9ef7",
}

-- Syntax highlighting colors
M.base_16 = {
  base00 = palette.bg or "#1a2026",
  base01 = palette.bg_highlight or "#20262d",
  base02 = palette.bg_alt or "#2d333a",
  base03 = palette.gray or "#3d444b",
  base04 = palette.light_gray or "#5c636a",
  base05 = palette.fg or "#e4e9f0",
  base06 = palette.fg_alt or "#e9edf5",
  base07 = palette.fg_alt2 or "#eef2f8",
  base08 = palette.red or "#e76767",
  base09 = palette.orange or "#f0906a",
  base0A = palette.yellow or "#e5c76b",
  base0B = palette.green or "#96c56f",
  base0C = palette.cyan or "#72d5d2",
  base0D = palette.blue or "#6e9ef7",
  base0E = palette.purple or "#ba95e5",
  base0F = palette.pink or "#c28aa6",
}

-- You can inspect the kanso palette in NvChad with a function
vim.api.nvim_create_user_command("InspectKansoPalette", function()
  vim.print(require("kanso.colors").setup())
end, {})

M.type = "dark" -- Set to "light" if kanso has a light variant

return M
