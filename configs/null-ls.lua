local null_ls = require "null-ls"

-- See https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local sources = {
  formatting.stylua,
  formatting.google_java_format,
  formatting.prettierd,
  formatting.yamlfmt.with {
    args = { "-formatter", "retain_line_breaks=true", "-" },
  },

  -- formatting.
  lint.shellcheck,
  lint.hadolint,

  code_actions.eslint_d,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
