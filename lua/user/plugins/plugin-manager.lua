local Lazy = {}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

local opts = {
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
}

function Lazy.is_installed()
	if not vim.loop.fs_stat(lazypath) then
		return false
	end
	return true
end

function Lazy.install()
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end

function Lazy.init(plugins)
	vim.opt.runtimepath:prepend(lazypath)
	require("lazy").setup(plugins, opts)
end

return Lazy
