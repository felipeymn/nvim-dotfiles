local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local mason_lspconfig_status_ok, mason_lspconfig =
pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
  return
end

local lspconfig = require("lspconfig")

local servers = {
  "jsonls",
  "sumneko_lua",
  "angularls",
  "tsserver",
  "eslint",
  "cssls",
  "bashls",
  "pylsp",
  "pyright",
  "tailwindcss",
}

mason.setup()
mason_lspconfig.setup({
  ensure_installed = servers,
})

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("user.plugins.lsp.handlers").on_attach,
    capabilities = require("user.plugins.lsp.handlers").capabilities,
  }
  local has_custom_opts, server_custom_opts =
  pcall(require, "user.plugins.lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
  end
  lspconfig[server].setup(opts)
end
