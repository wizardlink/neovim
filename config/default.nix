{ pkgs, ... }:

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

      # Automatically write file on modification.
      autowrite = true;

      # Better completion window.
      completeopt = "menu,menuone,noselect";

      # Enable onfirmation dialog for most actions,
      # like `:wq`.
      confirm = true;

      # Better format options.
      formatoptions = "jcroqlnt";

      # Better grep format.
      grepformat = "%f:%l:%c:%m";

      # Use ripgrep for grep actions.
      grepprg = "rg --vimgrep";

      # Keep undo history.
      undofile = true;

      # Create a copy of the file before overwriting it.
      backup = true;

      # Smaller update time for certain events such as `CursorHold`.
      updatetime = 200;

      # Types of sessions to save
      sessionoptions = [
        "buffers"
        "curdir"
        "folds"
        "globals"
        "help"
        "skiprtp"
        "tabpages"
        "winsize"
      ];

      # How long to wait for a sequence to complete.
      timeoutlen = 300;

      ##-----------##
      ## INTERFACE ##
      ##-----------##

      # Enable mouse support to all modes.
      mouse = "a";

      # Make sure concealled text is completely hidden.
      conceallevel = 3;

      # Highlight the current line.
      cursorline = true;

      # Statusline fill characters.
      fillchars = {
        foldopen = "";
        foldclose = "";
        fold = " ";
        foldsep = " ";
        diff = "╱";
        eob = " ";
      };

      # Make so the statusline spans across all buffers.
      laststatus = 3;

      # Show line numbers relative to current line.
      number = true;
      relativenumber = true;

      # Turn magic on for regular expressions...
      # Incredible how we still use this terrible name.
      magic = true;

      # Minimum window width.
      winminwidth = 5;

      # Ignores casing when searching.
      ignorecase = true;
      smartcase = true; # But this makes so when it's uppercase
      # we care about casing.

      # Blend the popup.
      pumblend = 10;

      # Maximum entries in popups.
      pumheight = 10;

      # :h 'scrolloff' - hard to explain.
      scrolloff = 4;

      # :h 'sidescrolloff' - also hard.
      sidescrolloff = 8;

      # We have a statusline.
      showmode = false;

      # Always draw the sign column.
      signcolumn = "yes";

      # When horizontally splitting, put the new window below.
      splitbelow = true;

      # When vertically splitting, put them in the right.
      splitright = true;

      # Keep the cursor in the same place when moving around windows.
      splitkeep = "screen";

      # Enable true colors.
      termguicolors = true;

      # Disables line wrapping.
      wrap = false;

      ##--------##
      ## CODING ##
      ##--------##

      # Use 2 space indentation.
      expandtab = true;
      shiftround = true;
      shiftwidth = 2;
      tabstop = 2;

      # Better indentation out of the box.
      smartindent = true;

      # Allow going through non-characters to edit during
      # virtual block mode.
      virtualedit = "block";

      # The command-line completion mode.
      wildmode = "longest:full,full";
    };

    extraPackages = [
      pkgs.ripgrep
    ];

    extraConfigLua = ''
      local state_dir = os.getenv("XDG_STATE_HOME") or os.getenv("HOME") .. "/.local/state"

      -- Set the undo and backup directories properly.
      vim.opt.undodir = state_dir .. "/nvim/undo"
      vim.opt.backupdir = state_dir .. "/nvim/backup"

      -- Better prompt handling
      vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
    '';
  };
}
