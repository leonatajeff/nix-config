# ~/nix-config/modules/alacritty.nix
{ config, pkgs, lib, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      env.TERM = "xterm-256color";

      window = {
        padding = { x = 20; y = 20; };
        dynamic_padding = true;

        # macOS-specific nicety; safe on Linux too, but you can gate it if you want
        decorations = "buttonless";
      };

      scrolling = {
        history = 10000;
        multiplier = 3;
      };

      font = {
        size = 14.0;
        normal = { family = "JetBrainsMono Nerd Font"; style = "Regular"; };
        bold = { family = "JetBrainsMono Nerd Font"; style = "Bold"; };
        italic = { family = "JetBrainsMono Nerd Font"; style = "Italic"; };
      };
    };
  };

  # Make the referenced font actually exist everywhere
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
