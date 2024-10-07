{config, ...}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  xdg.configFile."nvim/lua" = {
    source = ./config/lua;
    recursive = true;
  };
  # xdg.configFile."nvim/init.lua" = {
  #   source = ./config/init.lua;
  # };

  # stylix.targets.neovim.enable = false;
}
