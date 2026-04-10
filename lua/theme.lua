--vim.cmd.colorscheme "catppuccin-mocha"

function SetTheme(color)
	--color = color or "vague"
	color = color or "vesper"
	vim.cmd.colorscheme(color)

	--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

SetTheme()
