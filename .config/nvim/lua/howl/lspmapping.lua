----------------------------------
-- OPTIONS -----------------------
----------------------------------
-- global
local map = vim.keymap.set
vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }

-- LSP mappings
map("n", "<leader>cd",  vim.lsp.buf.definition)
map("n", "<leader>ct", vim.lsp.buf.declaration)
map("n", "K",  vim.lsp.buf.hover)
map("n", "<leader>ci", vim.lsp.buf.implementation)
map("n", "<leader>cD", vim.lsp.buf.references)
map("n", "<leader>cj", vim.lsp.buf.document_symbol)
map("n", "<leader>cJ", vim.lsp.buf.workspace_symbol)
map("n", "<leader>cll", vim.lsp.codelens.run)
map("n", "<leader>clhs", vim.lsp.buf.signature_help)
map("n", "<leader>cr", vim.lsp.buf.rename)
map("n", "<leader>cl=", vim.lsp.buf.format)
map("n", "<leader>ca", vim.lsp.buf.code_action)
map("n", "<leader>of", vim.diagnostic.open_float)

map("n", "<leader>ws", function()
  require("metals").hover_worksheet()
end)

-- all workspace diagnostics
map("n", "<leader>aa", vim.diagnostic.setqflist)
map("n", "<leader>cx", ':TroubleToggle<CR>')

-- all workspace errors
map("n", "<leader>ae", function()
  vim.diagnostic.setqflist({ severity = "E" })
end)

-- all workspace warnings
map("n", "<leader>aw", function()
  vim.diagnostic.setqflist({ severity = "W" })
end)

-- buffer diagnostics only
map("n", "<leader>di", vim.diagnostic.setloclist)

map("n", "[d", function()
  vim.diagnostic.goto_prev({ wrap = false })
end)

map("n", "]d", function()
  vim.diagnostic.goto_next({ wrap = false })
end)

-- Example mappings for usage with nvim-dap. If you don't use that, you can
-- skip these
map("n", "<leader>dc", function()
  require("dap").continue()
end)

map("n", "<leader>dr", function()
  require("dap").repl.toggle()
end)

map("n", "<leader>dK", function()
  require("dap.ui.widgets").hover()
end)

map("n", "<leader>dt", function()
  require("dap").toggle_breakpoint()
end)

map("n", "<leader>dso", function()
  require("dap").step_over()
end)

map("n", "<leader>dsi", function()
  require("dap").step_into()
end)

map("n", "<leader>dl", function()
  require("dap").run_last()
end)
