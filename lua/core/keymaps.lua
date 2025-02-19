local function keymap(mode, keys, func, desc)
	vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<Space>", "<Nop>")

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

keymap("n", "<leader>l", "<cmd>:Lazy<cr>")
-- keymap("n", "<leader>d", "\"_d")

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
keymap("v", "p", '"_dP')

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv")
keymap("x", "K", ":move '<-2<CR>gv-gv")
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv")
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv")

keymap("n", "<leader>of", vim.diagnostic.open_float, "Open float")
keymap("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
keymap("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")

keymap("n", "gd", vim.lsp.buf.definition, "Goto Definition")
keymap("n", "gI", vim.lsp.buf.implementation, "Goto Implementation")
keymap("n", "<leader>D", vim.lsp.buf.type_definition, "Type Definition")

-- See `:help K` for why this keymap
keymap("n", "K", vim.lsp.buf.hover, "Hover Documentation")
keymap("n", "<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

-- Lesser used LSP functionality
keymap("n", "gD", vim.lsp.buf.declaration, "Goto Declaration")
keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
keymap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
keymap("n", "<leader>wl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, "[W]orkspace [L]ist Folders")
