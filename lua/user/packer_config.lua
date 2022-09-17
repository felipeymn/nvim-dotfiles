local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer, close and reopen neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the packer_config.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_config.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-- List of plugins
	-- Core
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("lewis6991/impatient.nvim")
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("kyazdani42/nvim-web-devicons") -- Custom icons (requires nerd font)
	use("kyazdani42/nvim-tree.lua") -- File tree explorer
	use("akinsho/bufferline.nvim")
	use("nvim-lualine/lualine.nvim")
	use("goolord/alpha-nvim")

	-- Colorscheme
	--	use("sainnhe/everforest")
	use("felipeymn/florence.nvim")

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

	-- Completion plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("hrsh7th/cmp-nvim-lsp") -- LSP completions
	use("hrsh7th/cmp-nvim-lua") -- nvim lua API completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions

	-- Snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- Telescope
	use("nvim-telescope/telescope.nvim") -- fuzzy finder

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter", -- Language parser that provides better syntax highlighting and other features
		run = ":TSUpdate",
	})
	--[[ use("nvim-treesitter/playground") ]]

	-- Utils
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("JoosepAlviste/nvim-ts-context-commentstring") -- Define comment style based on the current cursor location
	use("lewis6991/gitsigns.nvim") -- Git decorations for buffers
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("windwp/nvim-ts-autotag")
	use("akinsho/toggleterm.nvim")
	use("ahmedkhalf/project.nvim")
	use("kylechui/nvim-surround")
	use("norcalli/nvim-colorizer.lua")
	use("Fymyte/rasi.vim")
  use("folke/which-key.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
