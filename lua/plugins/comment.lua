-- return {
--     "numToStr/Comment.nvim",
--     config = function()
--       require("Comment").setup()
--     end
--   }

return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup()

    -- Helper to simulate keys like `vaf` and `gc`
    local function feedkeys(keys)
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, false, true), 'n', true)
    end

    -- Map Ctrl + Alt + / to: select function and toggle comment
    vim.keymap.set('n', '<C-M-_>', function()
      feedkeys('vaf')         -- visually select the function
      vim.defer_fn(function()
        feedkeys('gc')        -- toggle comment on that selection
      end, 10)                -- small delay to apply visual mode
    end, { noremap = true, silent = true, desc = "Toggle comment for function" })
  end
}