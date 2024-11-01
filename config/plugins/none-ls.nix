{
  plugins.none-ls = {
    enable = true;
    sources.formatting.nixfmt.enable = true;
    sources.formatting.prettier = {
      enable = true;
      disableTsServerFormatter = true;
    };
    # sources.formatting.biome.enable = true;
    # sources.formatting.phpcsfixer.enable = true;
  };
}
