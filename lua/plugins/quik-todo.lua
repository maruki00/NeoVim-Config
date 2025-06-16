return {
    "SyedAsimShah1/quick-todo.nvim",
    config = function()
      require("quick-todo").setup({
        keys = {
          open = "t",  -- Press <leader>T to open the TODO window
        },
        window = {
          height = 0.5,
          width = 0.5,
          winblend = 0,
          border = "rounded",
        }
      })
    end,
    keys = {
      { "<leader>T", function() require("quick-todo").open() end, desc = "Open Quick TODO" },
    },
    lazy = false  -- or true, depending on when you want it to load
  }