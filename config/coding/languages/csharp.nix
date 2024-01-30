{ pkgs, omnisharp-extended-lsp, ... }:

{
  plugins = {
    lsp.servers.omnisharp = {
      enable = true;
      extraOptions = {
        handlers = {
          "textDocument/definition" = {
            __raw = ''
              function(...)
                return require("omnisharp_extended").handler(...)
              end,
            '';
          };
        };

        enable_import_completion = true;
        enable_roslyn_analyzers = true;
        organize_imports_on_format = true;
      };
    };

    conform-nvim = {
      formattersByFt.cs = [ "csharpier" ];
      formatters = {
        csharpier = {
          command = "dotnet-csharpier";
          args = [ "--write-stdout" ];
        };
      };
    };
  };

  extraPackages = [
    pkgs.csharpier
  ];

  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "omnisharp-extended-lsp";
      src = omnisharp-extended-lsp;
    })
  ];
}
