-- This file can be loaded by calling `lua require('plugins')` from your init.vim


local api = vim.api
local cmd = vim.cmd
local map = vim.keymap.set


return require('packer').startup(function(use)
  -- Packer can manage itself
  use({ "wbthomason/packer.nvim", opt = true })

  -- lsp config for elixir-ls support
  use {'neovim/nvim-lspconfig'}
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim"
  }
  use({ "elixir-tools/elixir-tools.nvim", tag = "stable", requires = { "nvim-lua/plenary.nvim" }})
  use 'simrat39/rust-tools.nvim'
  use 'puremourning/vimspector'

  use({
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-vsnip" },
      { "hrsh7th/vim-vsnip" },
    },
  })

  use({
    "folke/todo-comments.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
    },
  })

  use({
    "folke/trouble.nvim",
    requires = {
      { "nvim-tree/nvim-web-devicons" },
    },
  })

  use {'hrsh7th/cmp-nvim-lua'}
  use {'hrsh7th/cmp-nvim-lsp-signature-help'}
  use {'jose-elias-alvarez/null-ls.nvim'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-path'}
  use {'hrsh7th/cmp-cmdline'}

  use {'hrsh7th/vim-vsnip'}
  use {'hrsh7th/cmp-vsnip'}

  -- treesitter for syntax highlighting and more
  use {'nvim-treesitter/nvim-treesitter'}

  use({
    "scalameta/nvim-metals",
    requires = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
    },
  })

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use { 'nvim-tree/nvim-web-devicons' }

  require('nvim-autopairs').setup({
    disable_filetype = { "vim" },
  })

  -- If you want insert `(` after select function or method item
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  local cmp = require('cmp')
  cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
  )

  if packer_bootstrap then
    require('packer').sync()
  end
end)


