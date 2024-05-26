return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},

    config = function()
        require("tokyonight").setup({
            style = "night",
            lualine_bold = true,
        })
        vim.cmd([[colorscheme tokyonight]])
    end
}
