# ~/nix-config/home.nix
{ config, pkgs, ... }:

{
  imports = [
   ./modules/zsh.nix
   ./modules/neovim.nix
  ]
  # Set your basic home environment variables
  home.username = "jeffleonata";
  home.homeDirectory = "/Users/leonata";

  # This is crucial for managing breaking changes
  home.stateVersion = "24.05";

  # The list of packages you want to have installed.
  home.packages = with pkgs; [
    # Dev essentials
    git
    neovim
    ripgrep
    fd
    zoxide
    gh # GitHub CLI

    # General utils
    htop
    eza # A modern `ls`
  ];

  # Program-specific configurations
  programs.git = {
    enable = true;
    userName = "leonatajeff";
    userEmail = "jeffleonata@gmail.com"; # Change this
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
  };

  # Let Home Manager handle Zsh startup
  programs.home-manager.enable = true;
}
