{
  # Import all your configuration modules here
  imports = [
    ./coding
    ./keymaps.nix
    ./ui
  ];

  config = {
    # Enable wayland clipboard integration.
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

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
      ##---------##
      ## GENERAL ##
      ##---------##

      # Automatically change the current directory.
      autochdir = true;

      # Enable onfirmation dialog for most actions,
      # like `:wq`.
      confirm = true;

      # Keep undo history.
      undofile = true;

      # Create a copy of the file before overwriting it.
      backup = true;

      ##-----------##
      ## INTERFACE ##
      ##-----------##

      # Show line numbers relative to current line.
      number = true;
      relativenumber = true;

      # Turn magic on for regular expressions...
      # Incredible how we still use this terrible name.
      magic = true;

      # Ignores casing when searching.
      ignorecase = true;
      smartcase = true; # But this makes so when it's uppercase
                        # we care about casing.

      # Fold code based off of syntax.
      foldmethod = "syntax";

      ##--------##
      ## CODING ##
      ##--------##

      # Use 2 space indentation.
      expandtab = true;
      shiftround = true;
      shiftwidth = 2;
      tabstop = 2;

      # Improves indentation when creating a new line.
      smartindent = true;
    };

    extraConfigLua = ''
      local state_dir = os.getenv("XDG_STATE_HOME") or os.getenv("HOME") .. "/.local/state"

      -- Set the undo and backup directories properly.
      vim.opt.undodir = state_dir .. "/nvim/undo"
      vim.opt.backupdir = state_dir .. "/nvim/backup"
    '';
  };
}
