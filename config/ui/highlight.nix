{ pkgs, ... }:

{
  plugins = {
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
  };
}
