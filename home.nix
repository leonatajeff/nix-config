# ~/nix-config/home.nix
{ config, pkgs, ... }:

{
  imports = [
   ./modules/git.nix
   ./modules/zsh.nix
   ./modules/neovim.nix
   ./modules/tmux.nix
   ./modules/ghostty.nix
  ];

  # Set your basic home environment variables
  home.username = "jeffleonata";
  home.homeDirectory = "/Users/leonata";

  # This is crucial for managing breaking changes
  home.stateVersion = "24.05";

  # The list of packages you want to have installed.
  home.packages = with pkgs; [
    # Dev essentials
    lazygit
    neovim
    ripgrep
    fd
    tree
    tmux
    gh # GitHub CLI

    # python
    uv
    
    # apps
    aerospace

    ffmpeg
    # General utils
    htop

    gemini-cli
    ollama
  ];

  # Let Home Manager handle Zsh startup
  programs.home-manager.enable = true;
}
