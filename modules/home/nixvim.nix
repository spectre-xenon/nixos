{
  programs.nixvim = {
    enable = true;
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
