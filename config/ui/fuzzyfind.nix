{
  # Needed to be able to search and set project directories.
  plugins.project-nvim.enable = true;

  plugins.telescope = {
    enable = true;

    extensions = {
      file_browser.enable = true; # So we can `find_files`.
      project-nvim.enable = true; # So we can find `projects`.
    };
  };

  # Configure keybinds to invoke telescope
  extraConfigLua = ''
    require("which-key").register({
      ["<leader>"] = { "<cmd>Telescope find_files<cr>", "Find file" },
      p = { "<cmd>Telescope projects<cr>", "Open project" },
      s = {
        name = "Search",
        b = { "<cmd>Telescope buffers<cr>", "Search buffers" },
        t = { "<cmd>Telescope live_grep<cr>", "Search text" },
      },
    }, { prefix = "<leader>" });
  '';
}
