local function keymap(mode, keys, func, desc)
	vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
end

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<space>m", function()
	vim.lsp.buf.format({ async = true })
end, bufopts)
keymap("n", "<Space>", "<Nop>")

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

keymap("n", "<leader>l", "<cmd>:Lazy<cr>")
keymap("n", "<leader>m", "<cmd>:Inspect<cr>")
-- Nvim tree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>")
-- Disable arrow keys
keymap("n", "<up>", "<nop>")
keymap("n", "<down>", "<nop>")
keymap("n", "<left>", "<nop>")
keymap("n", "<right>", "<nop>")

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>")
keymap("n", "<C-Down>", ":resize -2<CR>")
keymap("n", "<C-Left>", ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>")
keymap("n", "<S-h>", ":bprevious<CR>")

-- Insert --
-- Press jj fast to enter
keymap("i", "jj", "<ESC>")
keymap("i", "JJ", "<ESC>")

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==")
keymap("v", "<A-k>", ":m .-2<CR>==")
keymap("n", "<A-j>", ":m .+1<CR>==")
keymap("n", "<A-k>", ":m .-2<CR>==")
keymap("v", "p", "\"_dP")

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv")
keymap("x", "K", ":move '<-2<CR>gv-gv")
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv")
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv")

keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>")
--keymap("n","<leader>ff", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>")
keymap("n", "<leader>F", "<cmd>Telescope live_grep<cr>")

keymap("n", "<leader>d", vim.diagnostic.open_float, "Open float")
keymap("n", "<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
keymap("n", "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

keymap("n", "gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
--keymap("n",'gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
keymap("n", "gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
keymap("n", "<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
--keymap("n",'<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
--keymap("n",'<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

-- See `:help K` for why this keymap
keymap("n", "K", vim.lsp.buf.hover, "Hover Documentation")
keymap("n", "<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

-- Lesser used LSP functionality
keymap("n", "gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
keymap(
	"n",
	"<leader>wa",
	vim.lsp.buf.add_workspace_folder,
	"[W]orkspace [A]dd Folder"
)
keymap(
	"n",
	"<leader>wr",
	vim.lsp.buf.remove_workspace_folder,
	"[W]orkspace [R]emove Folder"
)
keymap("n", "<leader>wl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, "[W]orkspace [L]ist Folders")
