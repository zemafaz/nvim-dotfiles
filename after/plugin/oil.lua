require("oil").setup({
    keymaps = {
        ["<C-h>"] = false,
        ["<C-l>"] = false,
    },
    view_options = {
        show_hidden = true,
    }
})

vim.keymap.set("n", "<leader>ex", "<CMD>Oil<CR>", { desc = "Open parent directory" })
