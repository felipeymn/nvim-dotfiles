local Transparent = {
	"xiyaowong/transparent.nvim",
}

Transparent.event = "BufReadPre"

function Transparent.config()
	require("transparent").setup({})
end

return Transparent
