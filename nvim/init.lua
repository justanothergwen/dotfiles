vim.opt.termguicolors = true
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
require("config.lazy")
lua = require'colorizer'.setup()

-- empty setup using defaults
lua = require("nvim-tree").setup()

-- OR setup with some options
--lua = require'nvim-tree'.setup({
--  sort = {
--   sorter = "case_sensitive",
--  },
--  view = {
--    width = 30,
--  },
--  renderer = {
--    group_empty = true,
--    },
--  filters = {
--    dotfiles = true,
--  },
--})
vim.wo.relativenumber = true
