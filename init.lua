if vim.g.vscode then
	-- VSCode Neovim
	require("user.vscode_keymaps")
	vim.opt.clipboard:append("unnamedplus")
else
	--Set leader
	vim.g.mapleader = " "
	require("options") -- Load Basic Neovim Configuration
	require("config.lazy") -- Package Manager
	require("keymaps") -- Keybindings and which-key config
	require("theme") -- Theme config
end
