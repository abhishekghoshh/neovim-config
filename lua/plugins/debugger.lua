return {
  "mfussenegger/nvim-dap",
  init = function()

  end,
  config = function()
    vim.keymap.set('n', '<leader>db', '<cmd>DapToggleBreakpoint<CR>', { desc = 'Add breakpoint at line' })
    vim.keymap.set('n', '<leader>dn', '<cmd>DapStepOver<CR>', { desc = 'Go to the next line' })
    vim.keymap.set('n', '<leader>dc', '<cmd>DapContinue<CR>',
      { desc = 'For continuing the flow/go to the next debug point' })
    vim.keymap.set('n', '<leader>du', function()
      local widgets = require('dap.ui.widgets')
      local sidebar = widgets.sidebar(widgets.scopes)
      sidebar.open()
    end, { desc = 'Open debugging sidebar' })
  end
}
