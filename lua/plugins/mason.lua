-- return {
--     "williamboman/mason.nvim",
--     dependencies = {
--         "williamboman/mason-lspconfig.nvim",
--         "WhoIsSethDaniel/mason-tool-installer.nvim",
--     },
--     config = function()
--         require("mason").setup()

--         require("mason-lspconfig").setup({
--             automatic_installation = true,
--             ensure_installed = {
--                 -- "cssls",
--                 -- "eslint",
--                 -- "html",
--                 -- "jsonls",
--                 -- "tsserver",
--                 -- "pyright",
--                 -- "tailwindcss",
--             },
--         })

--         require("mason-tool-installer").setup({
--             ensure_installed = {
--                 -- "prettier",
--                 -- "stylua", -- lua formatter
--                 -- "isort", -- python formatter
--                 -- "black", -- python formatter
--                 -- "pylint",
--                 -- "eslint_d",
--             },
--         })
--     end,
-- }
return {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    event = "VeryLazy", -- or "BufReadPre" if you want earlier load
    config = function()
      local ok_mason, mason = pcall(require, "mason")
      if not ok_mason then
        vim.notify("mason failed to load", vim.log.levels.ERROR)
        return
      end
      mason.setup()
  
      local ok_lsp, mason_lspconfig = pcall(require, "mason-lspconfig")
      if not ok_lsp then
        vim.notify("mason-lspconfig failed to load", vim.log.levels.ERROR)
        return
      end
      mason_lspconfig.setup({
        automatic_installation = true,
        ensure_installed = {
          -- Add LSPs here
          -- "lua_ls", "pyright", "tsserver"
        },
      })
  
      local ok_tools, mason_tool_installer = pcall(require, "mason-tool-installer")
      if not ok_tools then
        vim.notify("mason-tool-installer failed to load", vim.log.levels.ERROR)
        return
      end
      mason_tool_installer.setup({
        ensure_installed = {
          -- Add tools here
          -- "prettier", "black"
        },
      })
    end,
}