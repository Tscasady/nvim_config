--local colortable = {"tokyonight-storm", "codemonkey", "system76", "spacedark", "tomorrow", "catppuccin-mocha", "rose-pine", "OceanicNext", "zephyr", "gloombuddy"}
--melange, sonokai
--math.randomseed(os.time())

--local colorscheme = colortable[ math.random(#colortable) ]
return {
	"rebelot/kanagawa.nvim",
	'rose-pine/neovim',
	"folke/tokyonight.nvim",
	dark_variant = 'moon',
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = false,
	disable_float_background = false,
	disable_italics = true,

	groups = {
		background = 'base',
		panel = 'surface',
		border = 'highlight_med',
		comment = 'muted',
		link = 'iris',
		punctuation = 'subtle',

		error = 'love',
		hint = 'iris',
		info = 'foam',
		warn = 'gold',

		headings = {
			h1 = 'iris',
			h2 = 'foam',
			h3 = 'rose',
			h4 = 'gold',
			h5 = 'pine',
			h6 = 'foam',
		}
	},

	highlight_groups = {
		ColorColumn = { bg = 'rose' }
	}
}
