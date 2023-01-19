local Plugins = {}

function Plugins.setup()

  local manager = require("user.plugins.plugin-manager")
  --local plugins = require("user.plugins.lazy-table")

  if not manager.is_installed() then
    manager.install()
  end

  manager.init("user.plugins.config")
  -- manager.reload_on_save("table.lua")
end

return Plugins
