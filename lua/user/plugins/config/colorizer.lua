local Colorizer = {
  "NvChad/nvim-colorizer.lua",
}

Colorizer.event = "BufReadPre"

function Colorizer.config()
  require("colorizer").setup()
end

return Colorizer
