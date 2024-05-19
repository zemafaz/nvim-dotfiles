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
        { import = "plugins" },

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
