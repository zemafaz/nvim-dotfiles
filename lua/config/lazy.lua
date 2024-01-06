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
        -- Color theme
        {
          "folke/tokyonight.nvim",
          lazy = false,
          priority = 1000,
          opts = {},
        },

        {
            "luisiacc/gruvbox-baby",
            branch="main"
        },

        -- Vim commentary
        'tpope/vim-commentary',

        -- LSP
        {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v3.x',
            dependencies = {
                -- LSP Support
                {'neovim/nvim-lspconfig'},
                {'williamboman/mason.nvim', run=':MasonUpdate'},
                {'williamboman/mason-lspconfig.nvim'},

                -- Autocompletion
                {'hrsh7th/nvim-cmp'},
                {'hrsh7th/cmp-buffer'},
                {'hrsh7th/cmp-path'},
                {'saadparwaiz1/cmp_luasnip'},
                {'hrsh7th/cmp-nvim-lsp'},
                {'hrsh7th/cmp-nvim-lua'},

                -- Snippets
                {'L3MON4D3/LuaSnip'},
                {'rafamadriz/friendly-snippets'},
            }
        },

        -- Java LSP
        'mfussenegger/nvim-jdtls',

        -- Debugger
        {'mfussenegger/nvim-dap', dependencies={"rcarriga/nvim-dap-ui"}},

        -- Lualine
        {
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons' }
        },

        -- Nvim telescope
        {
            'nvim-telescope/telescope.nvim', tag = '0.1.x',
            dependencies = {
                {'nvim-lua/plenary.nvim'},
            }
        },

        -- Treesitter
        {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'},
        'nvim-treesitter/nvim-treesitter-context',

        -- Harpoon
        "ThePrimeagen/harpoon",

        -- Vim fugitive (git in vim)
        "tpope/vim-fugitive",

        {
          'kristijanhusak/vim-dadbod-ui',
          dependencies = {
            { 'tpope/vim-dadbod', lazy = true },
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
            vim.keymap.set("n", "<leader>rq", "vip<Plug>(DBUI_ExecuteQuery)")

          end,
        },
    }
)
