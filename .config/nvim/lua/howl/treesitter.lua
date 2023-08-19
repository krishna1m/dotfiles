require'nvim-treesitter.configs'.setup {
  ensure_installed = {"elixir", "heex", "eex", "scala", "lua", "c", "rust", "toml"}, 
  -- ensure_installed = "all", -- install parsers for all supported languages
  auto_install = true,
  ident = { enable = true },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = { },
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}
