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
        "json"
      },
    },
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
    },
  },
}

return plugins
