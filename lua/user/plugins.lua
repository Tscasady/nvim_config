local fn = vim.fn

--Auto Install Packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
        print("packer?")
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
  use { "wbthomason/packer.nvim" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim" } -- Useful lua functions used by lots of plugins
  use { "windwp/nvim-autopairs" } -- Autopairs, integrates with both cmp and treesitter

  -- Cmp 
  use { "hrsh7th/nvim-cmp" } -- The completion plugin
  use { "hrsh7th/cmp-buffer" } -- buffer completions
  use { "hrsh7th/cmp-path" } -- path completions
  use { "hrsh7th/cmp-cmdline" } -- cmdline completions
  use { "saadparwaiz1/cmp_luasnip" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-nvim-lua" }

  --Snippets
  use { "L3MON4D3/LuaSnip" } --snippet engine, consider autotrigger options in json file

	-- Visual
  use { "folke/tokyonight.nvim" }
  use { "savq/melange-nvim" }
  use { "lunarvim/colorschemes" }
  use { "catppuccin/nvim", as = "catppuccin" }
  use { 'rose-pine/neovim', as = 'rose-pine' }
  use { 'sainnhe/sonokai' }
  use { 'mhartington/oceanic-next' }
  use { 'glepnir/zephyr-nvim' }
  use { 'folke/zen-mode.nvim'}
  use { "nvim-lualine/lualine.nvim"}
  use { "tjdevries/colorbuddy.nvim" }
  use { "bkegley/gloombuddy" }

  --Misc
  use { "tpope/vim-surround"} --'cs' to change surroundings 
  use { "tpope/vim-repeat"} --Repeat mapped commands with '.'
  use { "Eandrju/cellular-automaton.nvim" }
  use { "sitiom/nvim-numbertoggle" }
  use { "Pocco81/auto-save.nvim" } --Autosave
  use { "phaazon/mind.nvim", 
          requires = { 'nvim-lua/plenary.nvim' },
          config = function()
            require'mind'.setup()
          end
      }
  use {
    "ThePrimeagen/refactoring.nvim",
    requires = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-treesitter/nvim-treesitter"}
    }
  }

  --Git
  use { "tpope/vim-fugitive"}
  use { "tpope/vim-rhubarb"}
  use { "lewis6991/gitsigns.nvim" }

  --LSP
  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration
      'folke/neodev.nvim',
    },
  }
  use { "jose-elias-alvarez/null-ls.nvim" }
  use { "RRethy/vim-illuminate" } --Highlights identical keywords in file, idk if I like it.
  use { "rafamadriz/friendly-snippets" }

  -- Telescope
  use { "nvim-telescope/telescope.nvim" }

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use { "p00f/nvim-ts-rainbow" } --no longer maintained, remove if it causes issues
  use { "RRethy/nvim-treesitter-endwise" } --integrates tpope endwise with treesitter
  use { "lukas-reineke/indent-blankline.nvim" }

  --File Tree
  use { "kyazdani42/nvim-web-devicons" }
  use { "kyazdani42/nvim-tree.lua" }
  --use { "akinsho/bufferline.nvim" }
  use { "moll/vim-bbye" }

  --Terminal
  use { "akinsho/toggleterm.nvim" }

  --Rails
  use { "tpope/vim-rails" }
  

  --[[
  use { "numToStr/Comment.nvim", }
  use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "4d3a68c41a53add8804f471fcc49bb398fe8de08" }
  use { "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" }
  use { "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" }
  use { "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" }
  use {"folke/which-key.nvim"}

  --]]
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
