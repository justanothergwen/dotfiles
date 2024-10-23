-- Set leader key
vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.keymap.set("n", "<leader>pv", vim.cmd.Dashboard)


-- Bootstrap Lazy.vim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Function to load plugins from lua/plugins/ directory
local plugin_files = vim.fn.globpath(vim.fn.stdpath('config') .. '/lua/plugins', '*.lua', false, true)
local plugins = {}

for _, file in ipairs(plugin_files) do
    local plugin = dofile(file)
    if plugin then
        table.insert(plugins, plugin)
    end
end

-- Initialize Lazy with collected plugins
require('lazy').setup(plugins)

-- General settings (optional, customize as needed)
vim.opt.number = true        -- Show line numbers
vim.opt.relativenumber = true-- Relative line numbers
vim.opt.mouse = "a"          -- Enable mouse
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.tabstop = 4          -- Number of spaces per tab
vim.opt.shiftwidth = 4       -- Indentation width
vim.opt.expandtab = true     -- Use spaces instead of tabs

-- Additional configuration (LSP, keymaps, etc.)
-- You can add your custom keymaps, LSP settings, or other configurations here.

