return {
	{ "folke/neodev.nvim", opts = {} },
	{ "folke/which-key.nvim", opts = {} },
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-rhubarb" },
	{ "tpope/vim-sleuth" },
	{ "tpope/vim-repeat" },
	{ "numToStr/Comment.nvim", opts = {} },
	{
		"uga-rosa/ccc.nvim",
		ft = {
			"lua",
			"css",
			"js",
			"ts",
			"jsx",
			"tsx",
		},
		cmd = {
			"CccPick",
			"CccConvert",
			"CccHighlighterToggle",
			"CccHighlighterEnable",
			"CccHighlighterDisable",
		},
		opts = {
			highlighter = {
				auto_enable = true,
				lsp = true,
				excludes = { "lazy", "mason", "help", "neo-tree" },
			},
		},
	},
	{ "mechatroner/rainbow_csv", ft = "csv" },
	{ "prisma/vim-prisma" },
	{
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		config = function()
			require("crates").setup()
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{"moll/vim-bbye"}
}
