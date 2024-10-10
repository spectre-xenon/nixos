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
    };
  };
}
