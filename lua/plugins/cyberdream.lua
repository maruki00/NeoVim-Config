return {
    "scottmckendry/cyberdream.nvim",
    lazy = true,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme("cyberdream")
    end,
  }