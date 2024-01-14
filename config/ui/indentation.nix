{ lib, ... }:

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

    # Enable cool indentation animation.
    mini = {
      enable = true;

      modules = {
        indentscope = {
          symbol = "│";
        };
      };
    };
  };

  extraConfigLua = ''
    --  Disable mini.indentscope in certain scenarios.
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
