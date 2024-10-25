{

  plugins.cmp-nvim-lsp = { enable = true; };
  plugins.cmp-buffer = { enable = true; };

  plugins.cmp = {
    enable = true;
    autoEnableSources = true;

    settings = {
      sources = [
        { name = "nvim_lsp"; }
        {
          name = "buffer"; # text within current buffer
          option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
          keywordLength = 3;
        }
      ];

      mapping.__raw = ''
        cmp.mapping.preset.insert({
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        })
      '';
    };
  };

}
