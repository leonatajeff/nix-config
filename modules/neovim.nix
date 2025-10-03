# ~/nix-config/modules/neovim.nix
{ pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    # You can still use vimAlias if you want `vim` to launch `nvim`
    vimAlias = true;

    # Options are set directly
    opts = {
      number = true;
      relativenumber = true;
      hlsearch = true;
      incsearch = true;
    };

    # Enable plugins from the curated list
    plugins = {
      # Syntax and completions
      treesitter.enable = true;
      cmp.enable = true;
      luasnip.enable = true;

      # UI/Theme
      tokyonight.enable = true;
      lualine.enable = true;

      # Tools
      telescope.enable = true;
      gitsigns.enable = true;
      which-key.enable = true;
    };

    # Keymaps are defined in a structured way
    keymaps = [
      {
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<cr>";
        mode = "n";
        options.desc = "Find Files";
      }
      {
        key = "<leader>fg";
        action = "<cmd>Telescope live_grep<cr>";
        mode = "n";
        options.desc = "Live Grep";
      }
    ];
  };
}
