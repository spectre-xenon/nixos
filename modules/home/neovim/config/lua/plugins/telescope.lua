return {
  'nvim-telescope/telescope.nvim',
  version = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },

  opts = {
    defaults = {
      mappings = {
        i = {
          -- Close on first ESC
          ["<esc>"] = require"telescope.actions".close,
        },
      },
    },
  },

  config = function(_ , opts)
    -- Setup
    require('telescope').setup(opts)
    -- To get fzf loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function:
    require('telescope').load_extension('fzf')
    require('telescope').load_extension('ui-select')
  end,

  keys = {
    { "<leader><space>", function() require'telescope.builtin'.find_files() end, },
    { '<C-p>', function() require'telescope.builtin'.git_files() end,  },
    { '<leader>/', function() require'telescope.builtin'.live_grep() end,  },
    { '<leader>fb', function() require'telescope.builtin'.buffers() end,  },
  },
}
