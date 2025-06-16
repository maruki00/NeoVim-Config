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
vim.keymap.set('n', '<C-.>', '$', { desc = 'Go to the beginning of the line in normal mode' })
vim.keymap.set('n', '<C-m>', '^', { desc = 'Go to the end of the line in normal mode' })

vim.opt.laststatus = 0

vim.o.clipboard = "unnamedplus"


vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
  pattern = "*",
  command = "silent! write",
})

vim.keymap.set('v', '<C-/>', 'vafgc', { remap = true, desc = "Toggle comment block" })


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

