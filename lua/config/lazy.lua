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

        -- Airline
        -- {
            --         'nvim-lualine/lualine.nvim',
            --         dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
            -- },

            -- Nvim telescope
        {
            'nvim-telescope/telescope.nvim', tag = '0.1.0',
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
        "tpope/vim-fugitive"
    }
)
