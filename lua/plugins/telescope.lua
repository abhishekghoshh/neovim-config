return {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 
	    'nvim-lua/plenary.nvim' 
    },
    config = function()
      vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd> Telescope find_files <CR>', { noremap = true, desc = 'Find files' })
      vim.api.nvim_set_keymap('n', '<leader>fa', '<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>', { noremap = true, desc = 'Find all' })
      vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd> Telescope live_grep <CR>', { noremap = true, desc = 'Live grep' })
      vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd> Telescope buffers <CR>', { noremap = true, desc = 'Find buffers' })
      vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd> Telescope help_tags <CR>', { noremap = true, desc = 'Help page' })
      vim.api.nvim_set_keymap('n', '<leader>fo', '<cmd> Telescope oldfiles <CR>', { noremap = true, desc = 'Find oldfiles' })
      vim.api.nvim_set_keymap('n', '<leader>fz', '<cmd> Telescope current_buffer_fuzzy_find <CR>', { noremap = true, desc = 'Find in current buffer' })

      vim.api.nvim_set_keymap('n', '<leader>cm', '<cmd> Telescope git_commits <CR>', { noremap = true, desc = 'Git commits' })
      vim.api.nvim_set_keymap('n', '<leader>gt', '<cmd> Telescope git_status <CR>', { noremap = true, desc = 'Git status' })

      vim.api.nvim_set_keymap('n', '<leader>ma', '<cmd> Telescope marks <CR>', { noremap = true, desc = 'Telescope bookmarks' })

      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          vimgrep_arguments = {
            "rg",
            "-L",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
          prompt_prefix = " �  ",
          selection_caret = "  ",
          entry_prefix = "  ",
          initial_mode = "insert",
          selection_strategy = "reset",
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          file_sorter = require("telescope.sorters").get_fuzzy_file,
          file_ignore_patterns = { "node_modules" },
          generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
          path_display = { "truncate" },
          winblend = 0,
          border = {},
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          color_devicons = true,
          set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
          file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
          -- Developer configurations: Not meant for general override
          buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
          mappings = {
            n = { ["q"] = require("telescope.actions").close },
          },
        },

        extensions_list = { "themes", "terms", "fzf" },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })
    end
  }
