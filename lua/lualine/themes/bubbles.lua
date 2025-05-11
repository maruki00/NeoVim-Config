-- ~/.config/nvim/lua/lualine/themes/bubbles.lua
local bubbles_theme = {
  normal = {
    a = { fg = '#ffffff', bg = '#89b4fa', gui = 'bold' },
    b = { fg = '#ffffff', bg = '#585b70' },
    c = { fg = '#cdd6f4', bg = '#313244' },
  },

  insert = {
    a = { fg = '#ffffff', bg = '#74c7ec', gui = 'bold' },
  },
  visual = {
    a = { fg = '#ffffff', bg = '#f9e2af', gui = 'bold' },
  },
  replace = {
    a = { fg = '#ffffff', bg = '#f38ba8', gui = 'bold' },
  },

  inactive = {
    a = { fg = '#cdd6f4', bg = '#313244', gui = 'bold' },
    b = { fg = '#cdd6f4', bg = '#313244' },
    c = { fg = '#cdd6f4', bg = '#313244' },
  },
}

return bubbles_theme
