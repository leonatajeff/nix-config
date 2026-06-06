# ~/nix-config/hosts/wsl-fedora/default.nix

/*
 * _      __  ___   __
 * | | /| / / / __/ / /
 * | |/ |/ / _\ \  / /__
 * |__/|__/ /___/ /____/
 */

{ config, pkgs, ... }:

{
  imports = [
    ../../modules/common.nix # core tools
    ../../modules/zsh.nix
    ../../modules/neovim.nix
    ../../modules/tmux.nix
  ];

  # Set your basic home environment variables
  home.username = "leona";
  home.homeDirectory = "/home/leona";

  # This is crucial for managing breaking changes
  home.stateVersion = "24.05";

  # The list of packages you want to have installed.
  home.packages = with pkgs; [
    gawk
    dnsutils
  ];

  home.sessionVariables = {
      BROWSER = "wslview";
  };

  # Let Home Manager handle Zsh startup
  programs.home-manager.enable = true;
}
