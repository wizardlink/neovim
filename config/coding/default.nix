{
  imports = [
    ./completion.nix
    ./languages
  ];

  plugins = {
    # Enable debugging.
    dap = {
      enable = true;

      extensions = {
        dap-ui.enable = true;
        dap-virtual-text.enable = true;
      };
    };

    # Enable formatting.
    conform-nvim.enable = true;

    # Enhance searching.
    flash.enable = true;

    # Enable linting.
    lint.enable = true;

    # Enable LSP.
    lsp = {
      enable = true;

      servers = {
        # Nix file LSP.
        nixd = {
          enable = true;
          autostart = true;
        };
      };
    };

    # Save coding sessions to easily go back to them.
    persistence.enable = true;

    # Auto close and rename HTML tags.
    ts-autotag.enable = true;

    # Sets the `commentstring` based on the cursor location in the file.
    ts-context-commentstring = {
      enable = true;
      disableAutoInitialization = true;
    };

    # Suite of helpful modules.
    mini = {
      enable = true;

      modules = {
        # Better text objects.
        ai = {
          n_lines = 500;
        };

        # Allow easy commenting multiple lines
        # through a `gcc` keybind.
        comment = {
          custom_commentstring = ''
            function()
              return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
            end
          '';
        };

        # Manipulate surrounding text.
        surround = {
          mappings = {
            add = "gsa"; # Add surrounding in Normal and Visual modes
            delete = "gsd"; # Delete surrounding
            find = "gsf"; # Find surrounding (to the right)
            find_left = "gsF"; # Find surrounding (to the left)
            highlight = "gsh"; # Highlight surrounding
            replace = "gsr"; # Replace surrounding
            update_n_lines = "gsn"; # Update `n_lines`
          };

        };
      };
    };
  };

  extraConfigLua = ''
    local wk = require("which-key")

    wk.register({
      s = {
        name = "Manipulate surrounding text",
        a = "Add surrounding in Normal and Visual modes",
        d = "Delete surrounding",
        f = "Find surrounding",
        F = "Find surrounding (to the left)",
        h = "Highlight surrounding",
        r = "Replace surrounding",
        n = "Update `n_lines`",
      },
    }, { prefix = "g" })
  '';
}
