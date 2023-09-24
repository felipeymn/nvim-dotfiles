local Treesitter = { "nvim-treesitter/nvim-treesitter" }
Treesitter.build = ":TSUpdate"
Treesitter.event = "BufReadPost"
Treesitter.dependencies =
	{ { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" } }
function Treesitter.config()
	local status_ok, configs = pcall(require, "nvim-treesitter.configs")
	if not status_ok then
		return
	end
	configs.setup({
		autotag = {
			enable = true,
		},
		ensure_installed = "all",
		highlight = { enable = true },
		indent = { enable = true, disable = { "python" } },
	})
end

return Treesitter
