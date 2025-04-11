# flake.nix

{
  description = "R development flake";

  inputs =
    {
      nixpkgs.url = "github:nixos/nixpkgs/24.05";
    };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      RStudio-with-my-packages = pkgs.rstudioWrapper.override{
        packages = with pkgs.rPackages; [ 
        amap
        dplyr 
        ggplot2 
        ggcorrplot
        hash 
        tidyverse 
        fastDummies 
        corrplot
        devtools 
        forecast 
        mlbench
        treemapify
        Hmisc
        corrgram
        gains
        ROC
        caret
      ]; 
        };
    in
    {
      devShells.x86_64-linux.default =
        pkgs.mkShell
          {
            nativeBuildInputs = with pkgs; [
		            R
                RStudio-with-my-packages
            ];
          };
	  packages = [
        # Put other packages here
	  ];
    };
}
