local map = vim.keymap.set
vim.api.nvim_set_option('updatetime', 300) 

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

-- Vimspector
vim.cmd([[
nmap 'vl' <cmd>call vimspector#Launch()<cr>
nmap 'vsr' <cmd>call vimspector#StepOver()<cr>
nmap 'vst' <cmd>call vimspector#StepOut()<cr>")
nmap 'vsi' <cmd>call vimspector#StepInto()<cr>")
nmap 'vr' <cmd>call vimspector#Reset()<cr>
]])
map('n', "Db", ":call vimspector#ToggleBreakpoint()<cr>")
map('n', "Dw", ":call vimspector#AddWatch()<cr>")
map('n', "De", ":call vimspector#Evaluate()<cr>")

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
nnoremap <silent>yob :BeaconToggle<CR>
]])

-- UltiSnips
vim.cmd([[
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
]])
