local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- Check https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers_default = {
  "lua_ls",
  "marksman",
  "jdtls", -- or try "java-language-server",
  "rust_analyzer",
  "tsserver",
  "sqlls",
}

for _, lsp in ipairs(servers_default) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- yamlls
lspconfig.yamlls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    yaml = {
      keyOrdering = false,
    },
  },
}
