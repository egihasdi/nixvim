{ root, ... }: {
  plugins.obsidian = {
    enable = true;
    settings = {
      workspaces = [{
        name = "egihasdi.gitlab.io";
        path = "/home/work/egihasdi.github.io/src/notes";
      }];
      picker.name = "telescope.nvim";
    };
  };
}
