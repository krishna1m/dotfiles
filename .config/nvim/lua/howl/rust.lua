local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
      -- Vimspector
      vim.keymap.set('n', "<leader>dl", ":call vimspector#Launch()<cr>")
      vim.keymap.set('n', "<leader>dso", ":call vimspector#StepOver()<cr>")
      vim.keymap.set('n', "<leader>dst", ":call vimspector#StepOut()<cr>")
      vim.keymap.set('n', "<leader>dsi", ":call vimspector#StepInto()<cr>")
      vim.keymap.set('n', "<leader>dr", ":call vimspector#Reset()<cr>")
      vim.keymap.set('n', "<leader>dt", ":call vimspector#ToggleBreakpoint()<cr>")
      vim.keymap.set('n', "<leader>dw", ":call vimspector#AddWatch()<cr>")
      vim.keymap.set('n', "<leader>de", ":call vimspector#Evaluate()<cr>")
    end,
  },
})

require'lspconfig'.rust_analyzer.setup{
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false;
      }
    }
  }
}
