--local colortable = {"tokyonight-storm", "codemonkey", "system76", "spacedark", "tomorrow", "catppuccin-mocha", "rose-pine", "OceanicNext", "zephyr", "gloombuddy"}
--melange, sonokai
--math.randomseed(os.time())

--local colorscheme = colortable[ math.random(#colortable) ]
require('rose-pine').setup({
	--- @usage 'main' | 'moon'
	dark_variant = 'moon',
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = false,
	disable_float_background = false,
	disable_italics = true,

	--- @usage string hex value or named color from rosepinetheme.com/palette
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
		-- or set all headings at once
		-- headings = 'subtle'
	},

	-- Change specific vim highlight groups
	highlight_groups = {
		ColorColumn = { bg = 'rose' }
	}
})

-- local colorscheme = "rose-pine" 
local colorscheme = "kanagawa" 
print("Current colorscheme: " .. colorscheme)

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme" .. colorscheme .. " not found.")
  return
end
