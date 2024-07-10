vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set nu")
vim.cmd("set clipboard+=unnamedplus")
vim.g.mapleader = " "

if not vim.fn.has('mac') then
  vim.g.clipboard = {
    name = 'wl-clipboard',
    copy = {
      ['+'] = 'wl-copy',
      ['*'] = 'wl-copy',
    },
    paste = {
      ['+'] = 'wl-paste',
      ['*'] = 'wl-paste',
    },
    cache_enabled = 1,
    -- Disable X11 clipboard support
    iswin = 0,
    isnvim = 0,
  }
end
