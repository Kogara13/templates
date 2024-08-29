{
    description = "Collection of custom project templates";

    outputs = { self }: {
	templates = {
	    local = {
		path = ./local;
		description = "Use local package default.nix";
	    };
	    rust = {
		path = ./rust;
		description = "Create a generic rust development environment";
	    };

	    shell = {
		path = ./shell;
		description = "Use packages available in nixpkgs";
	    };
	    defaultTemplate = self.tempates.shell;
	};
    };
}
