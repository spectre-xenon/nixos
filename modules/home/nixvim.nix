{
  programs.nixvim = {
    enable = true;
    plugins = {
      lualine.enable = true;
      treesitter = {
        enable = true;
        settings = {
          indent.enable = true;
          highlight.enable = true;
          auto_install = true;
        };
      };
    };
  };
}
