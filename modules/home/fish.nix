{pkgs, ...}: {
  home.packages = with pkgs; [
    btop
    eza
    bat
  ];

  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';

    shellAliases = {
      c = "clear";
      ls = "eza --icons -la";
      rebuild-nix = "~/nixos/rebuild";
    };

    plugins = [
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
    ];
  };
}
