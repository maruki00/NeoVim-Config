vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

vim.keymap.set('n', '<C-S-i>', ':GoImports<CR> :GoFmt<CR>', {
    noremap = true,
    silent = true
})
vim.keymap.set('n', '<C-S-j>', ':GoAddTag json<CR>', {
    noremap = true,
    silent = true
})
vim.keymap.set('n', '<C-S-y>', ':GoAddTag yaml<CR>', {
    noremap = true,
    silent = true
})
vim.keymap.set('n', '<C-S-v>', ':GoAddTag validate:required<CR>', {
    noremap = true,
    silent = true
})
vim.keymap.set('n', '<C-S-l>', ':GoRmTag<CR> :GoFmt<CR>', {
    noremap = true,
    silent = true
})


vim.keymap.set('n', '<C-s>', ':w!<CR>', {
    noremap = true,
    silent = true
})

vim.keymap.set('n', '<C-S-z>', ':u<CR>', {
    noremap = true,
    silent = true
})