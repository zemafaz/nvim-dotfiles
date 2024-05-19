return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = "make",
        },
        { "princejoogie/dir-telescope.nvim" },
    },
    keys = {
        { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", mode = "n" },
        { "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", mode = "n" },
        { "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", mode = "n" },
        { "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", mode = "n"},
        { "<leader>fk", "<cmd>lua require('telescope.builtin').keymaps()<cr>", mode = "n" },
        { "<leader>fm", "<cmd>lua require('telescope.builtin').marks()<cr>", mode = "n" },
        { "<leader>fd", "<cmd>Telescope dir live_grep<CR>", mode = "n", { noremap = true, silent = true }}
    },
    config = function()
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("dir")


        local mappings = {}
        if pcall(require, "trouble.providers.telescope") then
            local trouble = require("trouble.providers.telescope")
            mappings = {
                i = { ["<c-q>"] = trouble.open_with_trouble },
                n = { ["<c-q>"] = trouble.open_with_trouble },
            }
        end

        require("telescope").setup({
            defaults = {
                layout_strategy = "horizontal",
                layout_config = {
                    prompt_position = "top"
                },
                sorting_strategy = "ascending",
                mappings = mappings
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
    end
}
