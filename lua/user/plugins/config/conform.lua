local Conform = {
	"stevearc/conform.nvim",
}

Conform.event = "BufReadPre"

function Conform.config()
	local conform_status_ok, conform = pcall(require, "conform")
	if not conform_status_ok then
		return
	end

	conform.setup({
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd" },
			go = { "golines" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
	})
end

return Conform
