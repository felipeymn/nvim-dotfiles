local Autopairs = { "windwp/nvim-autopairs" }

Autopairs.event = "BufReadPre"

function Autopairs.config()
	local status_ok, autopairs = pcall(require, "nvim-autopairs")
	if not status_ok then
		return
	end

	autopairs.setup({
		check_ts = true,
		disable_filetype = { "TelescopePrompt" },
	})
end

return Autopairs
