-- `on_attach` callback will be called after a language server
-- instance has been attached to an open buffer with matching filetype
-- here we're setting key mappings for hover documentation, goto definitions, goto references, etc
-- you may set those key mappings based on your own preference
local on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true }

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gdl', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gm', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>sh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>fo', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>of', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local elixir = require("elixir")
local elixirls = require("elixir.elixirls")

require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "elixirls" },
}

elixir.setup {
  nextls = {
    enable = false, -- defaults to false
    port = 9000, -- connect via TCP with the given port. mutually exclusive with `cmd`. defaults to nil
    cmd = "path/to/next-ls", -- path to the executable. mutually exclusive with `port`
    version = "0.5.0", -- version of Next LS to install and use. defaults to the latest version
    on_attach = function(client, bufnr)
      -- custom keybinds
    end
  },
  credo = {
    enable = false, -- defaults to true
    port = 9000, -- connect via TCP with the given port. mutually exclusive with `cmd`. defaults to nil
    cmd = "path/to/credo-language-server", -- path to the executable. mutually exclusive with `port`
    version = "0.1.0-rc.3", -- version of credo-language-server to install and use. defaults to the latest release
    on_attach = function(client, bufnr)
      -- custom keybinds
    end
  },
  elixirls = {
    -- specify a repository and branch
    repo = "mhanberg/elixir-ls", -- defaults to elixir-lsp/elixir-ls
    branch = "mh/all-workspace-symbols", -- defaults to nil, just checkouts out the default branch, mutually exclusive with the `tag` option
    tag = "v0.14.6", -- defaults to nil, mutually exclusive with the `branch` option

    -- alternatively, point to an existing elixir-ls installation (optional)
    -- not currently supported by elixirls, but can be a table if you wish to pass other args `{"path/to/elixirls", "--foo"}`
    cmd = "/Users/manmohankrishna/.elixir-ls/release/language_server.sh",

    -- default settings, use the `settings` function to override settings
    settings = elixirls.settings {
      dialyzerEnabled = true,
      fetchDeps = false,
      enableTestLenses = false,
      suggestSpecs = false,
    },
    on_attach = function(client, bufnr)
      vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
      vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
      vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
    end
  }
}

require('lspconfig').elixirls.setup {
  -- cmd = { "/Users/manmohankrishna/.elixir-ls/scripts/language_server.sh" },
  cmd = { "/Users/manmohankrishna/.elixir-ls/release/language_server.sh" },
  on_attach = on_attach,
  capabilities = capabilities
}

local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      -- setting up snippet engine
      -- this is for vsnip, if you're using other
      -- snippet engine, please refer to the `nvim-cmp` guide
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    { name = 'buffer' }
  })
})


require'nvim-treesitter.configs'.setup {
  ensure_installed = {"elixir", "heex", "eex"}, -- only install parsers for elixir and heex
  -- ensure_installed = "all", -- install parsers for all supported languages
  sync_install = false,
  ignore_install = { },
  highlight = {
    enable = true,
    disable = { },
  },
}

vim.lsp.set_log_level("debug")
