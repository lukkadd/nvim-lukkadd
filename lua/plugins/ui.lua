local logo = [[
		             ⣠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ 
		          ⢠⣶⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ 
		          ⠈⠋⣰⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀ 
		          ⢰⣾⣿⠀⠀⠶⣽⠖⠀⠀⠀⠀⠀⠀ 
		  ⢠⣷⣶⣶⣶⣶⣶⣶⣾⣿⣿⣤⣤⣤⣥⣤⣤⣴⣶⡀⠀⠀ 
		⣠⡴⠿⠋⠀⠀⣀⣤⠶⠶⢾⣿⣿⣤⢤⣤⣀⠀⠉⠉⠻⣷⡄⠀ 
		     ⣾⣿⠁⠀⠀⢸⣿⣿⠀⠀⠈⢻⣿⡄⠀⠀⠀⠉⠲⠄
		     ⣿⣿⠀⠀⠀⢸⣿⣿⠀⠀⠀⢸⣿⡇⠀⠀⠀⠀⠀ 
		     ⠘⠿⢶⣤⣤⣼⣿⣿⣤⣀⣤⡾⠟⠀⠀⠀⠀⠀⠀ 
		        ⣠⡾⢻⣿⡿⠻⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀ 
		     ⢀⣴⣾⠋⠀⢸⣿⡇⠀⠈⠳⣦⡀⠀⠀⠀⠀⠀⠀ 
		⠤⠤⣤⣶⣾⡿⠟⠁⠀⠀⢸⣿⡇⠀⠀⠀⠙⢿⣶⣄⡀⠀⠀⠀ 
		  ⠈⠉⠉⠀⠀⠀⠀⠀⢸⣿⡇⠀⠀⠀⠀⠀⠉⠙⠛⠒⠒⠀ 
		     ⠀⣤⠀⠀⠀⢸⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ 
		     ⠙⠶⠛⠀⠀⢸⣿⣿⣷⣄⣀⣀⡀⠀⠀⠀⠀⠀⠀ 
		          ⣸⡿⠉⠉⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀ 
		⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ 
		⠀⠀⠀⠀⠀⠀⣶⣷⣄⣾⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ 
		      ⠈⠉⠉⠀               
			  ]]
logo = string.rep("\n", 1) .. logo .. "\n\n"

return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			bigfile = { enabled = true },
			dashboard = {
				enabled = true,
				preset = {
					header = logo,
					keys = {
						{
							icon = " ",
							key = "f",
							desc = "Find File",
							action = ":lua Snacks.dashboard.pick('files')",
						},
						-- { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
						{
							icon = " ",
							key = "p",
							desc = "Find Projects",
							action = ":lua Snacks.dashboard.pick('projects')",
						},
						{
							icon = " ",
							key = "r",
							desc = "Recent Files",
							action = ":lua Snacks.dashboard.pick('oldfiles')",
						},
						{
							icon = " ",
							key = "c",
							desc = "Config",
							action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
						},
						{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
						{
							icon = "󰒲 ",
							key = "L",
							desc = "Lazy",
							action = ":Lazy",
							enabled = package.loaded.lazy ~= nil,
						},
						{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
					},
				},

				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 1 },
					{ section = "startup" },
				},
			},
			explorer = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			picker = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			-- scroll = { enabled = true },
			-- statuscolumn = { enabled = true },
			-- words = { enabled = true },
		},
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
}
