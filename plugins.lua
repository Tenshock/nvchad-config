local plugins = {
  {
    -- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
    -- :TSInstallInfo  - List information about currently installed parsers
    -- :TSUpdate       - Update parsers
    -- :h nvim-treesitter-commands - list all available commands
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "lua",

        -- dev languages
        "rust",
        "java",
        "typescript",

        -- templating, markup languages
        "markdown_inline", -- experimental, use "markdown" if issues
        "yaml",
        "toml",
        "json",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
        require "custom.configs.rust-tools"
      end,
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    opts = {
      git = {
        enable = true,
        ignore = false,
      },
      renderer = {
        highlight_git = true,
        indent_markers = {
          enable = false,
        },
        icons = {
          show = {
            git = true,
          },
        },
      },
      on_attach = require "custom.configs.nvim-tree",
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSP
        "lua-language-server",
        "marksman",
        "rust-analyzer",
        "yaml-language-server",
        "jdtls", -- or try "java-language-server",
        "typescript-language-server",

        -- DAP
        "codelldb",

        -- Formater
        "stylua",
        "yamlfmt",
        "google-java-format",
        "prettierd",

        -- Linter
        "hadolint",
        "eslint_d",
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    cmd = {
      "DapToggleBreakpoint",
      "DapToggleRepl",
      "DapContinue",
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      local lua_conf = require "custom.configs.dapui"
      require("dapui").setup(lua_conf)
    end,
  },
  "simrat39/rust-tools.nvim",
  { "rust-lang/rust.vim", lazy = false },
  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit" },
  },
}

return plugins
