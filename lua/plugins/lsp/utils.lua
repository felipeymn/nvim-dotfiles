local Utils = {
	diagnostic_signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
	},

	set_diagnostics_signs = function(self)
		for _, sign in ipairs(self.diagnostic_signs) do
			vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
		end
	end,

	set_diagnostics_config = function(diagnostics)
		vim.diagnostic.config(diagnostics)
	end,

	setup_mason_server = function(servers, setupFunction)
		local mlsp = require("mason-lspconfig")

		local ensure_installed = {} ---@type string[]
		for server, server_opts in pairs(servers) do
			if server_opts then
				server_opts = server_opts == true and {} or server_opts
				ensure_installed[#ensure_installed + 1] = server
			end
		end

		mlsp.setup({ ensure_installed = ensure_installed, automatic_installation = true })
		mlsp.setup_handlers({ setupFunction })
	end,
}

return Utils
