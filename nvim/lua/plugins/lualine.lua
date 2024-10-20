return
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
}
