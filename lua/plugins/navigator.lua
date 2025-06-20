-- return {
--     "ray-x/navigator.lua",
--     dependencies = {{"hrsh7th/nvim-cmp"}, {"nvim-treesitter/nvim-treesitter"}, {
--         "ray-x/guihua.lua",
--         run = "cd lua/fzy && make"
--     }, {
--         "ray-x/go.nvim",
--         event = {"CmdlineEnter"},
--         ft = {"go", "gomod"},
--         build = ':lua require("go.install").update_all_sync()'
--     }, {
--         "ray-x/lsp_signature.nvim", -- Show function signature when you type
--         event = "VeryLazy",
--         config = function()
--             require("lsp_signature").setup()
--         end
--     }},
--     config = function()
--         require("go").setup()
--         require("navigator").setup({
--             lsp_signature_help = true, -- enable ray-x/lsp_signature
--             lsp = {
--                 format_on_save = true
--             }
--         })

--         vim.api.nvim_create_autocmd("FileType", {
--             pattern = {"go"},
--             callback = function(ev)
--                 -- CTRL/control keymaps
--                 vim.api.nvim_buf_set_keymap(0, "n", "<C-i>", ":GoImports<CR>", {})

--                 -- vim.api.nvim_buf_set_keymap(0, "n", "<C-l>", ":GoRmTag json,yaml,validate<CR>", {})
--                 vim.api.nvim_set_keymap('n', '<C-l>', ':GoRmTag json,yaml,validate<CR>', { noremap = true, silent = true })
--                 vim.api.nvim_buf_set_keymap(0, "n", "<C-j>", ":GoAddTag<CR>", {})
--                 vim.api.nvim_buf_set_keymap(0, "n", "<C-y>", ":GoAddTag yaml<CR>", {})
--                 vim.api.nvim_buf_set_keymap(0, "n", "<C-r>", ":GoAddTag validate:required<CR>", {})

--                 vim.api.nvim_buf_set_keymap(0, "n", "<C-b>", ":GoBuild %:h<CR>", {})
--                 vim.api.nvim_buf_set_keymap(0, "n", "<C-t>", ":GoTestPkg<CR>", {})
--                 vim.api.nvim_buf_set_keymap(0, "n", "<C-c>", ":GoCoverage -p<CR>", {})

--                 -- Opens test files
--                 vim.api.nvim_buf_set_keymap(0, "n", "A", ":lua require('go.alternate').switch(true, '')<CR>", {}) -- Test
--                 vim.api.nvim_buf_set_keymap(0, "n", "V", ":lua require('go.alternate').switch(true, 'vsplit')<CR>", {}) -- Test Vertical
--                 vim.api.nvim_buf_set_keymap(0, "n", "S", ":lua require('go.alternate').switch(true, 'split')<CR>", {}) -- Test Split
--             end,
--             group = vim.api.nvim_create_augroup("go_autocommands", {
--                 clear = true
--             })
--         })
--     end
-- }
return {
    "ray-x/navigator.lua",
    branch = "nvim_0.10",
    dependencies = {
      { "hrsh7th/nvim-cmp" },
      { "nvim-treesitter/nvim-treesitter" },
      {
        "ray-x/guihua.lua",
        run = "cd lua/fzy && make"
      },
      {
        "ray-x/go.nvim",
        event = { "CmdlineEnter" },
        ft = { "go", "gomod" },
        build = ':lua require("go.install").update_all_sync()'
      },
      {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        config = function()
          require("lsp_signature").setup()
        end
      }
    },
    config = function()
      require("go").setup()
      require("navigator").setup({
        lsp_signature_help = true,
        lsp = {
          format_on_save = true
        }
      })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "go" },
        callback = function(ev)
          local opts = { buffer = ev.buf, noremap = true, silent = true }
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
        end,
        group = vim.api.nvim_create_augroup("go_autocommands", { clear = true })
      })
    end
}
  