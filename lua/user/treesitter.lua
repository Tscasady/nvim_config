local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({

        ensure_installed = { "bash", "c", "javascript", "json", "lua", "python", "typescript", "tsx", "css", "rust", "ruby", "java", "yaml", "markdown", "markdown_inline", "vim", "help" },
	ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "css" }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css", "ruby" } },
        endwise = { enable = true},
        rainbow = {
                enable = true,
                extended_mode = true,
                max_file_lines = 1000 --Arbitrary limit, modify if performance issues
              }
})
