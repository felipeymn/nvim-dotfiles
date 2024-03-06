local NvimLint = {
	"mfussenegger/nvim-lint",
}

NvimLint.events = { "BufWritePost", "BufReadPost", "InsertLeave" }
function NvimLint.config()
	local lint_status_ok, lint = pcall(require, "lint")
	if not lint_status_ok then
		return
	end

	lint.linters_by_ft = {
		["*"] = { "cspell" },
		go = { "golangcilint" },
		markdown = { "markdownlint" },
		python = { "flake8" },
	}
	vim.api.nvim_create_autocmd(NvimLint.events, {
		callback = function()
			lint.try_lint()
		end,
	})
end

return NvimLint
