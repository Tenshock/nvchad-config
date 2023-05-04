local M = {}

M.ui = {
  theme = "github_dark",
  lsp_semantic_tokens = true,
  statusline = {
    theme = "minimal",
    separator_style = "block",
  },
  tabufline = {
    lazyload = false,
  },
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
