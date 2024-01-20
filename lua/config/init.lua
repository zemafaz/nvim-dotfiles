-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('config.set')
require('config.remap')
-- require('config.packer')
require('config.lazy')
