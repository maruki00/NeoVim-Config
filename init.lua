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

vim.keymap.set('i', '<C-H>', '<C-w>', { desc = 'Delete word backward in insert mode' }) -- Insert mode
vim.keymap.set('c', '<C-H>', '<C-w>', { desc = 'Delete word backward in command-line mode' }) -- Command-line mode



vim.keymap.set('n', '<C-Space-Left>', '^', { desc = 'Go to the beginning of the line in normal mode' })
vim.keymap.set('i', '<C-Space-Left>', '^', { desc = 'Go to the beginning of the line in insert mode' })
vim.keymap.set('v', '<C-Space-Left>', '^', { desc = 'Go to the beginning of the line in visual mode' })

-- Go to the end of the line
vim.keymap.set('n', '<C-Space-Right>', '$', { desc = 'Go to the end of the line in normal mode' })
vim.keymap.set('i', '<C-Space-Right>', '$', { desc = 'Go to the end of the line in insert mode' })
vim.keymap.set('v', '<C-Space-Right>', '$', { desc = 'Go to the end of the line in visual mode' })

vim.keymap.set('n', 'C-/', 'gcc', { remap = true, desc = "Toggle comment" })
vim.keymap.set('v', 'C-/', 'gc', { remap = true, desc = "Toggle comment block" })


-- Navigate to the previous function
vim.api.nvim_set_keymap('n', '<C-S-Up>', '<cmd>lua require"nvim-treesitter.textobjects.repeatable".move("function", "prev")<CR>', { noremap = true, silent = true, desc = 'Previous function' })

  -- Navigate to the next function
  vim.api.nvim_set_keymap('n', '<C-S-Down>', '<cmd>lua require"nvim-treesitter.textobjects.repeatable".move("function", "next")<CR>', { noremap = true, silent = true, desc = 'Next function' })
  
require("vim-options")
require("lazy").setup("plugins")
