{
  plugins.telescope = {
    enable = true;
    extensions.live-grep-args.enable = true;
    settings = {
      defaults = {
        layout_strategy = "vertical";
        layout_config = {
          vertical = {
            prompt_position = "top";
            width = 0.5;
          };
        };
        sorting_strategy = "ascending";
      };
    };
  };
}
