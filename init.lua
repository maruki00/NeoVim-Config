-- Ensure lazy.nvim is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", 
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- Key mappings for various modes
vim.keymap.set('i', '<C-H>', '<C-w>', { desc = 'Delete word backward in insert mode' }) -- Insert mode
vim.keymap.set('c', '<C-H>', '<C-w>', { desc = 'Delete word backward in command-line mode' }) -- Command-line mode
vim.keymap.set('n', '<C-Space-Left>', '^', { desc = 'Go to the beginning of the line in normal mode' })
vim.keymap.set('i', '<C-Space-Left>', '^', { desc = 'Go to the beginning of the line in insert mode' })
vim.keymap.set('v', '<C-Space-Left>', '^', { desc = 'Go to the beginning of the line in visual mode' })
vim.keymap.set('n', '<C-Space-Right>', '$', { desc = 'Go to the end of the line in normal mode' })
vim.keymap.set('i', '<C-Space-Right>', '$', { desc = 'Go to the end of the line in insert mode' })
vim.keymap.set('v', '<C-Space-Right>', '$', { desc = 'Go to the end of the line in visual mode' })


vim.opt.laststatus = 0

-- put copied text into cleapboard when you used "y"
vim.o.clipboard = "unnamedplus"


vim.keymap.set('v', 'C-/', 'gc', { remap = true, desc = "Toggle comment block" })
vim.keymap.set('n', '<C-S-Up>', '<cmd>lua require"nvim-treesitter.textobjects.repeatable".move("function", "prev")<CR>', { noremap = true, silent = true, desc = 'Previous function' })
vim.keymap.set('n', '<C-S-Down>', '<cmd>lua require"nvim-treesitter.textobjects.repeatable".move("function", "next")<CR>', { noremap = true, silent = true, desc = 'Next function' })

  
-- Split and close key mappings
vim.keymap.set('n', '<leader>s', ':vsplit<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>h', ':split<CR>', { noremap = true, silent = true })

-- Navigate between s

vim.keymap.set('n', '<leader>e', ':q<CR>', { noremap = true, silent = true })  -- Close current split (buffer)

-- Load additional configurations and plugins
require("vim-options")
require("lazy").setup("plugins")

