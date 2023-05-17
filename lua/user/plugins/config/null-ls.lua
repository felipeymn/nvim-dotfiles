local NullLs = {
  "jose-elias-alvarez/null-ls.nvim",
}

NullLs.event = "BufReadPre"

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

function NullLs.config()
  local nls = require("null-ls")
  local callback = function()
    vim.lsp.buf.format({
      bufnr = bufnr,
      filter = function(client)
        return client.name == "null-ls"
      end
    })
  end
  nls.setup({
    debounce = 150,
    save_after_format = true,
    sources = {
      nls.builtins.formatting.prettierd,
      nls.builtins.formatting.stylua,
      -- nls.builtins.formatting.fixjson.with({ filetypes = { "jsonc" } }),
      nls.builtins.formatting.eslint_d,
      -- nls.builtins.diagnostics.shellcheck,
      nls.builtins.diagnostics.markdownlint,
      -- nls.builtins.code_actions.gitsigns,
      -- nls.builtins.formatting.isort,
      nls.builtins.formatting.black,
      nls.builtins.diagnostics.flake8,
    },
    -- on_attach = options.on_attach,
    root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", ".git"),
    on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = callback
        })
      end
    end,
  })
end

function NullLs.has_formatter(ft)
  local sources = require("null-ls.sources")
  local available = sources.get_available(ft, "NULL_LS_FORNullLsATTING")
  return #available > 0
end

return NullLs
