{
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
      tabstop = 4;
      shiftwidth = 4;
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
        servers = {
          nil_ls.enable = true;
        };
      };
      # Completions
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings.sources = [
          {name = "nvim_lsp";}
          {name = "path";}
          {name = "buffer";}
          {name = "luasnip";}
        ];
      };
    };
  };
}
