{ pkgs, rustaceanvim, ... }:

{
  plugins = {
    # Crate management helper.
    crates-nvim.enable = true;

    # Enable rust-analyzer LSP.
    # Add crates as a completion source.
    nvim-cmp.sources = [{ name = "crates"; }];

    conform-nvim.formattersByFt.rust = [ "rustfmt" ];
  };

  extraPackages = with pkgs; [
    rustfmt
    vscode-extensions.vadimcn.vscode-lldb.adapter
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

  extraConfigLua = ''
    vim.cmd([[
        augroup RustLSP
          autocmd CursorHold                      *.rs silent! lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved,InsertEnter         *.rs silent! lua vim.lsp.buf.clear_references()
          autocmd BufEnter,CursorHold,InsertLeave *.rs silent! lua vim.lsp.codelens.refresh()
        augroup END
    ]])
  '';
}
