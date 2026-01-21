# ~/nix-config/modules/git.nix
{ ... }:

{
  programs.git = {
    enable = true;
    userName = "leonatajeff";
    userEmail = "jeffleonata@gmail.com";
  };
}