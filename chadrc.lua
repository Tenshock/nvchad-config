local M = {}

M.ui = {
  theme = 'github_dark',
  statusline = {
    theme = "minimal",
    separator_style = "block",
  }
}

M.plugins = "custom.plugins"

M.mappings = require("custom.mappings")

return M
