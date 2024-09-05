# flake.nix

{
  description = "Python development flake";

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
		python3
            ];
          };
	  packages = [
	    (pkgs.python3.withPackages (python-pkgs: [
		# put python packages here
		# Example: python-pkgs.pandas
	    ]))
	  ];
    };
}
