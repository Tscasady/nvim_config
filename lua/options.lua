local options = {
	backup = false, --creates backup file
	swapfile = false, --unneeded with other autosave features?
	writebackup = false, --if a file is being edited by another program can't edit

	completeopt = { "menuone", "noselect" }, --for cmp?

	clipboard = "unnamedplus", --system clipboard access
	cmdheight = 2, --more space in command line
	hlsearch = false, --highlight all matches for previous search pattern
	ignorecase = true, --search ignores case
	smartcase = true, --in conjunction with ignore case allows lower to be insensitive and upper to be sens
	mouse = "a", --allow mouse usage
	pumheight = 10, --pop up height

	showtabline = 2, --always show tabs
	smartindent = true, --smartindent
	expandtab = true, --converts tabs to spaces
	shiftwidth = 2, --default tab length
	splitbelow = true, --default split down
	splitright = true, --default split right

	termguicolors = true,

	cursorline = true, --highlights current line
	number = true, --enables line numbers
	relativenumber = true, --enables relative line numbers
	numberwidth = 4, --size of numberline bar
	signcolumn = "yes", --always show

	timeoutlen = 500, --time for a mapped sequence (ms)
	undofile = true, --enables persistent undo
	updatetime = 300, --faster completion (ms)

	scrolloff = 10,
	sidescrolloff = 10,

	fileencoding = "utf-8", -- the encoding written to a file
	wrap = false,
	-- Text behaviour
	--                    + 't'    -- auto-wrap text using textwidth
	--                    + 'c'    -- auto-wrap comments using textwidth
	--                    + 'r'    -- auto insert comment leader on pressing enter
	--                    - 'o'    -- don't insert comment leader on pressing o
	--                    + 'q'    -- format comments with gq
	--                    - 'a'    -- don't autoformat the paragraphs (use some formatter instead)
	--                    + 'n'    -- autoformat numbered list
	--                    - '2'    -- I am a programmer and not a writer
	--                    + 'j'    -- Join comments smartly
	-- shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
	-- shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
	-- shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
	-- shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
	-- shellquote = "",
	-- shellxquote = "",
}



for k, v in pairs(options) do
	vim.opt[k] = v
end
vim.opt.iskeyword:append("-")
vim.g.format_on_save = false
vim.cmd([[autocmd FileType * setlocal formatoptions-=ro]])

vim.g.diagnostics_active = true
function _G.toggle_diagnostics()
  if vim.g.diagnostics_active then
    vim.g.diagnostics_active = false
    vim.diagnostic.hide()
  else
    vim.g.diagnostics_active = true
    vim.diagnostic.show()
  end
end

vim.api.nvim_set_keymap('n', '<leader>tt', ':call v:lua.toggle_diagnostics()<CR>',  {noremap = true, silent = true})
