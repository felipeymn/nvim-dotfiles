local status_ok, surround = pcall(require, "nvim-surround")
if not status_ok then
	return
end

surround.setup({
	keymaps = {
		normal = "<leader>s",
		normal_cur = "<leader>ss",
		normal_line = "<leader>S",
		normal_cur_line = "<leader>SS",
	},
})
