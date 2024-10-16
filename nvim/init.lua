vim.opt.termguicolors = true
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.g.copilot_filetypes = {
    ["*"] = false,
    ["javascript"] = true,
    ["typescript"] = true,
    ["lua"] = true,
    ["python"] = true,
    ["rust"] = true,
}






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

-- Now set up Lazy to manage plugins
require('lazy').setup({
  -- Define your plugins here
  -- Example:
  -- {'nvim-telescope/telescope.nvim', dependencies = {'nvim-lua/plenary.nvim'} }

	{
    "github/copilot.vim",
    config = function()
        -- Optionally, you can set custom keybindings or other configurations here.
    end
},

	{'nvim-treesitter/nvim-treesitter'},  -- Syntax highlighting

	{'nvim-telescope/telescope.nvim', dependencies = {'nvim-lua/plenary.nvim'}}, -- Fuzzy finder

	{'hrsh7th/nvim-cmp',

    	dependencies = {
      'hrsh7th/cmp-nvim-lsp', -- LSP completion source
      'hrsh7th/cmp-buffer',    -- Buffer completion source
      'hrsh7th/cmp-path',      -- Path completion source
      'hrsh7th/cmp-cmdline',   -- Command-line completion source
      'L3MON4D3/LuaSnip',      -- Snippet engine
      'saadparwaiz1/cmp_luasnip' -- LuaSnip completion source
    },
    config = function()
      local cmp = require'cmp'
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        mapping = {
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },  -- Autocompletion plugin

		})
		})
	end
},

	{
	'norcalli/nvim-colorizer.lua',
	lazy = false,
	cmd = 'Colorizer',
	opts = {}
},

	{
	"EdenEast/nightfox.nvim",
	lazy = false,
	priority = 1000,
},

	{
	'https://github.com/Weyaaron/nvim-training',
	pin = true,
	opt = {}
},
	
	{
	{
	'nvim-tree/nvim-tree.lua',
	lazy = false,
	},
{
	'nvim-tree/nvim-web-devicons',
	lazy = false,
},
},

{
  'L3MON4D3/LuaSnip',
  config = function()
    require('luasnip.loaders.from_vscode').lazy_load()
  end
},


	{
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'hyper',
      config = {
        week_header = {
          enable = true,
        },
        shortcut = {
          { desc = 'Find File', group = 'DashboardShortCut', action = 'Telescope find_files', key = 'SPC f f' },
          { desc = 'Recent Files', group = 'DashboardShortCut', action = 'Telescope oldfiles', key = 'SPC f r' },
          { desc = 'New File', group = 'DashboardShortCut', action = 'DashboardNewFile', key = 'SPC f n' },
        },
	footer = {
	

"",
"",
"",
"  ▄████  █     █░▓█████  ███▄    █ ",
" ██▒ ▀█▒▓█░ █ ░█░▓█   ▀  ██ ▀█   █ ",
"▒██░▄▄▄░▒█░ █ ░█ ▒███   ▓██  ▀█ ██▒",
"░▓█  ██▓░█░ █ ░█ ▒▓█  ▄ ▓██▒  ▐▌██▒",
"░▒▓███▀▒░░██▒██▓ ░▒████▒▒██░   ▓██░",
" ░▒   ▒ ░ ▓░▒ ▒  ░░ ▒░ ░░ ▒░   ▒ ▒ ",
"  ░   ░   ▒ ░ ░   ░ ░  ░░ ░░   ░ ▒░",
"░ ░   ░   ░   ░     ░      ░   ░ ░ ",
"      ░     ░       ░  ░         ░ ",



	},

      },
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'} }
},


{
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
  config = function()
    require('lualine').setup {
      options = {
        theme = 'auto',  -- You can change this to any theme you like
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = { 'NvimTree' }
      }
    }
  end
},

{
  'epwalsh/obsidian.nvim',
  dependencies = {
    -- Optional dependencies for enhanced functionality
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',  -- For completion
  },
  config = function()
    require('obsidian').setup({
      dir = '~/Desktop/Obsidian',  -- Specify the directory where your Obsidian vault is located

      -- Optional settings
      completion = {
        nvim_cmp = true  -- Use nvim-cmp for note completion if available
      },
      daily_notes = {
        folder = "Daily"  -- Set the folder for daily notes
      },
      -- Other optional settings include: backlinks, note link creation, etc.
    })

    -- Optional: Keybindings for quick access to Obsidian commands
    vim.api.nvim_set_keymap('n', '<leader>on', ":ObsidianNewNote<CR>", { noremap = true, silent = true })  -- Create new note
    vim.api.nvim_set_keymap('n', '<leader>os', ":ObsidianSearch<CR>", { noremap = true, silent = true })  -- Search notes
  end
},


})
