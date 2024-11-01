[
  {
    mode = "n";
    key = "<leader>ff";
    options.desc = "Find files";
    action = "<cmd>Telescope find_files<cr>";
  }
  {
    mode = "n";
    key = "<leader>fg";
    options.desc = "Live Grep";
    action = "<cmd>Telescope live_grep<cr>";
  }
  {
    mode = "n";
    key = "<leader>fb";
    options.desc = "Buffers";
    action = "<cmd>Telescope buffers<cr>";
  }
  {
    mode = "n";
    key = "<leader>fr";
    options.desc = "References";
    action = "<cmd>Telescope lsp_references<cr>";
  }
  {
    mode = "n";
    key = "<leader>fd";
    options.desc = "Diagnostics";
    action = "<cmd>Telescope lsp_diagnostics<cr>";
  }

]
