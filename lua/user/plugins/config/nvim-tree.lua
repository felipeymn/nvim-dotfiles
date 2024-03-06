local NvimTree = { "nvim-tree/nvim-tree.lua" }

--NvimTree.lazy = false
NvimTree.dependencies = { "nvim-tree/nvim-web-devicons" }

NvimTree.cmd = "NvimTreeToggle"

function NvimTree.config()
  local status_ok, nvim_tree = pcall(require, "nvim-tree")
  if not status_ok then
    return
  end

  nvim_tree.setup({
    renderer = {
      root_folder_label = false,
    },
  })
end

return NvimTree
