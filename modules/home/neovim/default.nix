{config, ...}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = ''
      ${builtins.readFile ./config/init.lua}
    '';
  };

  xdg.configFile."nvim/lua" = {
    source = ./config/lua;
    recursive = true;
  };

  # stylix.targets.neovim.enable = false;
}
