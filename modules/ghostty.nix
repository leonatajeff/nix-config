# ~/nix-config/modules/ghostty.nix
{ pkgs, ... }:

{
  programs.ghostty = {
    enable = true;

    package = pkgs.ghostty-bin;

    # Keep it minimal and portable
    settings = {
      font-family = "JetBrainsMono Nerd Font";
      font-size = 18;

      window-padding-x = 20;
      window-padding-y = 20;
    };
  };

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}