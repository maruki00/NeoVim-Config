return {
	"nvim-neo-tree/neo-tree.nvim",
	lazy = true,
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("neo-tree").setup{}
		vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal left<CR>", {})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
	end,
}
