
return {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
	  	"nvim-tree/nvim-web-devicons",
	  	"MunifTanjim/nui.nvim",
    },
    config = function()
      vim.keymap.set("n", "<C-n>",":NvimTreeToggle<CR>" , { silent = true })
      vim.keymap.set("n", "<C-f>",":NvimTreeFindFile<CR>" , { silent = true })
      require("nvim-tree").setup({
        open_on_tab = true,
      })
    end,
  }
