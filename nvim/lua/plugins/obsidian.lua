return 
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
}
