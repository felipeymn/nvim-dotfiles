local Toggleterm = {
	"akinsho/toggleterm.nvim",
}

Toggleterm.event = "BufReadPre"

function Toggleterm.config()
	require("toggleterm").setup({
		open_mapping = [[<leader>\]],
	})
end

return Toggleterm
