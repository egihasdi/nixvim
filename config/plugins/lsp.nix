{
  plugins.lsp = {
    enable = true;
    servers.nixd.enable = true;
    servers.biome.enable = true;

    servers = {
      ts_ls = {
        enable = true;
        settings = {
          capabilities = {
            documentFormattingProvider = false;
            documentSymbolProvider = true;
          };
        };
        onAttach.function = ''
          client.server_capabilities.documentFormattingProvider = false
        '';
      };
    };

    # Set keymaps when LSP is attached
    keymaps = {
      extra = [
        {
          mode = "n";
          key = "<leader>li";
          action = "<cmd>LspInfo<cr>";
          options.desc = "Show LSP info";
        }
        {
          mode = "n";
          key = "<leader>ll";
          action.__raw = "function() vim.lsp.codelens.refresh() end";
          options.desc = "LSP CodeLens refresh";
        }
        {
          mode = "n";
          key = "<leader>lL";
          action.__raw = "function() vim.lsp.codelens.run() end";
          options.desc = "LSP CodeLens run";
        }
      ];
    };

    keymaps = {
      lspBuf = {
        gd = {
          action = "definition";
          desc = "Go to definition";
        };
        gD = {
          action = "declaration";
          desc = "Go to declaration";
        };
        gI = {
          action = "implementation";
          desc = "Go to implementation";
        };
        gy = {
          action = "type_definition";
          desc = "Go to type definition";
        };
        K = {
          action = "hover";
          desc = "LSP hover";
        };
        "<leader>la" = {
          action = "code_action";
          desc = "LSP code action";
        };
      };
    };

    postConfig = ''
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = true,
        severity_sort = false,
      })

      local signs = {
        Error = "",
        Warn = "",
        Info = "󰋼",
        Hint = "󰌵",
      }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end 
    '';
  };
}
