local Servers = {
	tailwindcss = {},
	gopls = {},
	angularls = {},
	rubocop = {},
	ts_ls = {},
	marksman = {},
	lua_ls = {
		settings = {
			telemetry = { enable = false },
			single_file_support = true,
			settings = {
				Lua = {
					workspace = {
						checkThirdParty = false,
					},
					runtime = {
						version = "LuaJIT",
					},
					completion = {
						workspaceWord = true,
						callSnippet = "Both",
					},
					misc = {
						parameters = {
							"--log-level=trace",
						},
					},
					diagnostics = {
						-- enable = false,
						groupSeverity = {
							strong = "Warning",
							strict = "Warning",
						},
						groupFileStatus = {
							["ambiguity"] = "Opened",
							["await"] = "Opened",
							["codestyle"] = "None",
							["duplicate"] = "Opened",
							["global"] = "Opened",
							["luadoc"] = "Opened",
							["redefined"] = "Opened",
							["strict"] = "Opened",
							["strong"] = "Opened",
							["type-check"] = "Opened",
							["unbalanced"] = "Opened",
							["unused"] = "Opened",
						},
						globals = { "vim" },
						unusedLocalExclude = { "_*" },
					},
					format = { enable = false },
				},
			},
		},
	},
}

return Servers
