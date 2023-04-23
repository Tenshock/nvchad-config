local function my_on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', '<Tab>', '', { buffer = bufnr })
  vim.keymap.del('n', '<Tab>', { buffer = bufnr })
  vim.keymap.set('n', '<', '', { buffer = bufnr })
  vim.keymap.del('n', '<', { buffer = bufnr })
end

return my_on_attach
