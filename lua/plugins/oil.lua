return {
	"stevearc/oil.nvim",
	opts = {
		keymaps = {
			["v"] = "actions.select_vsplit",
			["q"] = "actions.close",
			["r"] = "actions.refresh",
		}
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
