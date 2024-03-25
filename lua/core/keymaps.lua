local map = require("helpers.keys").map

-- Easier access to beginning and end of lines
map("n", "<M-h>", "^", "Go to beginning of line")
map("n", "<M-l>", "$", "Go to end of line")

-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Clear after search
map("n", "<leader>ur", "<cmd>nohl<cr>", "Clear highlights")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = 'Project View' })
vim.keymap.set("n", "<leader>pe", vim.cmd.Lex, { desc = 'Project Explore' })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = 'Paste from clipboard' })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = 'Yank to clipboard' })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = 'Yank a line to clipboard' })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = 'Format Buffer' })

vim.keymap.set("n", "<leader>k", "<cmd>cnext<CR>", { desc = 'Quickfix: next' })
vim.keymap.set("n", "<leader>j", "<cmd>cprev<CR>", { desc = 'Quickfix: prev' })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Substitute' })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>",
    { silent = true, desc = 'Provide Execute permission to current file' })

vim.keymap.set("n", "<leader>k", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>cprev<CR>zz")

vim.keymap.set("n", ";", ":")

vim.keymap.set("i", "jj", "<ESC>")
vim.keymap.set("i", "JJ", "<ESC>")

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

vim.keymap.set("n", "<", "<gv", { noremap = true })
vim.keymap.set("n", ">", ">gv", { noremap = true })

vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)
