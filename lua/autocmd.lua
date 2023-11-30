local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end
-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- highlight yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format{ async = true}]]

-- local init_group_id = vim.api.nvim_create_augroup("InitGroup", { clear = true })
-- This lets one delete entries from a quickfix list with `dd`
-- vim.api.nvim_create_autocmd({ "FileType" }, {
-- 	group = init_group_id,
-- 	pattern = { "qf" },
-- 	callback = function()
-- 		vim.keymap.set("n", "dd", function()
-- 			local current_quick_fix_index = vim.fn.line(".")
-- 			local quickfix_list = vim.fn.getqflist()
-- 			table.remove(quickfix_list, current_quick_fix_index)
-- 			vim.fn.setqflist(quickfix_list, "r")
-- 			vim.fn.execute(current_quick_fix_index .. "cfirst")
-- 			vim.cmd("copen")
-- 		end, { buffer = true })
-- 	end,
-- 	desc = "Delete entry from Quickfix list",
-- })
-- -- close some filetypes with <q>
-- vim.api.nvim_create_autocmd("FileType", {
--   group = augroup("close_with_q"),
--   pattern = {
--     "PlenaryTestPopup",
--     "help",
--     "lspinfo",
--     "man",
--     "notify",
--     "qf",
--     "spectre_panel",
--     "startuptime",
--     "tsplayground",
--     "neotest-output",
--     "checkhealth",
--     "neotest-summary",
--     "neotest-output-panel",
--   },
--   callback = function(event)
--     vim.bo[event.buf].buflisted = false
--     vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
--   end,
-- })
