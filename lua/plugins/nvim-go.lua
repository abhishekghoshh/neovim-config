return {
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      -- mappings
      vim.keymap.set('n', '<leader>dgt', function() require('dap-go').debug_test() end, { desc = "Debug go test" })
      vim.keymap.set('n', '<leader>dgl', function() require('dap-go').debug_last() end, { desc = "Debug last go test" })
    end
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      -- mappings
      vim.keymap.set("n", "<leader>gsj", "<cmd>GoTagAdd json<CR>", { desc = "Add json struct tags" })
      vim.keymap.set("n", "<leader>gsy", "<cmd>GoTagAdd yaml<CR>", { desc = "Add yaml struct tags" })
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
}
