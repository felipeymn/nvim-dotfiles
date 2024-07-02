local Context = { "JoosepAlviste/nvim-ts-context-commentstring" }

Context.lazy = false

function Context.config()
	local status_ok, context = pcall(require, "ts_context_commentstring")
	if not status_ok then
		return
	end

	context.setup()
end

return Context
