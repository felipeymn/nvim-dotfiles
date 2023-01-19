local Mason = {
  "williamboman/mason.nvim",
}

-- Mason.dependencies = {
--   "williamboman/mason-lspconfig.nvim"
-- }
-- mason.nvim is optimized to load as little as possible during setup. Lazy-loading the plugin, or somehow deferring the setup, is not recommended.
-- Mason.lazy = false
Mason.event = "BufReadPre"
-- Mason.tools  = {
--   "stylua"
-- }

-- function Mason.check()
--   local mr = require("mason-registry")
--   for _, tool in ipairs(Mason.tools) do
--     local p = mr.get_package(tool)
--     if not p:is_installed() then
--       p:install()
--     end
--   end
-- end

function Mason.config()
  require("mason").setup()
  -- Mason.check()
  -- require("mason-lspconfig").setup({
  --   automatic_installation = true,
  -- })
end

return Mason
