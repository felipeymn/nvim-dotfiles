local Colorizer = {
  "NvChad/nvim-colorizer.lua",
}

Colorizer.event = "BufReadPre"

function Colorizer.config()
  require("colorizer").setup({
    user_default_options = {
      names = false,
    },
  })
end

return Colorizer
