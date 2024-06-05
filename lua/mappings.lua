
-- mappings for normal mode
vim.api.nvim_set_keymap("n", ";", ":", { noremap = true })
vim.api.nvim_set_keymap("n", "ZZ", "<cmd> qa <CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "ZZZ", "<cmd> qa! <CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-z>", ":undo <CR>", { noremap = true })


-- mappings for insert mode
vim.api.nvim_set_keymap("i", "<C-z>", "<C-o>u", { noremap = true })


-- mappings for visual modes
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true })
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true })
