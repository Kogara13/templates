# flake.nix

{
  description = "Default flake";

  inputs =
    {
      nixpkgs.url = "github:nixos/nixpkgs/24.05";
    };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.x86_64-linux.default =
        pkgs.mkShell
          {
            nativeBuildInputs = with pkgs; [
            ];
          };
    };
}

