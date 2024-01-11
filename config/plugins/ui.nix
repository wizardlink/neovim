{ pkgs, transparent-nvim, ... }:

{
  plugins = {
    dashboard = {
      enable = true;

      hideStatusline = true;
      hideTabline = true;

      header = [
        "⢸⠉⣹⠋⠉⢉⡟⢩⢋⠋⣽⡻⠭⢽⢉⠯⠭⠭⠭⢽⡍⢹⡍⠙⣯⠉⠉⠉⠉⠉⣿⢫⠉⠉⠉⢉⡟⠉⢿⢹⠉⢉⣉⢿⡝⡉⢩⢿⣻⢍⠉⠉⠩⢹⣟⡏⠉⠹⡉⢻⡍⡇"
        "⢸⢠⢹⠀⠀⢸⠁⣼⠀⣼⡝⠀⠀⢸⠘⠀⠀⠀⠀⠈⢿⠀⡟⡄⠹⣣⠀⠀⠐⠀⢸⡘⡄⣤⠀⡼⠁⠀⢺⡘⠉⠀⠀⠀⠫⣪⣌⡌⢳⡻⣦⠀⠀⢃⡽⡼⡀⠀⢣⢸⠸⡇"
        "⢸⡸⢸⠀⠀⣿⠀⣇⢠⡿⠀⠀⠀⠸⡇⠀⠀⠀⠀⠀⠘⢇⠸⠘⡀⠻⣇⠀⠀⠄⠀⡇⢣⢛⠀⡇⠀⠀⣸⠇⠀⠀⠀⠀⠀⠘⠄⢻⡀⠻⣻⣧⠀⠀⠃⢧⡇⠀⢸⢸⡇⡇"
        "⢸⡇⢸⣠⠀⣿⢠⣿⡾⠁⠀⢀⡀⠤⢇⣀⣐⣀⠀⠤⢀⠈⠢⡡⡈⢦⡙⣷⡀⠀⠀⢿⠈⢻⣡⠁⠀⢀⠏⠀⠀⠀⢀⠀⠄⣀⣐⣀⣙⠢⡌⣻⣷⡀⢹⢸⡅⠀⢸⠸⡇⡇"
        "⢸⡇⢸⣟⠀⢿⢸⡿⠀⣀⣶⣷⣾⡿⠿⣿⣿⣿⣿⣿⣶⣬⡀⠐⠰⣄⠙⠪⣻⣦⡀⠘⣧⠀⠙⠄⠀⠀⠀⠀⠀⣨⣴⣾⣿⠿⣿⣿⣿⣿⣿⣶⣯⣿⣼⢼⡇⠀⢸⡇⡇⠇"
        "⢸⢧⠀⣿⡅⢸⣼⡷⣾⣿⡟⠋⣿⠓⢲⣿⣿⣿⡟⠙⣿⠛⢯⡳⡀⠈⠓⠄⡈⠚⠿⣧⣌⢧⠀⠀⠀⠀⠀⣠⣺⠟⢫⡿⠓⢺⣿⣿⣿⠏⠙⣏⠛⣿⣿⣾⡇⢀⡿⢠⠀⡇"
        "⢸⢸⠀⢹⣷⡀⢿⡁⠀⠻⣇⠀⣇⠀⠘⣿⣿⡿⠁⠐⣉⡀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠉⠓⠳⠄⠀⠀⠀⠀⠋⠀⠘⡇⠀⠸⣿⣿⠟⠀⢈⣉⢠⡿⠁⣼⠁⣼⠃⣼⠀⡇"
        "⢸⠸⣀⠈⣯⢳⡘⣇⠀⠀⠈⡂⣜⣆⡀⠀⠀⢀⣀⡴⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢽⣆⣀⠀⠀⠀⣀⣜⠕⡊⠀⣸⠇⣼⡟⢠⠏⠀⡇"
        "⢸⠀⡟⠀⢸⡆⢹⡜⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠋⣾⡏⡇⡎⡇⠀⡇"
        "⢸⠀⢃⡆⠀⢿⡄⠑⢽⣄⠀⠀⠀⢀⠂⠠⢁⠈⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠄⡐⢀⠂⠀⠀⣠⣮⡟⢹⣯⣸⣱⠁⠀⡇"
      ];
      center = [
        { action = "Telescope oldfiles"; icon = ""; desc = " Recent files"; shortcut = "r"; }
        { action = "Telescope projects"; icon = ""; desc = " Projects"; shortcut = "p"; }
        { action = "lua require(\"persistence\").load()"; icon = "󱞇"; desc = " Restore session"; shortcut = "s"; }
        { action = "qa"; icon = "󰅚"; desc = " Quit"; shortcut = "q"; }
      ];
      footer = [ "  wizardlink/neovim" ];
    };

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

    # Show indentation lines.
    indent-blankline = {
      enable = true;

      indent.char = "│";
      indent.tabChar = "│";

      # Disable scope, we use mini.indentscope for that.
      scope.enabled = false;
    };

    # The mode line in the bottom.
    lualine = {
      enable = true;
      iconsEnabled = true;
    };

    # Enable cool indentation animation.
    mini = {
      enable = true;

      modules = {
        indentscope = {
          symbol = "│";
        };
      };
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
    };

    # Better netrw.
    nvim-tree.enable = true;

    # Register projects more easily to cd into.
    project-nvim.enable = true;

    # Cool floating window for fuzzy finding
    telescope = {
      enable = true;

      extensions = {
        file_browser.enable = true; # So we can `find_files`.
        project-nvim.enable = true; # So we can find `projects`.
      };
    };

    # Better highlighting for important comment keywords.
    todo-comments.enable = true;

    # Enable treesitter highlighting.
    treesitter = {
      enable = true;
      gccPackage = pkgs.llvmPackages.clang;

      # Allows `extraConfigLua` to have lua highlighting.
      nixvimInjections = true;
    };

    # Show current context in the code in the top.
    treesitter-context.enable = true;

    # Better text objects.
    treesitter-textobjects.enable = true;

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