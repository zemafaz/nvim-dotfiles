return {
    'tpope/vim-dadbod',
    lazy = true,
    dependencies = {
        'kristijanhusak/vim-dadbod-ui',
        { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
        'DBUI',
        'DBUIToggle',
        'DBUIAddConnection',
        'DBUIFindBuffer',
    },
    keys = {
        { "<leader>db", "<cmd>DBUIToggle<cr>", mode = "n" }
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
}
