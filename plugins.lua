local plugins = {
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
