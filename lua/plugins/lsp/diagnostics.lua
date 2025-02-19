local Diagnostics = {
	virtual_text = false,
	signs = {
		active = require("plugins.lsp.utils").diagnostic_signs,
	},
	update_in_insert = false,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
}

return Diagnostics
