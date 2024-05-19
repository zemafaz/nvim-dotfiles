return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "<leader>ex", "<cmd>Oil<cr>", mode = "n", { desc = "Open parent directory" } },
    },
    lazy = false,
    config = function()
        require("oil").setup({
            default_file_explorer = true,
            keymaps = {
                ["<C-h>"] = false,
                ["<C-l>"] = false,
            },
            view_options = {
                show_hidden = true,
            }
        })
    end
}
