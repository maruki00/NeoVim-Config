return {
    "ray-x/navigator.lua",
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
        "ray-x/lsp_signature.nvim", -- Show function signature when you type
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
  
      vim.api.nvim_clear_autocmds({ event = "CursorHold" })
  
      vim.keymap.set('n', '<leader>ca', function()
        local ok, codeAction = pcall(require, "navigator.codeAction")
        if ok and type(codeAction.code_action_prompt) == "function" then
          codeAction.code_action_prompt()
        end
      end, { noremap = true, silent = true, desc = 'LSP Code Action Prompt' })
  
      vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
          local ok, codeAction = pcall(require, "navigator.codeAction")
          if ok and type(codeAction.code_action_prompt) == "function" then
            codeAction.code_action_prompt()
          end
        end,
      })
  
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "go" },
        callback = function(ev)
          vim.api.nvim_buf_set_keymap(0, "n", "<C-i>", ":GoImports<CR>", {})
          vim.api.nvim_set_keymap("n", "<C-l>", ":GoRmTag json,yaml,validate<CR>", { noremap = true, silent = true })
          vim.api.nvim_buf_set_keymap(0, "n", "<C-j>", ":GoAddTag<CR>", {})
          vim.api.nvim_buf_set_keymap(0, "n", "<C-y>", ":GoAddTag yaml<CR>", {})
          vim.api.nvim_buf_set_keymap(0, "n", "<C-r>", ":GoAddTag validate:required<CR>", {})
          vim.api.nvim_buf_set_keymap(0, "n", "<C-b>", ":GoBuild %:h<CR>", {})
          vim.api.nvim_buf_set_keymap(0, "n", "<C-t>", ":GoTestPkg<CR>", {})
          vim.api.nvim_buf_set_keymap(0, "n", "<C-c>", ":GoCoverage -p<CR>", {})
  
          -- Alternate file toggling
          vim.api.nvim_buf_set_keymap(0, "n", "A", ":lua require('go.alternate').switch(true, '')<CR>", {})
          vim.api.nvim_buf_set_keymap(0, "n", "V", ":lua require('go.alternate').switch(true, 'vsplit')<CR>", {})
          vim.api.nvim_buf_set_keymap(0, "n", "S", ":lua require('go.alternate').switch(true, 'split')<CR>", {})
        end,
        group = vim.api.nvim_create_augroup("go_autocommands", { clear = true })
      })
    end
  }
  