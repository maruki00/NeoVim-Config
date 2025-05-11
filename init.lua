local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

vim.keymap.set('i', '<C-H>', '<C-w>', { desc = 'Delete word backward in insert mode' }) -- Insert mode
vim.keymap.set('c', '<C-H>', '<C-w>', { desc = 'Delete word backward in command-line mode' }) -- Command-line mode



vim.keymap.set('n', '<M-C-Left>', '^', { desc = 'Go to the end of the line in normal mode' })
vim.keymap.set('i', '<M-C-Left>', '<Esc>^a', { desc = 'Go to the end of the line in insert mode' })
vim.keymap.set('v', '<M-C-Left>', '<Esc>^a', { desc = 'Go to the end of the line in insert mode' })

vim.keymap.set('n', '<M-C-Right>', '$', { desc = 'Go to the end of the line in normal mode' })
vim.keymap.set('i', '<M-C-Right>', '<Esc>$i', { desc = 'Go to the end of the line in insert mode' })
vim.keymap.set('v', '<M-C-Right>', '<Esc>$a', { desc = 'Go to the end of the line in insert mode' })


require("vim-options")
require("lazy").setup("plugins")
