require("telescope").setup({
     extensions = {
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                           -- the default case_mode is "smart_case"
        }
      }
})

require('telescope').load_extension('fzf')

vim.keymap.set("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
-- vim.keymap.set("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>")
vim.keymap.set("n", "<leader>fk", "<cmd>lua require('telescope.builtin').keymaps()<cr>")
