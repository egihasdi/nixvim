{
  description = "My Nixvim Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs =
    { nixpkgs, nixvim, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      nixvim' = nixvim.legacyPackages.${system};
      nixvimModule = {
        inherit pkgs;
        module = import ./config;
        extraSpecialArgs = {};
      };
      nvim = nixvim'.makeNixvimWithModule nixvimModule;
    in
    {
      packages.${system}.default = nvim;
    };
}
