{
    description = "Collection of custom project templates";

    outputs = { self, ... }: {
	templates = {
	    golang = {
		path = ./golang;
		description = "Create a generic golang development environment";
	    };
	    rust = {
		path = ./rust;
		description = "Create a generic rust development environment";
	    };

	    python = {
		path = ./python;
		description = "Create a generic python development environment";
	    };
	    
	    shell = {
		path = ./shell;
		description = "Default template";
	    };
	    react = {
		path = ./react;
		description = "Web development template";
	    };
	};
    };
}
