

--- This is test method
local function test()
  local status,nl = pcall(require,"nvim-tree")
  print(status)
end
-- Set up the keybinding
vim.keymap.set("n", "<leader>tst", test, { silent = true })
