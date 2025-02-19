local TailwindSorter = {
  "laytan/tailwind-sorter.nvim",
  ft = { "html", "tsx" },
  build = "cd formatter && npm i && npm run build",
}

return TailwindSorter
