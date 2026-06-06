# ~/nix-config/modules/git.nix
{ ... }:

{
  programs.git = {
    enable = true;
    userName = "";
    userEmail = "";
  };
}
