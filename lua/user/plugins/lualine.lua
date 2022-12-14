local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_lsp" },
	sections = { "error", "warn", "info", "hint" },
	symbols = { error = " ", warn = " ", info = " ", hint = " " },
	diagnostics_color = {
		-- Same values as the general color option can be used here.
		error = "DiagnosticFloatingError", -- Changes diagnostics' error color.
		warn = "DiagnosticFloatingWarn", -- Changes diagnostics' warn color.
		info = "DiagnosticFloatingInfo", -- Changes diagnostics' info color.
		hint = "DiagnosticFloatingHint", -- Changes diagnostics' hint color.
	},
	colored = true,
	update_in_insert = true,
	always_visible = true,
	cond = hide_in_width,
}

local diff = {
	"diff",
	colored = true,
	--[[ symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols ]]
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width,
}

local mode = {
	"mode",
	fmt = function(str)
		-- return "  " .. str
		return " " .. str
	end,
	separator = { left = "", right = "" },
}

local filetype = {
	"filetype",
	icons_enabled = true,
	icon = { align = "left" },
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = {
		" ",
		color = { fg = "#fc8363" },
	},
}

local location = {
	"location",
	separator = { left = "", right = "" },
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "florence",
		disabled_filetypes = { "alpha", "dashboard" },
		globalstatus = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch },
		lualine_c = { diff },
		lualine_x = { diagnostics },
		lualine_y = { filetype },
		lualine_z = { location },
	},
})
