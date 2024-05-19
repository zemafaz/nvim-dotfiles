return {
    "sainnhe/gruvbox-material",
    config = function()
        vim.o.background = "dark"
        vim.g.gruvbox_material_foreground = "material"
        vim.g.gruvbox_material_background = "hard"
        vim.g.gruvbox_material_transparent_background = true
        vim.g.gruvbox_material_better_performance = true
        vim.cmd.colorscheme("gruvbox-material")
    end
}
