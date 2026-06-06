# ~/nix-config/hosts/macos/default.nix

/*
 * __  __             ____   _____
 * |  \/  |           / __ \ / ____|
 * | \  / | __ _  ___| |  | | (___
 * | |\/| |/ _` |/ __| |  | |\___ \
 * | |  | | (_| | (__| |__| |____) |
 * |_|  |_|\__,_|\___|\____/|_____/
 */

{ config, pkgs, ... }:

{
  imports = [
    ../../modules/common.nix # core tools
    ../../modules/git.nix
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

  ];

  # Let Home Manager handle Zsh startup
  programs.home-manager.enable = true;
}
