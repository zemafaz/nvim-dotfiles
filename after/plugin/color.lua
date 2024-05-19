-----------------
-- Tokyo Night --
-----------------
-- require("tokyonight").setup({
--     style="night",
--     styles={
--         sidebars="transparent",
--         floats="transparent"
--     },
--     lualine_bold=true,
--     transparent=true,
-- })
-- vim.cmd([[colorscheme tokyonight]])

----------------------
-- Gruvbox-Material --
----------------------
vim.o.background = "dark"
vim.g.gruvbox_material_foreground = "material"
vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_transparent_background = true
vim.g.gruvbox_material_better_performance = true
vim.cmd.colorscheme("gruvbox-material")

----------------
-- Catppuccin --
----------------
-- require("catppuccin").setup({
--     flavour = "mocha",
--     transparent_background = true,
--     integrations = {
--         harpoon = true,
--         mason = true,
--     }
-- })
-- vim.cmd.colorscheme("catppuccin")

--------------
-- Kanagawa --
--------------
-- require("kanagawa").setup({
--     transparent=true,
--     theme="lotus",
-- })
-- vim.cmd.colorscheme("kanagawa")
