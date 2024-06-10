-- mappings for normal mode
vim.api.nvim_set_keymap("n", ";", ":", { noremap = true })
vim.api.nvim_set_keymap("n", "ZZ", "<cmd> qa <CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "ZZZ", "<cmd> qa! <CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-z>", ":undo <CR>", { noremap = true })


vim.api.nvim_set_keymap('n', '<Esc>', '<cmd> noh <CR>', { noremap = true, desc = 'Clear highlights' })

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, desc = 'Window left' })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, desc = 'Window right' })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, desc = 'Window down' })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, desc = 'Window up' })

vim.api.nvim_set_keymap('n', '<C-s>', '<cmd> w <CR>', { noremap = true, desc = 'Save file' })

vim.api.nvim_set_keymap('n', '<C-c>', '<cmd> %y+ <CR>', { noremap = true, desc = 'Copy whole file' })

vim.api.nvim_set_keymap('n', '<leader>n', '<cmd> set nu <CR>', { noremap = true, desc = 'Toggle line number' })
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd> set rnu <CR>', { noremap = true, desc = 'Toggle relative number' })

vim.api.nvim_set_keymap('n', 'j', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
  { noremap = true, expr = true, desc = 'Move down' })
vim.api.nvim_set_keymap('n', 'k', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
  { noremap = true, expr = true, desc = 'Move up' })
vim.api.nvim_set_keymap('n', '<Up>', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
  { noremap = true, expr = true, desc = 'Move up' })
vim.api.nvim_set_keymap('n', '<Down>', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
  { noremap = true, expr = true, desc = 'Move down' })

vim.api.nvim_set_keymap('n', '<leader>b', '<cmd> enew <CR>', { noremap = true, desc = 'New buffer' })


-- mappings for insert mode
vim.api.nvim_set_keymap("i", "<C-z>", "<C-o>u", { noremap = true })


-- mappings for visual modes
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true })
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true })

vim.api.nvim_set_keymap('v', '<Up>', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
  { noremap = true, expr = true, desc = 'Move up' })
vim.api.nvim_set_keymap('v', '<Down>', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
  { noremap = true, expr = true, desc = 'Move down' })



vim.api.nvim_set_keymap('t', '<C-x>', vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true),
  { noremap = true, desc = 'Escape terminal mode' })


vim.api.nvim_set_keymap('x', 'j', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
  { noremap = true, expr = true, desc = 'Move down' })
vim.api.nvim_set_keymap('x', 'k', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
  { noremap = true, expr = true, desc = 'Move up' })
vim.api.nvim_set_keymap('x', 'p', 'p:let @+=@0<CR>:let @"=@0<CR>',
  { noremap = true, silent = true, desc = 'Dont copy replaced text' })
