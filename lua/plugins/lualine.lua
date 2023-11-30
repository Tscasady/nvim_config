return {
	"nvim-lualine/lualine.nvim",
	event = "BufReadPost",
	dependencies = {
		"stevearc/aerial.nvim",
	},
	opts = {

    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 500,
      tabline = 500,
      winbar = 500,
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch'},      --Used to include 'diagnostics, removed for noise'
      lualine_c = {{'filename', path = 1} },
      lualine_x = {'filetype'},                           --Used to include 'encoding', fileformat
      lualine_y = {'diagnostics'},                                     --Used to include 'progress'
      lualine_z = {'location'},
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    winbar = {
      lualine_b = {
	{
	  "filename",
	  path = 1
	}
      }
    },
    inactive_winbar = {
      lualine_b = {
	{
	  "filename",
	  path = 1
	}
      }
    },
    extensions = {}
  }
}


