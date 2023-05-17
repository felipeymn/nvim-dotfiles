local IndentBlankline = { "lukas-reineke/indent-blankline.nvim" }

IndentBlankline.event = "BufReadPre"

function IndentBlankline.config()
  local status_ok, indent_blankline = pcall(require, "indent_blankline")
  if not status_ok then
    return
  end

  indent_blankline.setup({
    buftype_exclude = { "terminal", "nofile", "telescope" },
    show_current_context = true,
    filetype_exclude = {
      "help",
      "dashboard",
      "NvimTree",
      "Telescope",
      "yuck",
    },
    char = "│",
  })
end

return IndentBlankline
