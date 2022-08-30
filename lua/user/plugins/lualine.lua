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
	fmt = function(str)
		-- return "  " .. str
		return " " .. str
	end,
	icons_enabled = true,
	icon = { align = "left" },
	color = { bg = "#663920" },
	separator = { left = "", right = "" },
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = {
		" ",
		color = { fg = "#fc8363" },
	},
	separator = { right = "" },
	color = { bg = "#663920" },
}

local location = {
	"location",
	separator = { right = "" },
	-- padding = { left = 1, right = 1 },
}

-- cool function for progress
-- local progress = function()
-- 	local current_line = vim.fn.line(".")
-- 	local total_lines = vim.fn.line("$")
-- 	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
-- 	local line_ratio = current_line / total_lines
-- 	local index = math.ceil(line_ratio * #chars)
-- 	return chars[index]
-- end

-- local spaces = function()
-- 	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
-- end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "florence",
		--[[ section_separators = { left = "", right = "" }, ]]
		disabled_filetypes = { "alpha", "dashboard" },
		--[[ always_divide_middle = true, ]]
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
