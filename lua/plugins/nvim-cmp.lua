-- Autocompletion and LSP for Golang
return {
    -- Autocompletion Engine
    {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",      -- LSP source
        "hrsh7th/cmp-path",          -- Path completion
        "L3MON4D3/LuaSnip",          -- Snippet engine
        "saadparwaiz1/cmp_luasnip",  -- Snippet source
        "onsails/lspkind-nvim",      -- Icons
      },
      config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")
  
        cmp.setup({
          snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
          },
          mapping = cmp.mapping.preset.insert({
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<CR>"] = cmp.mapping.confirm({ select = false }),
            ["<Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              else
                fallback()
              end
            end, { "i", "s" }),
          }),
          sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "path" },
          }),
          formatting = {
            format = lspkind.cmp_format({
              mode = "symbol_text",
              maxwidth = 50,
            }),
          },
        })
      end,
    },
  
    -- LSP Config & Go Language Server
    {
      "neovim/nvim-lspconfig",
      dependencies = { "hrsh7th/cmp-nvim-lsp" },
      config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
  
        -- Go LSP (gopls)
        lspconfig.gopls.setup({
          capabilities = capabilities,
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
                unreachable = true,
              },
              staticcheck = true,
            },
          },
        })
      end,
    },
  }
  