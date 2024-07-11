local opts = { noremap = true, silent = true }

local desc_opts = function(description)
  return { noremap = true, desc = description }
end

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap


-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


-- mappings for normal mode
keymap("n", ";", ":", opts)
keymap("n", "ZZ", "<cmd> qa <CR>", opts)
keymap("n", "ZZZ", "<cmd> qa! <CR>", opts)
keymap("n", "<C-z>", ":undo <CR>", opts)


keymap('n', '<Esc>', '<cmd> noh <CR>', desc_opts("Clear highlights"))

-- Better window navigation
keymap('n', '<C-h>', '<C-w>h', { noremap = true, desc = 'Window left' })
keymap('n', '<C-l>', '<C-w>l', { noremap = true, desc = 'Window right' })
keymap('n', '<C-j>', '<C-w>j', { noremap = true, desc = 'Window down' })
keymap('n', '<C-k>', '<C-w>k', { noremap = true, desc = 'Window up' })


-- Resize with arrows when using multiple windows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<c-down>", ":resize +2<cr>", opts)
keymap("n", "<c-right>", ":vertical resize -2<cr>", opts)
keymap("n", "<c-left>", ":vertical resize +2<cr>", opts)

-- Save files and contents
keymap('n', '<C-s>', '<cmd> w <CR>', { noremap = true, desc = 'Save file' })
keymap('n', '<C-c>', '<cmd> %y+ <CR>', { noremap = true, desc = 'Copy whole file' })

-- toggle line numbering
keymap('n', '<leader>nu', '<cmd> set nu! <CR>', { noremap = true, desc = 'Toggle line number' })
keymap('n', '<leader>rnu', '<cmd> set rnu! <CR>', { noremap = true, desc = 'Toggle relative number' })

keymap('n', 'j', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { noremap = true, expr = true, desc = 'Move down' })
keymap('n', 'k', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { noremap = true, expr = true, desc = 'Move up' })
keymap('n', '<Up>', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { noremap = true, expr = true, desc = 'Move up' })
keymap('n', '<Down>', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { noremap = true, expr = true, desc = 'Move down' })

keymap('n', '<leader>b', '<cmd> enew <CR>', { noremap = true, desc = 'New buffer' })


-- mappings for insert mode
keymap("i", "<C-z>", "<C-o>u", { noremap = true })


-- mappings for visual modes
keymap("v", ">", ">gv", { noremap = true })
keymap("v", "<", "<gv", { noremap = true })

keymap('v', '<Up>', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { noremap = true, expr = true, desc = 'Move up' })
keymap('v', '<Down>', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { noremap = true, expr = true, desc = 'Move down' })

-- Copy selected text to system clipboard
vim.keymap.set('v', '<leader>y', '"+y', { noremap = true })



keymap('t', '<C-x>', vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true),
  { noremap = true, desc = 'Escape terminal mode' })


keymap('x', 'j', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { noremap = true, expr = true, desc = 'Move down' })
keymap('x', 'k', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { noremap = true, expr = true, desc = 'Move up' })
keymap('x', 'p', 'p:let @+=@0<CR>:let @"=@0<CR>', { noremap = true, silent = true, desc = 'Dont copy replaced text' })
