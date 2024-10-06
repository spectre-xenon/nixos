{
  pkgs,
  inputs,
  ...
}: let
  input-hypr = inputs.hyprland.packages.${pkgs.system};
in {
  # Needed system Packages
  environment.systemPackages = with pkgs; [
    brightnessctl
  ];

  # Env
  environment.sessionVariables = {};

  # Hypr
  programs.hyprland = {
    enable = true;
    package = input-hypr.hyprland;
    portalPackage = input-hypr.xdg-desktop-portal-hyprland;
  };
}
