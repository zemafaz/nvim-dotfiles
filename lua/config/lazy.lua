local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
    {
        { import = "plugin" },

        -- Java LSP
        'mfussenegger/nvim-jdtls',

        -- Debugger
        {
            "rcarriga/nvim-dap-ui",
            dependencies = { 'mfussenegger/nvim-dap', "nvim-neotest/nvim-nio" }
        },

        -- Lualine
        {
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons' }
        },

        -- Nvim telescope
        {
            'nvim-telescope/telescope.nvim',
            branch = '0.1.x',
            dependencies = {
                { 'nvim-lua/plenary.nvim' },
                {
                    'nvim-telescope/telescope-fzf-native.nvim',
                    build = "make",
                },
                {
                    "folke/trouble.nvim",
                    dependencies = { "nvim-tree/nvim-web-devicons" },
                },

            }
        },

        {
            "folke/trouble.nvim",
            dependencies = { "nvim-tree/nvim-web-devicons" },
        },

        -- Dir-telescope
        {
            "princejoogie/dir-telescope.nvim",
            dependencies = {
                'nvim-telescope/telescope.nvim',
            }
        },

        -- Treesitter
        { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
        'nvim-treesitter/nvim-treesitter-context',

        -- Harpoon
        "ThePrimeagen/harpoon",

        -- Neogit
        {
            "NeogitOrg/neogit",
            dependencies = {
                "nvim-lua/plenary.nvim",  -- required
                "sindrets/diffview.nvim", -- optional - Diff integration

                -- Only one of these is needed, not both.
                "nvim-telescope/telescope.nvim", -- optional
                -- "ibhagwan/fzf-lua",              -- optional
            },
            config = true
        },

        {
            'kristijanhusak/vim-dadbod-ui',
            dependencies = {
                { 'tpope/vim-dadbod',                     lazy = true },
                { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
            },
            cmd = {
                'DBUI',
                'DBUIToggle',
                'DBUIAddConnection',
                'DBUIFindBuffer',
            },
            init = function()
                -- Your DBUI configuration
                vim.g.db_ui_use_nerd_fonts = 1
                vim.g.db_ui_save_location = "./queries/"
                vim.g.db_ui_execute_on_save = 0

                -- Run paragraph query
                vim.keymap.set("n", "<leader>rq", "vip<Plug>(DBUI_ExecuteQuery)",
                    { desc = "vim-dadbod-ui run paragrapth query" })
            end,
        },

        -- Github Copilot
        { "github/copilot.vim", branch = "release" },

        -- Trouble

        {
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons' }
        },

        {
            "iamcco/markdown-preview.nvim",
            cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
            ft = { "markdown" },
            build = function() vim.fn["mkdp#util#install"]() end,
        },

        {
          'stevearc/oil.nvim',
          opts = {},
          -- Optional dependencies
          dependencies = { "nvim-tree/nvim-web-devicons" },
        }
    },
    {
        change_detection = {
            notify = false,
        }
    }
)
