{
  description = "Home Manager configuration of tux";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations = {
        "tux#Plasma" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [ ./hosts/plasma/home.nix ];
        };

        "tux#OpenBox" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [ ./hosts/openbox/home.nix ];
        };
    };
  };
}
