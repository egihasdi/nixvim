[
  {
    mode = "n";
    key = "]g";
    action.__raw = "function() require('gitsigns').next_hunk() end";
    options.desc = "Next Git hunk";
  }
  {
    mode = "n";
    key = "[g";
    action.__raw = "function() require('gitsigns').prev_hunk() end";
    options.desc = "Previous Git hunk";
  }
  {
    mode = "n";
    key = "<Leader>gp";
    action.__raw = "function() require('gitsigns').preview_hunk_inline() end";
    options.desc = "Preview Git hunk";
  }
  {
    mode = "n";
    key = "<Leader>gh";
    action.__raw = "function() require('gitsigns').reset_hunk() end";
    options.desc = "Reset Git hunk";
  }
]
