local TailwindSorter = {
	"laytan/tailwind-sorter.nvim",
}

TailwindSorter.event = "BufReadPre"
TailwindSorter.dependencies =
	{ "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" }
TailwindSorter.build = "cd formatter && npm i && npm run build"

function TailwindSorter.config()
	require("tailwind-sorter").setup()
end

return TailwindSorter
