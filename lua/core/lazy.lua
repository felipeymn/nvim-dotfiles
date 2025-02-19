local Lazy = {
	path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim",
	opts = {
		dev = {
			path = "$HOME/development/projects",
		},
		performance = {
			rtp = {
				disabled_plugins = {
					"gzip",
					"matchit",
					"matchparen",
					"netrwPlugin",
					"tarPlugin",
					"tohtml",
					"tutor",
					"zipPlugin",
				},
			},
		},
	},

	is_installed = function(self)
		if not vim.loop.fs_stat(self.path) then
			return false
		end
		return true
	end,

	install = function(self)
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"--single-branch",
			"https://github.com/folke/lazy.nvim.git",
			self.path,
		})
	end,

	init = function(self, plugins)
		vim.opt.runtimepath:prepend(self.path)
		require("lazy").setup(plugins, self.opts)
	end,
}

return Lazy
