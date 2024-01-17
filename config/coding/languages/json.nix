{ pkgs, schemastore-nvim, ... }:

{
  plugins = {
    lsp.servers.jsonls = {
      enable = true;
      extraOptions = {
        json = {
          format = {
            enable = true;
          };

          validate = { enable = true; };
        };
      };
    };
  };

  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "schemastore-nvim";
      src = schemastore-nvim;
    })
  ];
}
