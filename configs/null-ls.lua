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
  formatting.rustfmt.with {
    extra_args = function(params)
      local Path = require "plenary.path"
      local cargo_toml = Path:new(params.root .. "/" .. "Cargo.toml")

      if cargo_toml:exists() and cargo_toml:is_file() then
        for _, line in ipairs(cargo_toml:readlines()) do
          local edition = line:match [[^edition%s*=%s*%"(%d+)%"]]
          if edition then
            return { "--edition=" .. edition }
          end
        end
      end
      -- default edition when we don't find `Cargo.toml` or the `edition` in it.
      return { "--edition=2021" }
    end,
  },

  lint.shellcheck,
  lint.hadolint,

  code_actions.eslint_d,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
