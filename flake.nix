# /Users/jeffleonata/nix-config/flake.nix (updated)
{
  description = "Jeff Leonata's declarative macOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
    nix-darwin.url = "github:lnl7/nix-darwin/nix-darwin-24.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }:
  let
    system = "aarch64-darwin"; # IMPORTANT: Confirm this for your Mac
  in
  {
    darwinConfigurations."jeffleonata" = nix-darwin.lib.darwinSystem {
      system = system;
      modules = [
        ./darwin-configuration.nix # <-- Import your system configuration here
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.jeffleonata = import ./home-configuration.nix;
        }
      ];
    };

    devShells.default = nixpkgs.mkShell {
      packages = with nixpkgs; [
        nil
        nixpkgs-fmt
        nix-tree
      ];
      shellHook = "echo 'Entering development shell for Nix flake.'";
    };
  };
}
