local map = vim.keymap.set
vim.api.nvim_set_option('updatetime', 100) 

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error 
-- Show inlay_hints more frequently 
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- Treesitter folding 
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

-- Vimspector options
vim.cmd([[
let g:vimspector_sidebar_width = 85
let g:vimspector_bottombar_height = 15
let g:vimspector_terminal_maxwidth = 70
]])


-- todo-comments
map("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })
map("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
map("n", "]t", function()
  require("todo-comments").jump_next({keywords = { "ERROR", "WARNING" }})
end, { desc = "Next error/warning todo comment" })

-- Beacon
vim.cmd([[
let g:beacon_timeout=100
let g:beacon_fade = 0
let g:beacon_shrink = 0
nnoremap <silent>yoj :BeaconToggle<CR>
]])

-- UltiSnips
vim.cmd([[
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
]])

-- Float-term
vim.cmd([[
let g:floaterm_title = ""
let g:floaterm_autohide = 2
let g:floaterm_keymap_toggle = '<C-\>'
nnoremap <silent><leader>ka :FloatermNew amm<CR>
nnoremap <silent><leader>ke :FloatermNew iex<CR>
nnoremap <silent><leader>oe :FloatermNew --wintype=split --height=0.5<CR>
nnoremap <silent><leader>ko :FloatermNew cd<Space>~/org<Space>&&<Space>nvim<Space>scratch.org<CR>
nnoremap <silent><leader>kr :FloatermNew ranger<CR>
nnoremap <silent><leader>ks :FloatermNew scala<CR>
]])

-- lsp-colors
require("lsp-colors").setup({
  Error = "##F08080",
  Warning = "#D4AC0D",
  Information = "#85C1E9",
  Hint = "#196F3D"
})

-- symbols-outline
vim.cmd([[
nnoremap <silent><leader>so :SymbolsOutline<CR>
]])
local symbolopts = {
  highlight_hovered_item = true,
  show_guides = true,
  auto_preview = false,
  position = 'right',
  relative_width = true,
  width = 25,
  auto_close = false,
  show_numbers = false,
  show_relative_numbers = false,
  show_symbol_details = true,
  preview_bg_highlight = 'Pmenu',
  autofold_depth = nil,
  auto_unfold_hover = true,
  fold_markers = { '', '' },
  wrap = false,
  keymaps = { -- These keymaps can be a string or a table for multiple keys
    close = {"ZQ", "q"},
    goto_location = "<Cr>",
    focus_location = "o",
    hover_symbol = "K",
    toggle_preview = "p",
    rename_symbol = "r",
    code_actions = "a",
    fold = "zc",
    unfold = "zo",
    fold_all = "zM",
    unfold_all = "zR",
    fold_reset = "R",
  },
  lsp_blacklist = {},
  symbol_blacklist = {},
  symbols = {
    File = { icon = "", hl = "@text.uri" },
    Module = { icon = "", hl = "@namespace" },
    Namespace = { icon = "", hl = "@namespace" },
    Package = { icon = "", hl = "@namespace" },
    Class = { icon = "𝓒", hl = "@type" },
    Method = { icon = "ƒ", hl = "@method" },
    Property = { icon = "", hl = "@method" },
    Field = { icon = "", hl = "@field" },
    Constructor = { icon = "", hl = "@constructor" },
    Enum = { icon = "ℰ", hl = "@type" },
    Interface = { icon = "ﰮ", hl = "@type" },
    Function = { icon = "", hl = "@function" },
    Variable = { icon = "", hl = "@constant" },
    Constant = { icon = "", hl = "@constant" },
    String = { icon = "𝓐", hl = "@string" },
    Number = { icon = "#", hl = "@number" },
    Boolean = { icon = "⊨", hl = "@boolean" },
    Array = { icon = "", hl = "@constant" },
    Object = { icon = "⦿", hl = "@type" },
    Key = { icon = "🔐", hl = "@type" },
    Null = { icon = "NULL", hl = "@type" },
    EnumMember = { icon = "", hl = "@field" },
    Struct = { icon = "𝓢", hl = "@type" },
    Event = { icon = "🗲", hl = "@type" },
    Operator = { icon = "+", hl = "@operator" },
    TypeParameter = { icon = "𝙏", hl = "@parameter" },
    Component = { icon = "", hl = "@function" },
    Fragment = { icon = "", hl = "@constant" },
  },
}

require("symbols-outline").setup(symbolopts)

-- Harpoon
vim.cmd([[
nnoremap <silent><leader>hh :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent>yom :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent><leader>ha :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent><leader>hs :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent><leader>hd :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent><leader>hf :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <silent><leader>hj :lua require("harpoon.ui").nav_next()<CR>
nnoremap <silent><leader>hk :lua require("harpoon.ui").nav_prev()<CR>
]])

local function lsp()
  local count = {}
  local levels = {
    errors = "Error",
    warnings = "Warn",
    info = "Info",
    hints = "Hint",
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ""
  local warnings = ""
  local hints = ""
  local info = ""

  if count["errors"] ~= 0 then
    errors = " %#LspDiagnosticsSignError#❗️ " .. count["errors"]
  end
  if count["warnings"] ~= 0 then
    warnings = " %#LspDiagnosticsSignWarning#⚠️  " .. count["warnings"]
  end
  if count["hints"] ~= 0 then
    hints = " %#LspDiagnosticsSignHint#💡 " .. count["hints"]
  end
  if count["info"] ~= 0 then
    info = " %#LspDiagnosticsSignInformation#💬 " .. count["info"]
  end

  return errors .. warnings .. hints .. info .. "%#LineNr#"
end

Statusline = function()
  return table.concat {
    "%#Search# ",
    "%{expand('%:t')} ",
    "%m%r ",
    "%#DiffChange# ",
    "%{gitbranch#name()} ",
    lsp(),
    "%=",
    "%#LineNr#",
    " %<%l,%c%V ",
    "%P ", 
    "[%{&ff}] ",
    "%y ",
    "(%{strftime(\"%m/%d %H:%M\",getftime(expand(\"%:p\")))}) ",
  }
end

vim.api.nvim_exec([[
  set statusline=%!v:lua.Statusline()
]], false)
