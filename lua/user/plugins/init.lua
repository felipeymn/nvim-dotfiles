local Plugins = {}

function Plugins.setup()
	local manager = require("user.plugins.plugin-manager")

	if not manager.is_installed() then
		manager.install()
	end

	manager.init("user.plugins.config")
end

return Plugins
