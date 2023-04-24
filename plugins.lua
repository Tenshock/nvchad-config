local plugins = {
  {
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
        "jdtls",

        -- DAP
        "codelldb",

        -- Formater
        "rustfmt",
        "stylua",
        "yamlfmt",

        -- Linter
        "hadolint",
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
  {
    -- When the plugin load, it conflict with the lsp default conf. Hence, disabling lsp capabilities in the place of rust-tools ones
    "simrat39/rust-tools.nvim",
    dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
    cmd = { "RustDebuggables" },
    opts = function()
      local extension_path = vim.env.HOME .. "/.local/share/nvim/mason/packages/codelldb/extension/"
      local codelldb_path = extension_path .. "adapter/codelldb"
      local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
      return {
        dap = { adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path) },
      }
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit" },
  },
}

return plugins
