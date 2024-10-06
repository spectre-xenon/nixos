{pkgs, ...}: {
  home.packages = with pkgs; [
    btop
  ];

  programs.kitty = {
    enable = true;
    settings = {
      window_padding_width = 5;
      hide_window_decorations = "yes";
      confirm_os_window_close = 0;
    };
  };
}
