local Colorscheme = {
  set = function(theme)
    local status_ok, _ = pcall(vim.cmd, "colorscheme " .. theme)
    if not status_ok then
      return
    end
  end
}

Colorscheme.set("florence")
