{ pkgs, rustaceanvim, ... }:

{
  plugins = {
    # Crate management helper.
    crates-nvim.enable = true;

    # Enable rust-analyzer LSP.
    # Add crates as a completion source.
    nvim-cmp.sources = [ { name = "crates"; } ];
  };

  extraPackages = [
    pkgs.vscode-extensions.vadimcn.vscode-lldb.adapter
  ];

  extraPlugins = [
    # Provides extra LSP, DAP and general Rust utilities
    {
      plugin = (pkgs.vimUtils.buildVimPlugin {
        name = "rustaceanvim";
        src = rustaceanvim;
      });

      config = "";
    }
  ];
}
