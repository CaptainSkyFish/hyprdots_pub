local hooks = require "core.hooks"

hooks.add("setup_theme", function()
  -- Dynamically load kanso theme
  local ok, custom_kanso = pcall(require, "custom.themes.kanso")
  if ok then
    require("base46").load_theme(custom_kanso)
  end
end)
