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
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			require("cmp_nvim_lsp").default_capabilities(),
			opts.capabilities or {}
		)

		local function setup(server_name)
			local server_opts = vim.tbl_deep_extend("force", {
				capabilities = vim.deepcopy(capabilities),
			}, servers[server_name] or {})
			require("lspconfig")[server_name].setup(server_opts)
		end

		utils.setup_mason_server(servers, setup)
		utils.set_diagnostics_config(vim.deepcopy(opts.diagnostics))
		utils:set_diagnostics_signs()
	end,
}

return Lsp
