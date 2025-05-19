-- return {
--     "scottmckendry/cyberdream.nvim",
--     lazy = true,
--     priority = 1000,
--     init = function()
--       vim.cmd.colorscheme("cyberdream")
--     end,
--   }

return {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("cyberdream").setup {
      -- optionally set transparent or italic styles
      transparent = true,
      italic_comments = true,
    }
    vim.cmd.colorscheme "cyberdream"
  end,
}