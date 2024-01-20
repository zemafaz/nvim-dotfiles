local trouble = require("trouble")

vim.keymap.set("n", "<leader>xx", function() trouble.toggle() end, {desc= "Trouble toggle"})
vim.keymap.set("n", "<leader>xw", function() trouble.toggle("workspace_diagnostics") end, {desc= "Trouble workspace diagnostics"})
vim.keymap.set("n", "<leader>xd", function() trouble.toggle("document_diagnostics") end, {desc= "Trouble document diagnostics"})
vim.keymap.set("n", "<leader>xq", function() trouble.toggle("quickfix") end, {desc= "Trouble quickfix"})
vim.keymap.set("n", "<leader>xl", function() trouble.toggle("loclist") end, {desc= "Trouble loclist"})
vim.keymap.set("n", "gR", function() trouble.toggle("lsp_references") end, {desc= "Trouble lsp references"})
