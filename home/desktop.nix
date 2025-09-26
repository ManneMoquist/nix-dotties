{ vars, lib, pkgs, config, ... }: {
	programs.ghostty.enable = true;
	programs.firefox.enable = true;
	
	wayland.windowManager.sway = {
		enable = true;
		config = rec {
			modifier = "Mod4";
			terminal = "ghostty";
		};
	};
	home.pointerCursor = {
		gtk.enable = true;
		package = pkgs.bibata-cursors;
		name = "Bibata-Modern-Ice";
		size = 22;
	};
}
