local M = {}

M.dapui = {
  n = {
    ["<leader>tb"] = {
      function()
        require("dapui").toggle()
      end,
      "toggle debugger view",
    },
  },
}

return M
