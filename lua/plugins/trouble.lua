return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>xx", "<cmd>Trouble<cr>", desc = "Toggle Trouble" },
    { "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
    { "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", desc = "Document Diagnostics" },
    { "<leader>xq", "<cmd>Trouble quickfix<cr>", desc = "Quickfix List" },
    { "<leader>xl", "<cmd>Trouble loclist<cr>", desc = "Location List" },
    { "gR", "<cmd>Trouble lsp_references<cr>", desc = "LSP References" },
  },
  config = function()
    require("trouble").setup {
      use_diagnostic_signs = true,
    }
  end,
}
