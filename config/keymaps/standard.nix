let
  forceWrite = {
    action = "<cmd>silent! update! | redraw<cr>";
    options.desc = "Force write";
  };
in [
  {
    mode = "n";
    key = "<leader>q";
    action = "<cmd>confirm q<cr>";
    options.desc = "Quit window";
  }
  {
    mode = "n";
    key = "<leader>Q";
    action = "<cmd>confirm qall<cr>";
    options.desc = "Exit neovim";
  }
  {
    inherit (forceWrite) action options;
    mode = "n";
    key = "<c-s>";
  }
  {
    inherit (forceWrite) options;
    mode = [ "i" "x" ];
    key = "<c-s>";
    action = "<esc>" + forceWrite.action;
  }

  {
    mode = "n";
    action = "<cmd>Yazi<cr>";
    key = "<leader>e";
  }
]
