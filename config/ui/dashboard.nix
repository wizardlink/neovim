{ lib, ... }:

{
  plugins.dashboard = {
    enable = true;

    # Use `doom` theme as `hyper` is too automated,
    # meant to be something you just drop-in and use.
    theme = "doom";
    hideStatusline = true; # Hides statusline while in dashboard.
    hideTabline = true; # Hides tabline while in dashboard.
    hideWinbar = true; # Hides winbar while in dashboard.

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
}
