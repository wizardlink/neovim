{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:wizardlink/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";

    transparent-nvim = {
      url = "github:xiyaowong/transparent.nvim";
      flake = false;
    };

    rustaceanvim = {
      url = "github:mrcjkb/rustaceanvim";
      flake = false;
    };

    schemastore-nvim = {
      url = "github:b0o/SchemaStore.nvim";
      flake = false;
    };

    headlines-nvim = {
      url = "github:lukas-reineke/headlines.nvim";
      flake = false;
    };

    friendly-snippets = {
      url = "github:rafamadriz/friendly-snippets";
      flake = false;
    };
  };

  outputs =
    { flake-parts
    , nixpkgs
    , nixvim
    , ...
    } @ inputs:
    let
      config = import ./config; # import the module directly
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem =
        { pkgs
        , system
        , ...
        }:
        let
          nixvimLib = nixvim.lib.${system};
          nixvim' = nixvim.legacyPackages.${system};
          nvim = nixvim'.makeNixvimWithModule {
            inherit pkgs;
            module = config;
            # You can use `extraSpecialArgs` to pass additional arguments to your module files
            extraSpecialArgs = {
              # inherit (inputs) foo;
              inherit (inputs) transparent-nvim rustaceanvim schemastore-nvim headlines-nvim friendly-snippets;
            };
          };
        in
        {
          checks = {
            # Run `nix flake check .` to verify that your config is not broken
            default = nixvimLib.check.mkTestDerivationFromNvim {
              inherit nvim;
              name = "A nixvim configuration";
            };
          };

          packages = {
            # Lets you run `nix run .` to start nixvim
            default = nvim;
          };

          formatter = nixpkgs.legacyPackages.${system}.nixpkgs-fmt;
        };
    };
}
