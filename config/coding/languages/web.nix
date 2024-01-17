{ pkgs, lib, ... }:

let
  baseFiletypes = [
    "javascript"
    "javascriptreact"
    "typescript"
    "typescriptreact"
    "vue"
  ];
in
with lib.attrsets; {
  plugins = {
    conform-nvim.formattersByFt = genAttrs
      (baseFiletypes ++ [
        "css"
        "scss"
        "less"
        "html"
        "json"
        "jsonc"
        "yaml"
        "markdown"
        "markdown.mdx"
        "graphql"
        "handlebars"
      ])
      (_: [ "prettier" ]);

    # Enable Vue LSP.
    lsp.servers.volar.enable = true;
    lint.lintersByFt = genAttrs baseFiletypes (_: [ "eslint" ]);
  };

  extraPackages = [
    pkgs.nodePackages.prettier
  ];
}
