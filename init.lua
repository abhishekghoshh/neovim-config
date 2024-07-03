-- vim options and general mappings starts here
require("vim-options")
require("mappings")
-- vim options and general mappings ends here

-- Adding custom commands
require("custom")
-- Custom scripts end here


-- lazy setup starts here
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
-- lazy setup ends here
