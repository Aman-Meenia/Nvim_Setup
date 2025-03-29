vim.cmd("let g:netrw_liststyle = 3")
local opt = vim.opt -- for conciseness

opt.undofile = true
opt.undodir = vim.fn.expand("~/.undodir")
-- Set maximum line length indicator
opt.colorcolumn = "100" -- Shows a vertical line at column 100

-- Optional: set text width to automatically wrap at 100 characters
opt.textwidth = 100 -- Automatically wrap text at 100 characters when inserting text

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.smartindent = true
opt.breakindent = true

vim.opt.confirm = true -- confirm to save changes before exiting modified buffer

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.hlsearch = true
opt.incsearch = true

-- cursor line
opt.cursorline = true -- highlight the current cursor line
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.cursorlineopt = "number"
vim.cmd([[highlight LineNr guifg=#FFA500]]) -- Orange for all relative line numbers

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#91594C", bold = true })
	end,
})

local function augroup(name)
	return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- -- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		(vim.hl or vim.highlight).on_yank()
	end,
})
