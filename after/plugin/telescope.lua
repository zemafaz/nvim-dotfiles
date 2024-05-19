require("telescope").load_extension("fzf")
require("telescope").load_extension("dir")

require("telescope").setup({
    defaults = {
        layout_strategy = "horizontal",
        layout_config = {
            prompt_position = "top"
        },
        sorting_strategy="ascending",
    },
    extensions = {
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        },
        dir = {
            hidden = true,
            no_ignore = false,
            show_preview = true,
        }
    }
})


vim.keymap.set("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>")
vim.keymap.set("n", "<leader>fk", "<cmd>lua require('telescope.builtin').keymaps()<cr>")
vim.keymap.set("n", "<leader>fm", "<cmd>lua require('telescope.builtin').marks()<cr>")

vim.keymap.set("n", "<leader>fd", "<cmd>Telescope dir live_grep<CR>", { noremap = true, silent = true })
