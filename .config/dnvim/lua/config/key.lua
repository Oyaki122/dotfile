-- common
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("n", "<C-[>", ":noh<CR>")
vim.keymap.set("n", "<ESC>", ":noh<CR>")

-- buffer
vim.keymap.set("n", "<S-Tab>", "<cmd>bprev<CR>")
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>")

-- window
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<leader>x", ":bw<CR>")

-- indent
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

