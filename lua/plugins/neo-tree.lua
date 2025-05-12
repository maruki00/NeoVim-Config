return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
	  "nvim-lua/plenary.nvim",
	  "nvim-tree/nvim-web-devicons",
	  "nvim-telescope/telescope.nvim",
	  "MunifTanjim/nui.nvim",
	},
	config = function()
	  require("neo-tree").setup{}
	  vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal left<CR>", {})
	  vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
	end,
	-- Automatically load the plugin on startup or with a specific event like opening a directory
	event = "VimEnter",  -- You can adjust this based on your preference
  }
