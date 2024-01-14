{ pkgs, transparent-nvim, ... }:

{
  imports = [
    ./dashboard.nix
    ./fuzzyfind.nix
    ./highlight.nix
    ./indentation.nix
  ];

  plugins = {
    # Floating terminal window.
    floaterm = {
      enable = true;

      # When opening a terminal, always open the same session
      # if it exists.
      autohide = 0;

      # Hide title, I'll only ever use one terminal.
      title = "";

      # Size the terminal as I like.
      width = 0.85;
      height = 0.55;
    };

    # The mode line in the bottom.
    lualine = {
      enable = true;
      iconsEnabled = true;
    };

    # Command popups, replaces `messages`, `popupmenu` and `cmdline`.
    noice = {
      enable = true;

      presets = {
        bottom_search = true; # use a classic bottom cmdline for search
        command_palette = true; # position the cmdline and popupmenu together
        long_message_to_split = true; # long messages will be sent to a split
        inc_rename = false; # enables an input dialog for inc-rename.nvim
        lsp_doc_border = false; # add a border to hover docs and signature help
      };
    };

    # Better `vim.notify()`.
    notify = {
      enable = true;
      backgroundColour = "#000000";
    };

    # Better netrw.
    nvim-tree.enable = true;

    # Better highlighting for important comment keywords.
    todo-comments.enable = true;

    # The cool window that shows up when pressing common keys,
    # this needs a lot of configuring for this distribution to
    # make it useful, as you register keys normally with which-key
    # which the distribution doesn't allows with just nix code.
    which-key = {
      enable = true;
      operators = {
        prefix = " ";
      };
    };
  };

  extraPlugins = with pkgs.vimPlugins; [
    # Adds icons to be used in various places,
    # including nvim-tree.
    nvim-web-devicons

    # Makes as many backgrounds as possible, transparent.
    (pkgs.vimUtils.buildVimPlugin {
      name = "transparent-nvim";
      src = transparent-nvim; # This comes from `flake.nix`.
    })
  ];
}
