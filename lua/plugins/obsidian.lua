return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	opts = {
		workspaces = {
			{
				name = "notes",
				path = "~\\Documents\\Obsidian Vault",
			},
		},
		daily_notes = {
			folder = "Daily",
			date_format = "%Y-%m-%d",
			template = "daily",
		},
		templates = {
			subdir = "Templates",
			date_format = "%Y-%m-%d-%a",
			time_format = "%H:%M",
		},
	},
}
