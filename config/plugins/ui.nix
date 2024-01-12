{ lib, pkgs, transparent-nvim, ... }:

let
  # FileTypes that I don't want indentation plugins to affect.
  filetypeNoIndent = [
    "help"
    "alpha"
    "dashboard"
    "neo-tree"
    "Trouble"
    "trouble"
    "notify"
    "toggleterm"
  ];
in
{
  plugins = {
    dashboard = {
      enable = true;

      # Use `doom` theme as `hyper` is too automated,
      # meant to be something you just drop-in and use.
      theme = "doom";
      hideStatusline = true; # Hides statusline while in dashboard.
      hideTabline = true;    # Hides tabline while in dashboard.
      hideWinbar = true;     # Hides winbar while in dashboard.

      weekHeader = {
        enable = true;
        append = lib.lists.flatten (builtins.split "\n" (builtins.readFile ./dashboard-header.txt));
        concat = "Zehahahaha! PEOPLE'S DREAMS... DON'T EVER END! AM I RIGHT?";
      };

      # Reads off of `dashboard-header.txt` to set the header ASCII art.
      header = lib.lists.flatten (builtins.split "\n" (builtins.readFile ./dashboard-header.txt));

      # All the actions available in the dashboard.
      center = [
        { action = "Telescope oldfiles"; icon = ""; desc = "  Recent files"; key = "r"; }
        { action = "Telescope projects"; icon = ""; desc = "  Projects"; key = "p"; }
        { action = "lua require(\"persistence\").load()"; icon = "󱞇"; desc = "  Restore session"; key = "s"; }
        { action = "qa"; icon = "󰅚"; desc = "  Quit"; key = "q"; }
      ];

      # Footer of the dashboard.
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

      # FileTypes that indentation makes no sense.
      exclude.filetypes = filetypeNoIndent;

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
      backgroundColour = "EndOfBuffer";
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

  # Disable mini.indentscope in certain scenarios.
  extraConfigLua = ''
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        ${lib.strings.concatMapStrings (a: "'" + a + "',\n") filetypeNoIndent}
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    });
  '';
}
