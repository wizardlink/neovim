{
  plugins = {
    # Enable snippet engine.
    luasnip.enable = true;

    # Enable the completion engine.
    nvim-cmp = {
      enable = true;
      autoEnableSources = true;

      # Enable integration with luasnip.
      snippet.expand = "luasnip";

      sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        {
          name = "buffer";
          # This way it finds words in all open buffers.
          option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
        }
      ];

      mapping = {
        "<C-Space>" = "cmp.mapping.complete()";
        "<C-e>" = "cmp.mapping.close()";
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        "<S-Tab>" = {
          action = "cmp.mapping.select_prev_item()";
          modes = [ "i" "s" ];
        };
        "<Tab>" = {
          action = "cmp.mapping.select_next_item()";
          modes = [ "i" "s" ];
        };
      };

      formatting.format = ''
        function(_, item)
          local icons = {
            Array         = " ",
            Boolean       = "󰨙 ",
            Class         = " ",
            Codeium       = "󰘦 ",
            Color         = " ",
            Control       = " ",
            Collapsed     = " ",
            Constant      = "󰏿 ",
            Constructor   = " ",
            Copilot       = " ",
            Enum          = " ",
            EnumMember    = " ",
            Event         = " ",
            Field         = " ",
            File          = " ",
            Folder        = " ",
            Function      = "󰊕 ",
            Interface     = " ",
            Key           = " ",
            Keyword       = " ",
            Method        = "󰊕 ",
            Module        = " ",
            Namespace     = "󰦮 ",
            Null          = " ",
            Number        = "󰎠 ",
            Object        = " ",
            Operator      = " ",
            Package       = " ",
            Property      = " ",
            Reference     = " ",
            Snippet       = " ",
            String        = " ",
            Struct        = "󰆼 ",
            TabNine       = "󰏚 ",
            Text          = " ",
            TypeParameter = " ",
            Unit          = " ",
            Value         = " ",
            Variable      = "󰀫 ",
          }

          item.kind = icons[item.kind] or ""

          return item
        end,
      '';
    };
  };
}
