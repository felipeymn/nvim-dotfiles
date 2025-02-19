local Plugins = {
  setup = function()
    local manager = require("core.lazy") -- currently using lazy as plugin manager

    if not manager:is_installed() then
      manager:install()
    end

    manager:init("plugins") -- init plugins directory
  end
}

Plugins.setup() -- run setup function
