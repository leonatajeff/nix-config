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

  outputs = { self, nixpkgs, home-manager, nixvim, mac-app-util, ... }: {
    homeConfigurations = {
        # WSL Fedora
        "wsl-fedora" = home-manager.lib.homeManagerConfiguration {
          # Explicitly declare the Linux architecture here
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          modules = [
            { nixpkgs.config.allowUnfree = true; }
            nixvim.homeModules.nixvim
            ./hosts/wsl-fedora/default.nix
          ];
        };

        # MacOS
        "macos" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."aarch64-darwin";
          modules = [
            { nixpkgs.config.allowUnfree = true; }
            nixvim.homeModules.nixvim
            mac-app-util.homeManagerModules.default
            ./hosts/macos/default.nix
          ];
        };
    };
  };
}
