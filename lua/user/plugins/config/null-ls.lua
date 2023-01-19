local NullLs = {
  "jose-elias-alvarez/null-ls.nvim",
}

function NullLs.setup(options)
  local nls = require("null-ls")
  nls.setup({
    debounce = 150,
    save_after_format = false,
    sources = {
      -- nls.builtins.formatting.prettierd,
      nls.builtins.formatting.stylua,
      nls.builtins.formatting.fish_indent,
      -- nls.builtins.formatting.fixjson.with({ filetypes = { "jsonc" } }),
      -- nls.builtins.formatting.eslint_d,
      -- nls.builtins.diagnostics.shellcheck,
      nls.builtins.formatting.shfmt,
      nls.builtins.diagnostics.markdownlint,
      -- nls.builtins.diagnostics.luacheck,
      nls.builtins.formatting.prettierd.with({
        filetypes = { "markdown" }, -- only runs `deno fmt` for markdown
      }),
      -- nls.builtins.code_actions.gitsigns,
      nls.builtins.formatting.isort,
      nls.builtins.formatting.black,
      nls.builtins.diagnostics.flake8,
    },
    on_attach = options.on_attach,
    root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", ".git"),
  })
end

function NullLs.has_formatter(ft)
  local sources = require("null-ls.sources")
  local available = sources.get_available(ft, "NULL_LS_FORNullLsATTING")
  return #available > 0
end

return NullLs
