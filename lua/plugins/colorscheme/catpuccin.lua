return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            transparent_background = true,
            integrations = {
                harpoon = true,
                mason = true,
            }
        })
        vim.cmd.colorscheme("catppuccin")
    end
}
