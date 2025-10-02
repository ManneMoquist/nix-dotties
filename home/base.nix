{ vars, lib, pkgs, config, ... }: {
	programs  = {
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
    btop.enable = true;

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
	};

  home.packages = [
    pkgs.bluetui
  ];
}
