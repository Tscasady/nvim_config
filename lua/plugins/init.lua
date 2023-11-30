return {
        { "folke/which-key.nvim",  opts = {} },
        {"tpope/vim-fugitive"},
        {"tpope/vim-rhubarb"},
        {"tpope/vim-sleuth"},
	{"tpope/vim-surround"},
	{"tpope/vim-repeat"},
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
	{ "prisma/vim-prisma" }
}
