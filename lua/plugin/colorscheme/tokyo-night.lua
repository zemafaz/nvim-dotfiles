return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},

    config = function()
        require("tokyonight").setup({
            style = "night",
            styles = {
                sidebars = "transparent",
                floats = "transparent"
            },
            lualine_bold = true,
            transparent = true,
        })
        vim.cmd([[colorscheme tokyonight]])
    end
}
