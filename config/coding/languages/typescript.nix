{ pkgs, ... }:

{
  plugins = {
    lsp.servers.tsserver = {
      enable = true;

      extraOptions = {
        settings = {
          typescript = {
            format = {
              indentSize = { __raw = "vim.o.shiftwidth"; };
              convertTabsToSpaces = { __raw = "vim.o.expandtab"; };
              tabSize = { __raw = "vim.o.expandtab"; };
            };
          };

          javascript = {
            format = {
              indentSize = { __raw = "vim.o.shiftwidth"; };
              convertTabsToSpaces = { __raw = "vim.o.expandtab"; };
              tabSize = { __raw = "vim.o.expandtab"; };
            };
          };

          completions.completeFunctionCalls = true;
        };
      };
    };
  };
}
