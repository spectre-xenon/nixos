{pkgs, ...}: {
  stylix = {
    enable = true;

    # ColorScheme
    base16Scheme = "${pkgs.base16-schemes}/share/themes/nebula.yaml";
    # Wallpaper
    image = ../../wallpaper.jpg;
    # Cursor
    cursor.package = pkgs.bibata-cursors;
    cursor.name = "Bibata-Modern-Ice";
    cursor.size = 20;
    # Fonts
    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
        name = "JetBrainsMono Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };
      # Sizes
      sizes = {
        applications = 12;
        terminal = 12;
        desktop = 12;
        popups = 12;
      };
    };
    # Opacity
    opacity = {
      applications = 1.0;
      terminal = 1.0;
      desktop = 1.0;
      popups = 1.0;
    };
    # Dark mode
    polarity = "dark";
  };
}
