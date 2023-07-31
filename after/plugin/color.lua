-- vim.g.gruvbox_material_background = "medium"
-- vim.g.gruvbox_material_foreground = "original"
-- vim.g.gruvbox_material_better_performance = 1
-- vim.o.background = "dark" -- or "light" for light mode
-- vim.cmd([[colorscheme gruvbox-material]])

-- vim.o.background = "dark" -- or "light" for light mode
-- vim.cmd([[colorscheme gruvbox]])

-- require('lualine').setup()
require('tokyonight').setup({
	style="night",
	transparent=true
})
vim.cmd("colorscheme tokyonight")
