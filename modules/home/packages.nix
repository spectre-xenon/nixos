{pkgs, ...}: {
  # This module contains packages that isn't related to other modules
  home.packages = with pkgs; [
    gnumake
    gcc
    unzip
    yazi
  ];
}
