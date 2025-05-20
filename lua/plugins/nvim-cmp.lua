return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",  -- nvim-lsp completion source
      "hrsh7th/cmp-buffer",    -- Buffer completion source
      "hrsh7th/cmp-path",      -- File path completion
      "L3MON4D3/LuaSnip",      -- Snippet support
      "saadparwaiz1/cmp_luasnip", -- Snippet completion
      "onsails/lspkind-nvim",  -- LSP icons
      {
        "neovim/nvim-lspconfig",  -- LSP config plugin
        config = function()
          local lspconfig = require("lspconfig")
          local capabilities = require("cmp_nvim_lsp").default_capabilities()
  
          -- Setup Go LSP (gopls)
          lspconfig.gopls.setup({
            capabilities = capabilities,
            settings = {
              gopls = {
                analyses = {
                  unusedparams = true,
                },
                staticcheck = true,
              },
            },
          })
        end
      }
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
          ["<C-Space>"] = cmp.mapping.complete(),  -- Trigger autocomplete
          ["<C-e>"] = cmp.mapping.abort(),         -- Abort completion
          ["<CR>"] = cmp.mapping(function(fallback)
            if cmp.visible() and cmp.get_selected_entry() then
              cmp.confirm({ select = false })  
            else
              fallback()  -- Fall back to normal Enter
            end
          end, { "i", "s" }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()  -- Select next item
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()  -- Jump to snippet
            else
              fallback()  -- Fall back to normal Tab behavior
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
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
  }
  