return {
	"windwp/nvim-autopairs",
	dependencies = {
		"hrsh7th/nvim-cmp",
	},
	config = function()
		local autopairs = require("nvim-autopairs")
		autopairs.setup({
			fast_wrap = {},
			check_ts = true,
			disable_in_macro = true,
		})

		local Rule = require("nvim-autopairs.rule")
		local cond = require("nvim-autopairs.conds")

		autopairs.add_rules({
			Rule("<", ">", { "rust" }):with_pair(cond.before_regex("%a+")):with_move(function(opts)
				return opts.char == ">"
			end),
		})

		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
