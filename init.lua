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



vim.keymap.set('v', 'C-/', 'gc', { remap = true, desc = "Toggle comment block" })
vim.keymap.set('n', '<C-S-Up>', '<cmd>lua require"nvim-treesitter.textobjects.repeatable".move("function", "prev")<CR>', { noremap = true, silent = true, desc = 'Previous function' })
vim.keymap.set('n', '<C-S-Down>', '<cmd>lua require"nvim-treesitter.textobjects.repeatable".move("function", "next")<CR>', { noremap = true, silent = true, desc = 'Next function' })


vim.keymap.set("n", "<C-i>", ":GoImports<CR>", opts)
vim.keymap.set("n", "<C-l>", ":GoRmTag json,yaml,validate<CR>", opts)
vim.keymap.set("n", "<C-j>", ":GoAddTag<CR>", opts)
vim.keymap.set("n", "<C-y>", ":GoAddTag yaml<CR>", opts)
vim.keymap.set("n", "<C-r>", ":GoAddTag validate:required<CR>", opts)
vim.keymap.set("n", "<C-b>", ":GoBuild %:h<CR>", opts)
vim.keymap.set("n", "<C-t>", ":GoTestPkg<CR>", opts)
vim.keymap.set("n", "<C-c>", ":GoCoverage -p<CR>", opts)
vim.keymap.set("n", "A", ":lua require('go.alternate').switch(true, '')<CR>", opts)
vim.keymap.set("n", "V", ":lua require('go.alternate').switch(true, 'vsplit')<CR>", opts)
vim.keymap.set("n", "S", ":lua require('go.alternate').switch(true, 'split')<CR>", opts)

  
-- Split and close key mappings
vim.keymap.set('n', '<leader>s', ':vsplit<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>h', ':split<CR>', { noremap = true, silent = true })

-- Navigate between s

vim.keymap.set('n', '<leader>e', ':q<CR>', { noremap = true, silent = true })  -- Close current split (buffer)

-- Load additional configurations and plugins
require("vim-options")
require("lazy").setup("plugins")

