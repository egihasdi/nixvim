{ pkgs, ... }: {

  globals = { mapleader = " "; };
  opts = {
    number = true;
    relativenumber = true;
    laststatus = 3;
    preserveindent = true;
    tabstop = 2;
    shiftwidth = 0;
    expandtab = true;
    splitkeep = "screen";
    cmdheight = 0;
    fillchars = { eob = " "; };
    signcolumn = "yes";
    foldcolumn = "1";
    winbar = "%{%v:lua.require'nvim-navic'.get_location()%}";
  };
  clipboard = {
    register = "unnamedplus";
    providers.xsel.enable = true;
  };
  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
      color_overrides = {
        mocha = {
          base = "#000000";
          mantle = "#000000";
          crust = "#000000";
        };
      };
    };
  };
  plugins = {

    yazi = { enable = true; };
    nvim-autopairs = { enable = true; };

    telescope = {
      enable = true;
      extensions.live-grep-args.enable = true;
    };
    diffview = { enable = true; };

  };

  keymaps = import ./keymaps;

  imports = [
    ./plugins/neo-tree.nix
    ./plugins/gitsigns.nix
    ./plugins/edgy.nix
    ./plugins/cmp.nix
    ./plugins/bufferline.nix
    ./plugins/lsp-format.nix
    ./plugins/lsp.nix
    ./plugins/navic.nix
    ./plugins/none-ls.nix
    ./plugins/noice.nix
    ./plugins/treesitter.nix
    ./plugins/comment.nix
    ./plugins/airline.nix
    ./plugins/barbecue.nix
    ./plugins/web-devicons.nix
  ];
}
