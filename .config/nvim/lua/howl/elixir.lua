-- `on_attach` callback will be called after a language server
-- instance has been attached to an open buffer with matching filetype
-- here we're setting key mappings for hover documentation, goto definitions, goto references, etc
-- you may set those key mappings based on your own preference
local on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true }
  
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').elixirls.setup {
  cmd = { "/Users/manmohankrishna/.elixir-ls/release/language_server.sh" },
  on_attach = on_attach,
  capabilities = capabilities
}


vim.lsp.set_log_level("debug")

