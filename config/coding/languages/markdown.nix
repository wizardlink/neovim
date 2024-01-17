{ pkgs, headlines-nvim, ... }:

{
  plugins = {
    lsp.servers.marksman.enable = true;

    markdown-preview = {
      enable = true;
      browser = "firefox";
      theme = "dark";
    };

    lint.lintersByFt.markdown = [ "markdownlint" ];
  };

  extraPackages = [
    pkgs.nodePackages.markdownlint-cli
  ];

  extraPlugins = [
    # Extra highlihgting for markdown
    (pkgs.vimUtils.buildVimPlugin {
      name = "headlines";
      src = headlines-nvim;
    })
  ];
}
