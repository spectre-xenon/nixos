{
  pkgs,
  config,
  ...
}: {
  # Lsp server
  home.packages = with pkgs; [
    lua-language-server
  ];

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

  # set Colorscheme using stylix colors
  stylix.targets.neovim.enable = false;
  xdg.configFile."nvim/lua/plugins/base16.lua".text = with config.lib.stylix.colors.withHashtag; ''
    return {
      'RRethy/base16-nvim',
      config = function()
        require('base16-colorscheme').setup {
          base00 = '${base00}',
          base01 = '${base01}',
          base02 = '${base02}',
          base03 = '${base03}',
          base04 = '${base04}',
          base05 = '${base05}',
          base06 = '${base06}',
          base07 = '${base07}',
          base08 = '${base08}',
          base09 = '${base09}',
          base0A = '${base0A}',
          base0B = '${base0B}',
          base0C = '${base0C}',
          base0D = '${base0D}',
          base0E = '${base0E}',
          base0F = '${base0F}',
        }
      end,
    }
  '';
}
