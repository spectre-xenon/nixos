{config, ...}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  xdg.configFile.nvim.source = config.lib.file.mkOutOfStoreSymlink ./config;

  stylix.targets.neovim.enable = false;
}
