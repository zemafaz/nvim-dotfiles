-- Unmap Leader Key
vim.keymap.set("n", " ", "<Nop>")

-- Open netrw
vim.keymap.set("n", "<leader>ex", "<cmd>Ex<CR>")
vim.keymap.set("n", "<leader>ve", "<cmd>Vex<CR>") -- open on a vertical split

-- Toggle Terminal
vim.keymap.set("n", "<leader><CR>", "<cmd>tabnew term://zsh<CR>")

-- Terminal Mode to normal mode
vim.keymap.set("t", "<esc>", "<C-\\><C-n>")

-- Center after scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "<C-o>", "<C-o>zz")

-- Paste in visual mode
vim.keymap.set("v", "p", "\"_dP")

-- Discard x deletion
vim.keymap.set("n", "x", "\"_x")

-- Discard search
vim.keymap.set("n", "<esc>", "<cmd>:noh<cr>")

-- Close Buffer
vim.keymap.set("n", "<space>cb", "<cmd>:bd<cr>")

-- Move between windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Resize windows
vim.keymap.set("n", "<M-h>", "<cmd>:vertical resize -10<cr>")
vim.keymap.set("n", "<M-l>", "<cmd>:vertical resize +10<cr>")
vim.keymap.set("n", "<M-j>", "<cmd>:resize -10<cr>")
vim.keymap.set("n", "<M-k>", "<cmd>:resize +10<cr>")
