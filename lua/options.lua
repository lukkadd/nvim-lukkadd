-- Line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- Tabs & Indentation
vim.opt.autoindent = true
vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Line wrapping
vim.opt.wrap = false

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Cursor Line
vim.opt.cursorline = false -- highlight current line

-- Appearance
vim.opt.termguicolors = true
vim.opt.background = "dark"
--vim.opt.signcolumn = "no" -- Renders a line of xymbols to prevent text shifting

-- Backspace
vim.opt.backspace = "indent,eol,start"

-- Split Windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Keywords
vim.opt.iskeyword:append("-")

-- Clipboard
vim.opt.clipboard:append("unnamedplus")

--Terminal
vim.opt.shell = "pwsh"

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
