{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    stylix.url = "github:danth/stylix";

    ags.url = "github:Aylur/ags";
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... } @ inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        asus =
          let
            username = "xen";
          in
          nixpkgs.lib.nixosSystem {
            system = { inherit system; };
            specialArgs = { inherit inputs; };

            modules = [
              ./hosts/asus
              ./users/${username}/nixos.nix

              stylix.nixosModules.stylix

              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = {
                  inherit username;
                  inherit inputs;
                };
                home-manager.users.${username} = import ./users/${username}/home.nix;
              }
            ];
          };
      };

      # Development shell
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs;[
          nil
          nixpkgs-fmt
        ];
        shellHook = ''
          echo nix dev shell inited!
        '';
      };
    };
}
