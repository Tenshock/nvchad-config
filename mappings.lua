local M = {}

M.general = {
  n = {
    ["<leader>tz"] = { "<cmd> :tabnext <CR>", "next tab" },
    ["<leader>ta"] = { "<cmd> :tabprev <CR>", "previous tab" },
    ["<leader>tt"] = { "<cmd> :tabnew <CR>", "new tab" },
    ["<leader>tw"] = { "<cmd> :tabclose <CR>", "close tab" },
  },
}

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

M.lazygit = {
  n = {
    ["<leader>gg"] = { "<cmd> :LazyGit <CR>", "open LazyGit" },
  },
}

return M
