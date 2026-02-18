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

      macos-titlebar-style = "hidden";
      font-thicken = true;
    };
  };

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
