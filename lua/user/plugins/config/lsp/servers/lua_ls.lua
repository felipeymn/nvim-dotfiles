-- return {
--   settings = {
--     Lua = {
--       workspace = { checkThirdParty = false,
--         library = {
--           [vim.fn.expand("$VIMRUNTIME/lua")] = true,
--           [vim.fn.stdpath("config") .. "/lua"] = true,
--         }
--       },
--       telemetry = { enable = false },
--     },
--   }
-- }
return {
	settings = {
		-- cmd = { "/home/folke/projects/lua-language-server/bin/lua-language-server" },
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
				format = {
					enable = false,
					defaultConfig = {
						indent_style = "space",
						indent_size = "2",
						continuation_indent_size = "2",
					},
				},
			},
		},
	},
}
