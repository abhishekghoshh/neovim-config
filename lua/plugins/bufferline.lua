return {
  'akinsho/bufferline.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    vim.opt.termguicolors = true
    vim.api.nvim_set_keymap("n", "<tab>", ":BufferLineCycleNext<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<S-tab>", ":BufferLineCyclePrev<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>xa", ":BufferLineCloseOthers<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>xx", ":bdelete<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>x[", ":BufferLineCloseLeft<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>x]", ":BufferLineCloseRight<CR>", { noremap = true })
    require("bufferline").setup {
      options = {
        hover = {
          enabled = true,
          delay = 150,
          reveal = { 'close' }
        }
      }
    }
  end
}
