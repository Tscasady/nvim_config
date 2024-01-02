local function setup_lspconfig()
	require("fidget").setup()
	-- local servers = {
	-- 	"rust_analyzer",
	-- 	"jsonls",
	-- 	"yamlls",
	-- 	"prosemd_lsp",
	-- 	"marksman",
	-- 	"rnix",
	-- 	"bashls",
	-- 	"elixirls",
	-- 	"lua_ls",
	-- 	"tsserver",
	-- 	"eslint",
	--  "sql_formatter",
	-- }

	require("mason-lspconfig").setup({
		-- ensure_installed = servers,
		-- ensure_installed = vim.tbl_keys(servers),
	})

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
		vim.lsp.handlers.signature_help,
		{ border = "rounded", close_events = { "CursorMoved", "BufHidden" } }
	)

	local common_on_attach = require("plugins.lsp.shared").common_on_attach
	local capabilities = require("plugins.lsp.shared").capabilities()

	if vim.fn.filereadable("/etc/NIXOS") == 1 then
		require("plugins.lsp.lua_ls").setup(capabilities, common_on_attach)
		require("plugins.lsp.rust_tools").setup(capabilities, common_on_attach)
		require("plugins.lsp.eslint").setup(capabilities, common_on_attach)
		require("plugins.lsp.tsserver").setup(capabilities, common_on_attach)

		local lspconfig = require("lsp")
		lspconfig.solargraph.setup({
			on_attach = common_on_attach,
			capabilities = capabilities,
		})
		lspconfig.nil_ls.setup({
			on_attach = function(client, bufnr)
				client.server_capabilities.documentFormattingProvider = false
				common_on_attach(client, bufnr)
			end,
			capabilities = capabilities,
		})
		lspconfig.gdscript.setup({
			on_attach = common_on_attach,
			capabilities = capabilities,
		})

		lspconfig.marksman.setup({
			on_attach = common_on_attach,
			capabilities = capabilities,
		})
	else
		require("mason-lspconfig").setup_handlers({
			-- The first entry (without a key) will be the default handler
			-- and will be called for each installed server that doesn't have
			-- a dedicated handler.
			function(server_name) -- default handler (optional)
				require("lspconfig")[server_name].setup({
					on_attach = common_on_attach,
					capabilities = capabilities,
				})
			end,
			["lua_ls"] = function()
				require("plugins.lsp.lua_ls").setup(capabilities, common_on_attach)
			end,
			["tsserver"] = function()
				require("plugins.lsp.tsserver").setup(capabilities, common_on_attach)
			end,
			["eslint"] = function()
				require("plugins.lsp.eslint").setup(capabilities, common_on_attach)
			end,
			["rust_analyzer"] = function()
				require("plugins.lsp.rust_tools").setup(capabilities, common_on_attach)
			end,
		})
	end
end

return {
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonLog", "MasonUninstall", "MasonUninstallAll" },
		config = function()
			require("mason").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			{
				"SmiteshP/nvim-navbuddy",
				dependencies = {
					"SmiteshP/nvim-navic",
					"MunifTanjim/nui.nvim",
				},
				opts = { lsp = { auto_attach = true } },
			},
			{
				"SmiteshP/nvim-navic",
				requires = "neovim/nvim-lspconfig",
			},
			{ "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" },
			"j-hui/fidget.nvim",
			"kosayoda/nvim-lightbulb",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{ "dodomorandi/rust-tools.nvim", dependencies = { "mfussenegger/nvim-dap" } },
			{
				"folke/neodev.nvim",
				ft = "lua",
			},
		},
		config = function()
			setup_lspconfig()
		end,
	},
}
