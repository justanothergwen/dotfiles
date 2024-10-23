return
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
}

