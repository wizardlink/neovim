{
  # Due to limitations I'll opt for setting keybinds through lua
  # so that which-key is properly configured.
  extraConfigLua = ''
    local wk = require("which-key")

    wk.register({
      h = { "<cmd>noh<cr>", "Stop search highlight" },
    }, { prefix = "<leader>" })
  '';
}
