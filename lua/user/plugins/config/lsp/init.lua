local Lsp = { "neovim/nvim-lspconfig" }
Lsp.event = "BufReadPre"

Lsp.dependencies = {
	"hrsh7th/cmp-nvim-lsp",
}

function Lsp.config()
	local diagnostics = require("user.plugins.config.lsp.diagnostics")
	local servers = require("user.plugins.config.lsp.servers")
	local lspconfig = require("lspconfig")

	local function on_attach(client, bufnr)
		require("user.plugins.config.lsp.formatting").setup(client, bufnr)
	end

	diagnostics.setup()

	for _, server in pairs(servers) do
		local opts = {
			on_attach = on_attach,
			capabilities = require("cmp_nvim_lsp").default_capabilities(
				vim.lsp.protocol.make_client_capabilities()
			),
			flags = {
				debounce_text_changes = 150,
			},
		}
		local has_custom_opts, server_custom_opts =
			pcall(require, "user.plugins.config.lsp.servers." .. server)
		if has_custom_opts then
			opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
		end
		lspconfig[server].setup(opts)
	end
end

return Lsp
