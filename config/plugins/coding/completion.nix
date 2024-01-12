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
    };
  };
}
