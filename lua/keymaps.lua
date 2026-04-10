local wk = require("which-key")

--Disabling arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Preventing clipboard overwrite on paste
vim.keymap.set("x", "p", '"_dP', { noremap = true, silent = true })

--Exit insert mode on jj
vim.keymap.set("i", "jj", "<cmd>stopinsert<cr>l")

--Exit terminal mode with <Esc><Esc>
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

--Toggle in and out of terminal
vim.keymap.set("n", "<C-t>", function()
	Snacks.terminal()
end, { desc = "Toggle terminal" })
vim.keymap.set("t", "<C-t>", function()
	Snacks.terminal()
end, { desc = "Toggle terminal" })
-- Formatting
vim.keymap.set("n", "<C-f>", function()
	vim.lsp.buf.format({ async = true })
end)

--Hover box
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
vim.keymap.set("n", "X", "<cmd>lua vim.diagnostic.open_float()<cr>")

wk.add({

	{
		"<leader>,",
		function()
			Snacks.picker.buffers()
		end,
		desc = "List [B]uffers",
	},
	{
		"<leader><leader>",
		function()
			Snacks.picker.files()
		end,
		desc = "Find [F]ile",
	},

	{ "<leader>c", group = "code" },

	{ "<leader>p", group = "project" },
	{
		"<leader>pp",
		function()
			Snacks.picker.projects()
		end,
		desc = "Projects",
	},
	{
		"<leader>pc",
		function()
			Snacks.dashboard.pick("files", { cwd = vim.fn.stdpath("config") })
		end,
		desc = "Nvim Config",
	},

	-- Buffers
	{ "<leader>b", group = "buffer" },
	{
		"<leader>bb",
		function()
			Snacks.picker.buffers()
		end,
		desc = "List [B]uffers",
	},
	{ "<leader>bk", "<cmd>bd<cr>", desc = "[K]ill Buffer" },
	{ "<leader>bn", "<cmd>bn<cr>", desc = "[N]ext Buffer" },
	{ "<leader>bp", "<cmd>bp<cr>", desc = "[P]revious Buffer" },
	{ "<leader>bs", "<cmd>new<cr>", desc = "[S]cratch Buffer" },

	-- Windows
	{ "<leader>w", group = "Window" },
	{ "<leader>wc", "<cmd>wincmd c<cr>", desc = "Close window" },
	{ "<leader>wh", "<cmd>wincmd h<cr>", desc = "Move to window left" },
	{ "<leader>wj", "<cmd>wincmd j<cr>", desc = "Move to window down" },
	{ "<leader>wk", "<cmd>wincmd k<cr>", desc = "Move to window up" },
	{ "<leader>wl", "<cmd>wincmd l<cr>", desc = "Move to window right" },
	{ "<leader>wH", "<cmd>wincmd H<cr>", desc = "Move window left" },
	{ "<leader>wJ", "<cmd>wincmd J<cr>", desc = "Move window down" },
	{ "<leader>wK", "<cmd>wincmd K<cr>", desc = "Move window up" },
	{ "<leader>wL", "<cmd>wincmd L<cr>", desc = "Move window right" },
	{ "<leader>wv", "<cmd>wincmd v<cr>", desc = "Split window vertically" },
	{ "<leader>ws", "<cmd>wincmd s<cr>", desc = "Split window horizontally" },

	-- Find
	{ "<leader>f", group = "Find" },
	{
		"<leader>fg",
		function()
			Snacks.picker.git_status()
		end,
		desc = "[G]it Changes",
	},
	{
		"<leader>ff",
		function()
			Snacks.picker.files()
		end,
		desc = "Find [F]ile",
	},
	{
		"<leader>.",
		function()
			Snacks.picker.git_files()
		end,
		desc = "Find Git Files",
	},
	{
		"<leader>f.",
		function()
			Snacks.picker.git_files()
		end,
		desc = "Find Git files",
	},
	{
		"<leader>fr",
		function()
			Snacks.picker.recent()
		end,
		desc = "Open [R]ecent files",
	},
	{ "<leader>fo", "<cmd>Oil<cr>", desc = "[O]il" },

	--LSP
	{
		"<leader>fs",
		function()
			Snacks.picker.lsp_symbols()
		end,
		desc = "Find [S]ymbol",
	},

	{
		"<leader>e",
		function()
			Snacks.explorer()
		end,
		desc = "File [E]xplorer",
	},
	{
		"<leader>/",
		function()
			Snacks.picker.grep()
		end,
		desc = "Live [G]rep",
	},

	-- Git
	{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
	{ "<leader>gt", "<cmd>Gitsigns preview_hunk_inline<cr>", desc = "Gitsigns preview hunk inline" },
	{ "<leader>gb", "<cmd>Gitsigns blame<cr>", desc = "Gitsigns blame" },
	{ "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "Gitsigns diffthis" },

	-- Diagnostics
	{ "<leader>d", group = "Diagnostics" },
	{ "<leader>d]", vim.diagnostic.goto_next, desc = "Next diagnostic" },
	{ "<leader>d[", vim.diagnostic.goto_prev, desc = "Previous diagnostic" },

	-- List
	{ "<leader>l", group = "List" },
	{ "<leader>lt", "<cmd>TodoTrouble<cr>", desc = "List TODOs in a buffer" },
})
