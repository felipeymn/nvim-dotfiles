local status_ok, ntag = pcall(require, "nvim-ts-autotag")
if not status_ok then
	return
end

ntag.setup()
