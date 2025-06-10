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

vim.keymap.set('n', '<C-s>', ':w!<CR>', {
    noremap = true,
    silent = true
})

vim.keymap.set('n', '<C-z>', ':u<CR>', {
    noremap = true,
    silent = true
})

vim.keymap.set('n', '<C-d>', '<cmd>lua vim.lsp.buf.definition()<CR>')

vim.keymap.set('i', '<C-S-Left>', '$', { noremap = true, silent = true })
vim.keymap.set('n', '<C-S-Left>', '$', { noremap = true, silent = true })

vim.keymap.set('i', '<C-S-Right>', '^', { noremap = true, silent = true })
vim.keymap.set('n', '<C-S-Right>', '^', { noremap = true, silent = true })