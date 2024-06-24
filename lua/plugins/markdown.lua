return {
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
        init = function()
            vim.g.mkdp_auto_start = 0
            vim.g.mkdp_auto_close = 0
        end,
        keys = {
            { "<leader>mp", "<cmd>MarkdownPreview<cr>", mode = "n" }
        },
    },
    {
        "ekickx/clipboard-image.nvim",
        keys = {
            { "<leader>pi", "<cmd>PasteImg<cr>", mode = "n" }
        },
        opts = {
            default = {
                img_dir = "./assets",
                img_dir_txt = "assets",
            }
        },
    }
}
