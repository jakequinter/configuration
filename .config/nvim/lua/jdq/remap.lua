vim.g.mapleader = " "
vim.keymap.set("n", "<leader>dv", "<CMD>Oil<CR>")

vim.keymap.set("i", "jk", "<ESC>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>L", "<c-w>5<")
vim.keymap.set("n", "<leader>R", "<c-w>5>")
vim.keymap.set("n", "<leader>U", "<c-w>+>")
vim.keymap.set("n", "<leader>D", "<c-w>-")
