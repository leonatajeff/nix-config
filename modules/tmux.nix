{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    terminal = "screen-256color";
    historyLimit = 10000;
    mouse = true;
    keyMode = "vi";
    
    extraConfig = ''
      # Remap prefix to C-s
      unbind C-b
      set -g prefix C-s
      bind C-s send-prefix

      # Split panes using | and -
      bind | split-window -h
      bind - split-window -v
      unbind '"'
      unbind %

      # Vim-like pane navigation
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Start windows and panes at 1
      set -g base-index 1
      setw -g pane-base-index 1

      # Reload config
      bind r source-file ~/.config/tmux/tmux.conf \; display "Reloaded!"
    '';
  };
}
