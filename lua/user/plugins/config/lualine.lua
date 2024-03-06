local Lualine = { "nvim-lualine/lualine.nvim" }
-- Lualine.event = "VeryLazy"
Lualine.dependencies = "meuter/lualine-so-fancy.nvim"
Lualine.event = "BufReadPre"

function Lualine.config()
	local status_ok, lualine = pcall(require, "lualine")
	if not status_ok then
		return
	end

	local branch = {
		"branch",
		icons_enabled = true,
		icon = {
			"",
			color = { fg = "#fc8363" },
		},
	}
	local mode = {
		"mode",
		fmt = function()
			-- return " "
			-- return str
			return "󰡪"
		end,
	}

	lualine.setup({
		options = {
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			ignore_focus = { "NvimTree" },
			-- theme = "gruvbox",
		},
		sections = {
			lualine_a = { mode },
			lualine_b = { branch },
			lualine_c = { "fancy_diagnostics" },
			lualine_x = { "fancy_searchcount", "filetype" },
			lualine_y = { "location" },
			lualine_z = { "fancy_lsp_servers" },
		},
	})
end

return Lualine
