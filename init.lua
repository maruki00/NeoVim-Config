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
vim.keymap.set('n', '<C-e>', '^', { desc = 'Go to the beginning of the line in normal mode' })
vim.keymap.set('n', '<C-m>', '$', { desc = 'Go to the end of the line in normal mode' })

-- Clipboard integration
vim.o.clipboard = "unnamedplus"

-- Always hide the status line
vim.opt.laststatus = 0

-- Auto-save on text change
vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
  pattern = "*",
  command = "silent! write",
})

-- Toggle comment block (requires plugin like 'numToStr/Comment.nvim')
vim.keymap.set('n', '<C-_>', 'vafgc', { remap = true, desc = "Toggle comment block" })

-- Treesitter repeatable move (requires plugin with 'nvim-treesitter.textobjects')
vim.keymap.set('n', '<C-S-Up>', function()
  require("nvim-treesitter.textobjects.repeatable").move("function", "prev")
end, { noremap = true, silent = true, desc = 'Previous function' })

vim.keymap.set('n', '<C-S-Down>', function()
  require("nvim-treesitter.textobjects.repeatable").move("function", "next")
end, { noremap = true, silent = true, desc = 'Next function' })

-- Splitting windows
vim.keymap.set('n', '<leader>s', ':vsplit<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>h', ':split<CR>', { noremap = true, silent = true })

-- Close current window
vim.keymap.set('n', '<leader>e', ':q<CR>', { noremap = true, silent = true })


vim.keymap.set('n', '<leader>gf', '<cmd>GrugFar<CR>', { desc = 'Open Grug-Far' })


-- Load additional configurations and plugins
require("vim-options")         -- You must define this module somewhere
require("lazy").setup("plugins")
