{pkgs, ...}: {
  programs.nixvim = {
    enable = true;

    globals = {
      # Set <space> as the leader key
      # See `:help mapleader`
      #  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
      mapleader = " ";
      maplocalleader = " ";
    };

    opts = {
      # Make line numbers default
      number = true;
      # You can also add relative line numbers, to help with jumping.
      #  Experiment for yourself to see if you like it!
      relativenumber = true;
      # Disable mouse mode
      mouse = null;
      # Don't show the mode, since it's already in the status line
      showmode = false;
      # Enable break indent
      breakindent = true;
      expandtab = true;
      tabstop = 2;
      shiftwidth = 2;
      # Save undo history
      undofile = true;
      # Case-insensitive searching UNLESS \C or one or more capital letters in the search term
      ignorecase = true;
      smartcase = true;
      # Keep signcolumn on by default
      signcolumn = "yes";
      # Decrease update time
      updatetime = 250;
      # Decrease mapped sequence wait time
      # Displays which-key popup sooner
      timeoutlen = 300;
      # Sets how neovim will display certain whitespace characters in the editor.
      #  See `:help 'list'`
      #  and `:help 'listchars'`
      list = true;
      listchars = {
        tab = "» ";
        trail = "·";
        nbsp = "␣";
      };
      # Preview substitutions live, as you type!
      inccommand = "split";
      # Show which line your cursor is on
      cursorline = true;
      # Minimal number of screen lines to keep above and below the cursor.
      scrolloff = 10;
    };

    plugins = {
      # Lualine
      lualine.enable = true;
      telescope = {
        enable = true;
        extensions = {
          ui-select = {
            enable = true;
          };
          frecency = {
            enable = true;
            settings.disable_devicons = true;
          };
          fzf-native = {
            enable = true;
          };
        };
        settings = {
          defaults = {
            layout_config = {
              horizontal = {
                prompt_position = "top";
              };
            };
            sorting_strategy = "ascending";
          };
        };
        keymaps = {
          "<leader>ff" = {
            action = "find_files";
            options = {
              desc = "Find project files";
            };
          };
          "<leader>fg" = {
            action = "live_grep";
            options = {
              desc = "Find text";
            };
          };
          "<leader>fb" = {
            action = "buffers";
            options = {
              desc = "Buffers";
            };
          };
          "<C-p>" = {
            action = "git_files";
            options = {
              desc = "Search git files";
            };
          };
          "<leader>gc" = {
            action = "git_commits";
            options = {
              desc = "Commits";
            };
          };
        };
      };
      # Treesitter
      treesitter = {
        enable = true;
        settings = {
          indent.enable = true;
          highlight.enable = true;
          auto_install = true;
        };
      };
      # LSP
      lsp = {
        enable = true;
        servers = {
          lua-ls.enable = true;
          ts_ls = {
            enable = true;
            autostart = true;
          };
          nil_ls = {
            enable = true;
            autostart = true;
          };
        };
      };
      # Completions
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            {name = "nvim_lsp";}
            {name = "path";}
            {name = "buffer";}
            {name = "luasnip";}
          ];
          mapping = {
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<C-Space>" = "cmp.mapping.complete()";
          };
        };
      };
      # Snippets
      luasnip = {
        enable = true;
        settings = {
          enable_autosnippets = true;
          store_selection_keys = "<Tab>";
        };
        fromVscode = [
          {
            lazyLoad = true;
            paths = "${pkgs.vimPlugins.friendly-snippets}";
          }
        ];
      };
      # Git signs
      gitsigns = {
        enable = true;
        settings = {
          signs = {
            add = {
              text = "│";
            };
            change = {
              text = "│";
            };
            delete = {
              text = "_";
            };
            topdelete = {
              text = "‾";
            };
            changedelete = {
              text = "~";
            };
            untracked = {
              text = "│";
            };
          };
        };
      };
      # Icons
      web-devicons.enable = true;
      # Autopairs
      nvim-autopairs.enable = true;
      # So cool lsp
      fidget.enable = true;
    };
  };
}
