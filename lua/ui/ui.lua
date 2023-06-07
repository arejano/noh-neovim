function ColorMyPencils()
	local time = tonumber(os.date('%H', os.time()))

	if time > 16 then
		GruvLightBoxTheme()
	else
		CatTheme();
	end
end

function CatTheme()
	vim.cmd("colorscheme catppuccin-frappe")
	vim.api.nvim_set_hl(0, "Normal", { bg = "#0c0c0c" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.cmd("highlight! link SignColumn LineNr")
end

function CatLightTheme()
	vim.cmd("colorscheme catppuccin-latte")
	vim.api.nvim_set_hl(0, "Normal", { bg = "#0c0c0c" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.cmd("highlight! link SignColumn LineNr")
end

function GruvLightBoxTheme()
	vim.cmd("colorscheme gruvbox")
	vim.opt.background = "light"
	vim.cmd("highlight! link SignColumn LineNr")
end

function Kanagawa()
	vim.cmd("colorscheme kanagawa")
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "#0c0c0c" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.cmd("highlight! link SignColumn LineNr")
end


Kanagawa();

-- vim.cmd("set winbar=%f")
-- vim.cmd(":TransparentDisable")

-- ColorMyPencils()
-- GruvLightBoxTheme()
