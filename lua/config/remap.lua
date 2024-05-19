-- Unmap Leader Key
vim.keymap.set("n", " ", "<Nop>")

-- Open netrw
vim.keymap.set("n", "<leader>ex", "<cmd>Ex<CR>")
vim.keymap.set("n", "<leader>ve", "<cmd>Vex<CR>") -- open on a vertical split

-- Toggle Terminal
vim.keymap.set("n", "<leader><CR>", "<cmd>8split term://bash<CR>")

-- Terminal Mode to normal mode
vim.keymap.set("t", "<esc>", "<C-\\><C-n>")

-- Disable "easy" mode
-- local arrow_keys = {'<Up>','<Down>','<Left>','<Right>'}
--
-- for i, key in ipairs(arrow_keys) do
--   vim.keymap.set("n", key, "<Nop>")  
--   vim.keymap.set("i", key, "<Nop>")
--   -- vim.keymap.set("c", key, "<Nop>")
--   -- vim.keymap.set("t", key, "<Nop>")
--   vim.keymap.set("v", key, "<Nop>")
--   vim.keymap.set("x", key, "<Nop>")
--   vim.keymap.set("s", key, "<Nop>")
--   vim.keymap.set("o", key, "<Nop>")
--   vim.keymap.set("l", key, "<Nop>")
-- end

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

-- Resize windows
vim.keymap.set("n", "<C-w><", "<cmd>:vertical resize -10<cr>")
vim.keymap.set("n", "<C-w>>", "<cmd>:vertical resize +10<cr>")
vim.keymap.set("n", "<C-w>-", "<cmd>:resize -10<cr>")
vim.keymap.set("n", "<C-w>+", "<cmd>:resize +10<cr>")

-- Focus windows
-- vim.keymap.set("n", "<leader>l", "<c-w>l")
-- vim.keymap.set("n", "<leader>h", "<c-w>h")
-- vim.keymap.set("n", "<leader>j", "<c-w>j")
-- vim.keymap.set("n", "<leader>k", "<c-w>k")

-- Open new tab on parent folder
-- vim.keymap.set("n", "<leader>t", "<cmd>tabnew .<CR>")

-- Open Completion
-- vim.keymap.set("i", "<C-space>", "<C-X><C-O>")

-- Close buffer
-- vim.keymap.set("n", "<leader>q", "<cmd>bd!<CR>")

-- Yank/Past from clipboard
-- vim.keymap.set("n", "<leader>y", "\"+y")
-- vim.keymap.set("v", "<leader>y", "\"+y")
-- vim.keymap.set("n", "<leader>p", "\"+p")
-- vim.keymap.set("v", "<leader>p", "\"+p")
-- vim.keymap.set("n", "y", "\"+y")
-- vim.keymap.set("n", "yy", "\"+yy")
-- vim.keymap.set("v", "y", "\"+y")
-- vim.keymap.set("n", "p", "\"+p")
-- vim.keymap.set("n", "P", "\"+P")
-- vim.keymap.set("v", "p", "\"+p")
-- vim.keymap.set("v", "P", "\"+P")
-- vim.keymap.set("n", "d", "\"+d")
-- vim.keymap.set("n", "dd", "\"+dd")
-- vim.keymap.set("v", "d", "\"+d")

-- Resize splits
-- vim.keymap.set("n", "<C-h>", "<C-w><")
-- vim.keymap.set("n", "<C-j>", "<C-w>-")
-- vim.keymap.set("n", "<C-k>", "<C-w>+")
-- vim.keymap.set("n", "<C-l>", "<C-w>>")

