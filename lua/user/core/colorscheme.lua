local Colorscheme = {}

function Colorscheme.set(colorscheme)
  local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
  if not status_ok then
    return
  end
  vim.api.nvim_set_hl(0, "StartLogo1", { fg = "#a28155" })
  vim.api.nvim_set_hl(0, "StartLogo2", { fg = "#a07e52" })
  vim.api.nvim_set_hl(0, "StartLogo3", { fg = "#9e7b50" })
  vim.api.nvim_set_hl(0, "StartLogo4", { fg = "#9c794d" })
  vim.api.nvim_set_hl(0, "StartLogo5", { fg = "#9a764b" })
  vim.api.nvim_set_hl(0, "StartLogo6", { fg = "#987348" })
  vim.api.nvim_set_hl(0, "StartLogo7", { fg = "#967045" })
  vim.api.nvim_set_hl(0, "StartLogo8", { fg = "#946d43" })
  vim.api.nvim_set_hl(0, "StartLogo9", { fg = "#936a40" })
  vim.api.nvim_set_hl(0, "StartLogo10", { fg = "#91683e" })
  vim.api.nvim_set_hl(0, "StartLogo11", { fg = "#8f653c" })
  vim.api.nvim_set_hl(0, "StartLogo12", { fg = "#8d6239" })
  vim.api.nvim_set_hl(0, "StartLogo13", { fg = "#8b5f37" })
  vim.api.nvim_set_hl(0, "StartLogo14", { fg = "#895d35" })
  vim.api.nvim_set_hl(0, "StartLogo15", { fg = "#875a32" })
  vim.api.nvim_set_hl(0, "StartLogo16", { fg = "#855730" })
  vim.api.nvim_set_hl(0, "StartLogo17", { fg = "#83542e" })
  vim.api.nvim_set_hl(0, "StartLogo18", { fg = "#81512b" })
  vim.api.nvim_set_hl(0, "StartLogo19", { fg = "#7f4f29" })
  vim.api.nvim_set_hl(0, "StartLogo20", { fg = "#7d4c27" })
  vim.api.nvim_set_hl(0, "StartLogo21", { fg = "#7b4925" })
  vim.api.nvim_set_hl(0, "StartLogo22", { fg = "#794623" })
  vim.api.nvim_set_hl(0, "StartLogo23", { fg = "#774421" })
  vim.api.nvim_set_hl(0, "StartLogo24", { fg = "#75411f" })
  vim.api.nvim_set_hl(0, "StartLogo25", { fg = "#733e1d" })
  vim.api.nvim_set_hl(0, "StartLogo26", { fg = "#713b1b" })
  vim.api.nvim_set_hl(0, "StartLogo27", { fg = "#6f3919" })
  vim.api.nvim_set_hl(0, "StartLogo28", { fg = "#6d3617" })
end

return Colorscheme
