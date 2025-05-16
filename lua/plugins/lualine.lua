return {
    "nvim-lualine/lualine.nvim",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    options = {
    disabled_filetypes = { 'NvimTree', 'TelescopePrompt' },
        theme = 'auto',
        section_separators = '',
        component_separators = '',
        globalstatus = false,
    },
    sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    config = function()
        require("lualine").setup({options = {theme = "bubbles"}})
    end
}

