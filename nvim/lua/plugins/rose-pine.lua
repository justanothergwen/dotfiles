return {
  -- Add the rose-pine color scheme
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup({
        disable_background = true,  -- Optional: disable the background if you want a transparent one
      })
      vim.cmd('colorscheme rose-pine')
    end
  }
}

