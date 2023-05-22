local Alpha = { "goolord/alpha-nvim" }
-- Alpha.cmd = "Alpha"
-- Alpha.lazy = false
Alpha.event = "VimEnter"
function Alpha.config()
	local alpha_status_ok, alpha = pcall(require, "alpha")
	if not alpha_status_ok then
		return
	end

	local autocmd = vim.api.nvim_create_autocmd -- Create autocommand
	-- Disable the statusline, tabline and cmdline while the alpha dashboard is open
	autocmd("User", {
		pattern = "AlphaReady",
		desc = "disable status, tabline and cmdline for alpha",
		callback = function()
			vim.go.laststatus = 0
			vim.opt.showtabline = 0
			--[[ vim.opt.cmdheight = 0 ]]
		end,
	})
	autocmd("BufUnload", {
		buffer = 0,
		desc = "enable status, tabline and cmdline after alpha",
		callback = function()
			vim.go.laststatus = 3
			vim.opt.showtabline = 2
			--[[ vim.opt.cmdheight = 1 ]]
		end,
	})

	local florence_sm = {
		"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠤⠀⢠⠲⢒⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣚⠾⠂⠓⠋⢋⠑⠒⢨⠀⢁⡱⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠡⡂⠄⢠⢢⢀⡀⠀⠀⠀⠀⠀⢀⠤⠒⠀⠈⡨⠎⠒⣄⣲⡁⠠⠈⠀⢤⠨⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠀⢀⡉⣂⢎⠸⡘⡠⢤⠀⠀⣰⠘⣄⣩⡦⢸⠌⢬⠨⠊⠘⡄⢕⢢⠄⠦⡀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠀⠈⠁⢁⢄⡺⢰⠯⢗⠆⡎⠔⠨⢀⠄⠅⠅⠀⡡⡁⠡⢭⠝⢥⢻⡑⡌⠀⡐⠌⣢⠀⠆⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠀⠀⠀⠀⠀⠐⠊⡨⢫⣫⠩⠴⠔⡡⠊⡠⢐⠬⡋⡴⡭⠊⠁⢸⠈⡹⢰⢻⠈⠊⢌⢠⢸⢠⢰⢤⣀⣠⠠⠆⢠⠀⠀⠀",
		"⠀⠀⠀⠀⠀⠀⣔⡅⠀⣸⡐⠉⠀⡠⢎⠎⡐⠉⣀⣎⠠⠦⣅⣀⡀⠀⠀⠤⡵⠈⡮⢆⠄⡨⡌⠎⡘⠟⢳⡬⢷⡳⠌⡳⡡⠴⠀",
		"⠀⠀⠀⠀⠀⠀⠪⠍⢽⢻⣓⢔⠅⡈⢞⠠⠿⣱⠎⠀⠘⣤⠹⢝⠹⠉⢂⡴⠁⢰⠥⡬⣔⠱⢀⠀⠈⠌⠽⢟⠏⢀⣢⠀⠀⠀⠀",
		"⠀⠀⠀⢀⡀⣐⡂⢐⢅⣠⠗⠄⢐⣢⠃⡡⡈⢝⢨⢚⢜⣬⣇⣠⣶⠀⠖⡸⠂⠐⣇⢬⡻⣶⡧⣡⡦⡖⡂⠄⠀⠐⡎⠀⠀⠀⠀",
		"⠀⠀⠐⢠⢀⢂⡨⡥⢃⢀⠘⠁⡌⢵⡜⣔⢜⡝⢁⠡⢘⠓⠒⠒⠉⠀⠀⠀⠀⠀⠈⡶⡢⢽⣿⢣⣐⣈⢉⠀⢠⡮⠁⠀⠀⠀⠀",
		"⠀⠀⠘⢌⢣⡾⣢⢥⣠⠁⡐⢸⢁⡼⡶⡏⢗⡱⠐⠃⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⢀⣀⠌⠉⣙⣇⢡⢏⢙⣐⡩⠁⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠚⡅⣦⣬⢃⡏⢀⠀⡄⢀⠙⡣⢔⢎⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠙⢛⣧⢪⡊⠀⠀⠀⢷⡀⠘⡁⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠀⠀⢈⠔⢉⢀⡞⢡⣏⣎⢹⢎⡧⣿⡪⣳⠢⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠋⠀⠀⠐⢐⡚⢀⣈⠂⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠀⠀⠆⡆⢡⡌⡿⡞⡉⡸⡫⢸⣡⡎⢎⠈⠐⢡⡀⠀⠀⠀⠀⠠⠴⡦⠬⠭⠥⡐⡀⢀⡕⢁⠀⢘⠀⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠀⢀⠸⠀⢰⢧⠞⡸⢪⢑⡱⣺⣟⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠩⠩⠥⠒⠊⢸⠋⢄⠀⠂⠀⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠀⠘⣀⠂⢡⠃⠸⠷⢰⣐⠠⣯⢗⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣄⣤⣄⣀⠀⠀⠀⣀⠊⣁⠣⡒⢔⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠀⠀⠐⢡⡮⢁⣆⣠⠸⡇⢡⡻⣦⡯⣦⣁⢀⢄⣠⢠⠦⣴⠿⣻⢿⣿⢿⢻⡙⢍⠄⡸⡏⣯⠁⠂⠓⠈⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠀⠰⡐⢎⠏⠀⠃⣅⢇⡧⠅⡏⠷⣿⣟⢝⣿⢬⡏⣒⢘⠭⢿⣫⢝⠿⡻⠙⡫⣨⣣⣻⢱⠄⢂⢄⢸⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠀⢀⢸⠜⣦⠰⠇⣿⡞⠠⢲⣱⣼⣿⣿⡦⣫⠁⢈⠠⠕⠻⠟⡨⡐⢋⢠⣾⣿⣿⡟⢿⣠⠈⠢⡀⢹⠨⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠀⠈⢸⠄⣰⡬⣘⠿⢱⢂⠦⠼⣽⣿⣿⠏⡱⠁⠀⠀⠀⠉⠘⡨⣢⠴⣳⣯⣿⣿⡿⣏⢊⢕⠄⠳⡄⠗⠡⡄⠀⠀⠀⠀",
		"⠀⠀⠀⠀⠅⡽⡠⡌⢑⣼⠀⠘⠎⡏⢸⣽⣿⣟⠈⠰⠀⠀⠀⠀⠀⢘⢘⠷⢿⡯⣯⣿⣿⡿⣙⠞⡔⢥⠘⣇⠌⠆⣀⡀⠀⠀⠀",
		"⠀⠀⠀⠀⢀⠃⡟⡇⢿⡆⢚⠀⢆⢃⢯⣿⣿⣽⣶⠄⡀⡀⠐⠀⠠⠠⡪⡂⢃⣾⣽⣿⡾⢻⡗⣶⡇⡞⢠⢂⣆⡶⠩⠅⠀⠀⠀",
		"⠀⠀⠀⢀⠺⣇⠍⠐⣘⢦⢸⣎⢠⠠⠻⣻⣿⣿⡆⢜⠂⠀⠀⠀⠐⠆⠀⠄⡉⡧⡫⣿⣟⡏⣫⣿⠡⡁⠩⠀⢤⢃⡣⠂⠀⠀⠀",
		"⠀⠀⠀⢀⠆⢸⠎⠱⡿⠊⡮⡝⠡⡣⡁⣾⣿⡟⡧⠀⠄⠁⠀⠀⠈⠀⠊⠨⣊⣜⢥⢿⣿⢡⡌⢦⠤⡇⢠⢲⠸⣨⠠⠀⠀⠀⠀",
		"⠀⠀⡀⢀⠲⡈⡆⢓⠇⢿⣟⠇⡤⡔⣼⡿⡿⠈⠆⠘⠀⠀⡀⠀⠀⠀⢀⠘⠡⣪⠗⢽⠕⠳⣺⡘⡐⠁⠈⢃⢔⢃⠄⡀⠀⠀⠀",
		"⠀⠌⠄⢘⡓⢐⠏⠜⢺⢸⣿⢂⣵⠡⡙⢻⣿⣆⠀⢈⠀⡑⠈⠀⠀⠀⠀⠀⡄⠠⠢⣪⣖⡈⠁⡗⡔⡄⡀⡘⠣⠸⡅⠐⠄⠀⠀",
		"⡜⣀⠂⣘⢅⠯⠑⠮⠑⣼⠈⢠⡧⣠⠀⠐⠇⣠⢣⡑⠀⠀⠀⠀⠁⠀⠀⠀⠀⠠⠅⡌⡛⠈⠄⠡⠡⠊⢄⢁⡆⣥⠰⢸⡀⠀⠀",
	}

	local function create_button(text, cmd, hl, shortcut, hl_shortcut)
		return {
			type = "button",
			val = text,
			opts = {
				position = "center",
				hl = hl,
				shortcut = shortcut,
				align_shortcut = "right",
				hl_shortcut = hl_shortcut,
				cursor = 5,
				width = 50,
				keymap = {
					"n",
					shortcut,
					cmd,
					{ noremap = true, silent = true, nowait = true },
				},
			},
		}
	end

	local function colorize_header()
		local lines = {}

		for i, chars in pairs(florence_sm) do
			local line = {
				type = "text",
				val = chars,
				opts = {
					--[[ hl = "Statement", ]]
					hl = "StartLogo" .. i % 28 + 1,
					shrink_margin = false,
					position = "center",
				},
			}

			table.insert(lines, line)
		end

		return lines
	end

	local headers = {
		type = "group",
		val = colorize_header(),
	}
	local buttons = {
		type = "group",
		val = {
			{
				type = "text",
				val = "⊱┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄•°•❀ •°•┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄⊰",
				opts = { hl = "Comment", position = "center" },
			},
			{ type = "padding", val = 1 },
			create_button(
				"󰈞  Find file",
				":Telescope find_files <CR>",
				"Statement",
				"f",
				"Comment"
			),
			{ type = "padding", val = 1 },
			create_button(
				"  Find project",
				":Telescope projects <CR>",
				"Statement",
				"p",
				"Comment"
			),
			{ type = "padding", val = 1 },
			create_button(
				"  Recently used files",
				":Telescope oldfiles <CR>",
				"Statement",
				"r",
				"Comment"
			),
			{ type = "padding", val = 1 },
			create_button(
				"  Configuration",
				":e ~/.config/nvim/init.lua <CR>",
				"Statement",
				"c",
				"Comment"
			),
			{ type = "padding", val = 1 },
			create_button("󰗼  Quit", ":qa<CR>", "Statement", "q", "Comment"),
		},
		position = "center",
	}

	-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
	-- alpha.setup(dashboard.opts)
	alpha.setup({
		layout = {
			{ type = "padding", val = 1 },
			headers,
			{ type = "padding", val = 1 },
			buttons,
		},
		--[[ opts = { margin = 5 }, ]]
	})
end

return Alpha
