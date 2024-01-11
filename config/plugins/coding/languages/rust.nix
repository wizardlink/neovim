{ pkgs, rustaceanvim, ... }:

{
  plugins = {
    # Crate management helper.
    crates-nvim.enable = true;

    # Enable rust-analyzer LSP.
    lsp.servers.rust-analyzer = {
      enable = true;
      autostart = true;

      # I should have a dev shell for each project with
      # rustc and cargo installed to use.
      installRustc = false;
      installCargo = false;
    };

    # Add crates as a completion source.
    nvim-cmp.sources = [ { name = "crates"; } ];
  };

  extraPackages = [
    pkgs.vscode-extensions.vadimcn.vscode-lldb.adapter
  ];

  extraPlugins = [
    # Provides extra LSP, DAP and utilities
    (pkgs.vimUtils.buildVimPlugin {
      name = "rustaceanvim";
      src = rustaceanvim;
    })
  ];
}
