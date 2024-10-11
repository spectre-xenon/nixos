return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader><space>', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope git files' })
    vim.keymap.set('n', '<leader>/', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
  end,

}
