# ~/nix-config/hosts/proxmox/default.nix

/*
 * _____
 * |  __ \
 * | |__) | __ _____  ___ __ ___   _____  __
 * |  ___/ '__/ _ \ \/ / '_ ` _ \ / _ \ \/ /
 * | |   | | | (_) >  <| | | | | | (_) >  <
 * |_|   |_|  \___/_/\_\_| |_| |_|\___/_/\_\
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
