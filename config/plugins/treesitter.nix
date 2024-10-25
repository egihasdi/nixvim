{ pkgs, ... }: {
  plugins.treesitter = {
    enable = true;
    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      javascript
      typescript
      nix
    ];
    settings = {
      highlight.enable = true;
      indent.enable = true;
    };
  };
}
