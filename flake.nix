{
  description = "My neovim home-manager module.";

  outputs =
    { self, ... }:
    {
      homeManagerModules.default = import ./module.nix;
    };
}
