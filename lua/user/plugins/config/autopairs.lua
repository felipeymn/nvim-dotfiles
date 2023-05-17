local Autopairs = { "windwp/nvim-autopairs" }

Autopairs.event = "BufReadPre"

function Autopairs.config()
  local status_ok, autopairs = pcall(require, "nvim-autopairs")
  if not status_ok then
    return
  end

  autopairs.setup()
end

return Autopairs
