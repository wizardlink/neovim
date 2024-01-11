{
  # Import all your configuration modules here
  imports = [
    ./keymaps.nix
    ./plugins/coding
    ./plugins/ui.nix
  ];

  config = {
    # Enable wayland clipboard integration.
    clipboard.providers.wl-copy.enable = true;

    # Set the colorscheme.
    colorschemes.catppuccin = {
      enable = true;
      flavour = "frappe";
    };

    # Enable editorconfig integration.
    editorconfig.enable = true;

    # Set the `<leader>`.
    globals.mapleader = " ";

    options = {
      # Show line numbers relative to current line.
      number = true;
      relativenumber = true;

      # Use 2 space indentation.
      expandtab = true;
      shiftround = true;
      shiftwidth = 2;
      tabstop = 2;

      # Keep undo history.
      undofile = true;
    };
  };
}
