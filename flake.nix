{
  description = "My Nixvim Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";

    systems.url = "github:nix-systems/x86_64-linux";

  };

  outputs = { nixpkgs, nixvim, systems, ... }:
    let forEachSystem = nixpkgs.lib.genAttrs (import systems);
    in {
      packages = forEachSystem (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          nixvim' = nixvim.legacyPackages.${system};
          nixvimModule = {
            inherit pkgs;
            module = import ./config;
            extraSpecialArgs = { };
          };
          nvim = nixvim'.makeNixvimWithModule nixvimModule;
        in { default = nvim; });
    };
  #   let
  #     
  #   in { packages.${system}.default = nvim; };
  # packages = let 
  #   
  #   in
}
