local Lsp = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		{ "williamboman/mason-lspconfig.nvim", lazy = true },
	},
	opts = {
		diagnostics = require("plugins.lsp.diagnostics"),
		servers = require("plugins.lsp.servers"),
		-- setup = {},
	},
	config = function(_, opts)
		local utils = require("plugins.lsp.utils")
		local servers = opts.servers

		utils.setup_mason_server(servers)
		utils.set_diagnostics_config(vim.deepcopy(opts.diagnostics))
		utils:set_diagnostics_signs()
	end,
}

return Lsp
