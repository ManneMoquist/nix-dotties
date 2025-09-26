{ vars, lib, pkgs, config, ... }: {
	programs  = {
		git.enable = true;
		# neovim.enable = true;

		zsh = {
			enable = true;
			enableCompletion = true;
			syntaxHighlighting.enable = true;
			shellAliases = {
				ll = "ls =l";
			};
			history.size = 10000;
		};
		direnv.enable = true;
	};
}
