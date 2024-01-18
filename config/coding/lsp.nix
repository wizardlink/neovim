{
  plugins = {
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

    # Better and easier diagnostics
    trouble.enable = true;
  };

  extraConfigLua = ''
    local wk = require("which-key")

    wk.register({
      l = {
        name = "LSP",
        a = { vim.lsp.buf.code_action, "Code action", has = "codeAction" },
        d = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Diagnostics" },
        D = { vim.lsp.buf.declaration, "Go to declaration" },
        f = { function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, "Find definitions" },
        i = { function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end, "Find implementations" },
        l = { "<cmd>Telescope loclist<cr>", "Locations" },
        q = { "<cmd>Telescope quickfix<cr>", "Quickfixes" },
        r = { "<cmd>Telescope lsp_references<cr>", "References" },
        t = { function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end, "Type definitions" },
        h = { vim.lsp.buf.signature_help, "Signature Help", has = "signatureHelp" },
      },
      k = { vim.lsp.buf.hover, "Hover" },
    }, { prefix = "<leader>" })

    -- Icons to be set for diagnostics.
    local diagnosticIcons = {
      Error = " ",
      Warn  = " ",
      Hint  = " ",
      Info  = " ",
    }

    -- Then actually set them.
    for name, icon in pairs(diagnosticIcons) do
      name = "DiagnosticSign" .. name
      vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
    end
  '';
}
