# flake.nix

{
  description = "Python development flake";

  inputs =
    {
      nixpkgs.url = "github:nixos/nixpkgs/24.05";
    };

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.x86_64-linux.default = pkgs.mkShell {
            nativeBuildInputs = with pkgs; [ python3 ];
      };
	    
      packages = [
	      (pkgs.python3.withPackages (python-pkgs: [
            python-pkgs.numpy # Package for numerical computing
            python-pkgs.pandas # Data manipulation library built on top of numpy
            python-pkgs.scipy # Library for scientific and technical computing built on top of numpy
            python-pkgs.jupyterlab # Jupyterlab integration
            python-pkgs.statsmodels 
            python-pkgs.scikitlearn # Provides tools for data mining and machine learning
            python-pkgs.matplotlib # For making graphs
            python-pkgs.seaborn # For making graphs
            python-pkgs.opencv # For computer vision machine learning
	      ]))
      ];

      shellHook = ''
        echo "Entered Basic Python Development Env"
      '';
    };
}
