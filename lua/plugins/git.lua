return {
  {
    "tpope/vim-fugitive"
    -- use this plugin to use git like any other command in neovim command
    -- :Git histor
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()

      vim.keymap.set("n", "<leader>ggp", ":Gitsigns preview_hunk<CR>", {})
      vim.keymap.set("n", "<leader>ggt", ":Gitsigns toggle_current_line_blame<CR>", {})
    end
  }
}
