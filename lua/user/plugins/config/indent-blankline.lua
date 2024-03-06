local IndentBlankline = { "lukas-reineke/indent-blankline.nvim", main = "ibl" }

IndentBlankline.event = "BufReadPre"

function IndentBlankline.config()
	local status_ok, indent_blankline = pcall(require, "ibl")
	if not status_ok then
		return
	end

	indent_blankline.setup({
		indent = {
			char = "│",
			tab_char = "│",
		},
		scope = { enabled = false },
		exclude = {
			filetypes = {
				"help",
				"alpha",
				"neo-tree",
				"trouble",
				"lazy",
				"mason",
				"toggleterm",
			},
		},
	})
end

return IndentBlankline
