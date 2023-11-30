vim.loader.enable()

-- disable netrw at the start
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", 
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  performance = {
		cache = {
			enabled = true,
		},
		rtp = {
			disabled_plugins = {
				-- "netrw",
				"2html_plugin",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"logipat",
				"tohtml",
				"tutor",
				"tar",
				"tarPlugin",
				"rrhelper",
				"vimball",
				"vimballPlugin",
			},
		},
	},
})

require('options')
require('keymaps')
require("autocmd")

vim.cmd.colorscheme("rose-pine")
