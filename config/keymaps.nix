{
  # Set keybinds which aren't relevant to `<leader>`.
  keymaps = [
    # Move between buffers with tab in normal mode
    {
      action = ":bn<cr>";
      key = "<tab>";
      mode = [ "n" ];
      options.silent = true;
    }
    {
      action = ":bp<cr>";
      key = "<s-tab>";
      mode = [ "n" ];
      options.silent = true;
    }
  ];

  # Due to limitations I'll opt for setting keybinds through lua
  # so that which-key is properly configured.
  extraConfigLua = ''
    local wk = require("which-key")

    wk.register({
      e = { "<cmd>NvimTreeFindFileToggle<cr>", "Browse files" },
      h = { "<cmd>noh<cr>", "Stop search highlight" },
      t = {
        name = "Terminal",
        o = { "<cmd>FloatermNew<cr>", "Open terminal" },
        s = { "<cmd>FloatermSend<cr>", "Send current line to terminal" },
        t = { "<cmd>FloatermToggle<cr>", "Toggle terminal visibility" },
      },
    }, { prefix = "<leader>" })
  '';
}
