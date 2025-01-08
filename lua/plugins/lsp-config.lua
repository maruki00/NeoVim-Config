return {{
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
        require("mason").setup()
    end
}, {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
        auto_install = true
    }
}, {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        local lspconfig = require("lspconfig")
        -- lspconfig.ts_ls.setup({
        --   capabilities = capabilities
        -- })
        lspconfig.solargraph.setup({
            capabilities = capabilities
        })
        lspconfig.html.setup({
            capabilities = capabilities
        })
        lspconfig.lua_ls.setup({
            capabilities = capabilities
        })

        lspconfig.ts_ls.setup({
            on_attach = function(client, bufnr)
                -- Auto-format on save
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({
                            async = true
                        })
                    end
                })

                -- Organize imports on save
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.execute_command({
                            command = "_typescript.organizeImports",
                            arguments = {vim.api.nvim_buf_get_name(0)}
                        })
                    end
                })
            end
        })

        local null_ls = require("null-ls")
        local mason_lspconfig = require("mason-lspconfig")

        -- Null-ls for formatting and organizing imports
        null_ls.setup({
            sources = {null_ls.builtins.formatting.prettier, null_ls.builtins.diagnostics.eslint,
                       null_ls.builtins.code_actions.eslint}
        })

        mason_lspconfig.setup_handlers({
            function(server)
                nvim_lsp[server].setup({
                    capabilities = capabilities
                })
            end,
            ["tsserver"] = function()
                nvim_lsp["tsserver"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities
                })
            end,
            ["cssls"] = function()
                nvim_lsp["cssls"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities
                })
            end,
            ["tailwindcss"] = function()
                nvim_lsp["tailwindcss"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities
                })
            end,
            ["html"] = function()
                nvim_lsp["html"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities
                })
            end,
            ["jsonls"] = function()
                nvim_lsp["jsonls"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities
                })
            end,
            ["eslint"] = function()
                nvim_lsp["eslint"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities
                })
            end,
            ["pyright"] = function()
                nvim_lsp["pyright"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities
                })
            end
        })

        -- Updated LSP keymaps with position_encoding
        -- local util = vim.lsp.util
        -- local function make_params_with_encoding()
        --   return util.make_range_params(nil, "utf-8")
        -- end

        vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
        -- vim.keymap.set("n", "<leader>ca", function()
        --   local params = make_params_with_encoding()
        --   vim.lsp.buf.code_action(params)
        -- end, {})
    end
}}
