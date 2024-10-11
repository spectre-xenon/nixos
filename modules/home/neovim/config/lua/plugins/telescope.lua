return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  keys = {
    { "<leader><space>", function() require'telescope.builtin'.find_files end,{ desc = 'Telescope find files' }},
    { '<C-p>', function() require'telescope.builtin'.git_files end, { desc = 'Telescope git files' })},
    { '<leader>/', function() require'telescope.builtin'.live_grep end, { desc = 'Telescope live grep' })},
    { '<leader>fb', function() require'telescope.builtin'.buffers end, { desc = 'Telescope buffers' })},
  },
  config = function()
    -- Setup
    require('telescope').setup()
    -- To get fzf loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function:
    require('telescope').load_extension('fzf') 
    -- Keymaps
    local builtin = require('telescope.builtin')
  end,
}
