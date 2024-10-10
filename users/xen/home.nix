{inputs, ...}: {
  imports = [
    ../../modules/home/core.nix

    ../../modules/home/hyprland.nix
    ../../modules/home/vscode.nix
    ../../modules/home/git.nix
    ../../modules/home/chromium.nix
    ../../modules/home/kitty.nix
    ../../modules/home/direnv.nix
    ../../modules/home/fish.nix
    ../../modules/home/starship
    ../../modules/home/tofi.nix
    ../../modules/home/ags
    inputs.nixvim.homeManagerModules.nixvim
    ../../modules/home/nixvim.nix
    ../../modules/home/gtk.nix
    ../../modules/home/packages.nix
  ];
}
