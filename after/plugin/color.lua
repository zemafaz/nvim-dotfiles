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
-- vim.o.background = "dark"
-- vim.g.gruvbox_material_foreground = "material"
-- vim.g.gruvbox_material_background = "hard"
-- vim.g.gruvbox_material_transparent_background = true
-- vim.g.gruvbox_material_better_performance = true
-- vim.cmd.colorscheme("gruvbox-material")

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
require("kanagawa").setup({
    transparent=true,
    theme="lotus",
    colors = {
        theme = {
            all = {
                ui = {
                    bg_gutter = "none"
                }
            }
        }
    },
    overrides = function(colors)
        local theme = colors.theme
        return {
            TelescopeTitle = { fg = theme.ui.special, bold = true },
            TelescopePromptNormal = { bg = theme.ui.bg_p1 },
            TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
            TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
            TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
            TelescopePreviewNormal = { bg = theme.ui.bg_dim },
            TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
        }
    end,
})
vim.cmd.colorscheme("kanagawa")
