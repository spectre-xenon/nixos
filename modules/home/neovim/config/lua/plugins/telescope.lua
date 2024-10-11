return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  keys = {
    { "<leader><space>", function() require'telescope.builtin'.find_files() end, },
    { '<C-p>', function() require'telescope.builtin'.git_files() end,  },
    { '<leader>/', function() require'telescope.builtin'.live_grep() end,  },
    { '<leader>fb', function() require'telescope.builtin'.buffers() end,  },
  },
  config = function()
    -- Setup
    require('telescope').setup(
      {
        -- Close on first ESC
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close,
            },
          },
        },
      })
    -- To get fzf loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function:
    require('telescope').load_extension('fzf') 
  end,
}
