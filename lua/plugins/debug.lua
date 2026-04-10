-- lua/plugins/dap.lua

return {
	-- Core DAP client
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			-- UI panels (variables, stack, watches, etc.)
			"rcarriga/nvim-dap-ui",
			-- required by dap-ui
			"nvim-neotest/nvim-nio",
			-- Mason integration for auto-installing adapters
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",
			-- Virtual text showing variable values inline
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			-- ─── Mason: auto-install php-debug-adapter ───────────────────────
			require("mason-nvim-dap").setup({
				ensure_installed = { "php-debug-adapter" },
				automatic_installation = true,
				handlers = {}, -- use default handlers
			})

			-- ─── Virtual text ─────────────────────────────────────────────────
			require("nvim-dap-virtual-text").setup()

			-- ─── DAP UI ───────────────────────────────────────────────────────
			dapui.setup({
				icons = { expanded = "▾", collapsed = "▸", current_frame = "→" },
				layouts = {
					{
						elements = {
							{ id = "scopes", size = 0.40 },
							{ id = "breakpoints", size = 0.20 },
							{ id = "stacks", size = 0.20 },
							{ id = "watches", size = 0.20 },
						},
						size = 40,
						position = "left",
					},
					{
						elements = {
							{ id = "repl", size = 0.5 },
							{ id = "console", size = 0.5 },
						},
						size = 12,
						position = "bottom",
					},
				},
			})

			-- Auto-open/close UI when a session starts/ends
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			-- ─── PHP / Xdebug adapter ─────────────────────────────────────────
			local mason_path = vim.fn.stdpath("data") .. "/mason/packages/php-debug-adapter/extension/out/phpDebug.js"

			dap.adapters.php = {
				type = "executable",
				command = "node",
				args = { mason_path },
			}
			-- ─── PHP debug configurations ──────────────────────────────────────
			dap.configurations.php = {
				{
					name = "Listen for Xdebug (local)",
					type = "php",
					request = "launch",
					port = 9003,
				},
				{
					name = "Launch current file",
					type = "php",
					request = "launch",
					port = 9003,
					program = "${file}",
					cwd = "${fileDirname}",
					runtimeExecutable = "php",
				},
				-- Docker / remote: adjust paths to match your container
				{
					name = "Listen for Xdebug (Docker)",
					type = "php",
					request = "launch",
					port = 9003,
					pathMappings = {
						["/var/www/html"] = "${workspaceFolder}",
					},
				},
			}

			-- ─── Keymaps ──────────────────────────────────────────────────────
			local map = function(lhs, rhs, desc)
				vim.keymap.set("n", lhs, rhs, { desc = desc })
			end

			map("<F5>", function()
				dap.continue()
			end, "Debug: Continue")
			map("<F10>", function()
				dap.step_over()
			end, "Debug: Step Over")
			map("<F11>", function()
				dap.step_into()
			end, "Debug: Step Into")
			map("<F12>", function()
				dap.step_out()
			end, "Debug: Step Out")
			map("<leader>db", function()
				dap.toggle_breakpoint()
			end, "Debug: Toggle Breakpoint")
			map("<leader>dB", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, "Debug: Conditional Breakpoint")
			map("<leader>dl", function()
				dap.run_last()
			end, "Debug: Run Last")
			map("<leader>dr", function()
				dap.repl.open()
			end, "Debug: Open REPL")
			map("<leader>du", function()
				dapui.toggle()
			end, "Debug: Toggle UI")
			map("<leader>dx", function()
				dap.terminate()
			end, "Debug: Terminate")

			-- Hover variable value under cursor
			vim.keymap.set({ "n", "v" }, "<leader>dh", function()
				require("dap.ui.widgets").hover()
			end, { desc = "Debug: Hover Value" })
		end,
	},
}
