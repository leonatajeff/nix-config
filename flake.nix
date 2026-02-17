# ~/nix-config/flake.nix
{
  description = "Jeff's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mac-app-util.url = "github:hraban/mac-app-util";
  };

  outputs = { self, nixpkgs, home-manager, nixvim, mac-app-util, ... }:
    let
      # Replace with your actual username and system architecture
      system = "aarch64-darwin";
      username = "jeffleonata";
    in {
      homeConfigurations."${username}" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [
          { nixpkgs.config.allowUnfree = true; }
          nixvim.homeModules.nixvim
          mac-app-util.homeManagerModules.default
          ./home.nix
		    ];
      };
    };
}
