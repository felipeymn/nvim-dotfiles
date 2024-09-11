local Codeium = {
	"Exafunction/codeium.nvim",
}

Codeium.event = "BufReadPre"
Codeium.dependencies = {
	"nvim-lua/plenary.nvim",
	"hrsh7th/nvim-cmp",
}

function Codeium.config()
	require("codeium").setup({})
end

return Codeium
