{ inputs, config, pkgs, ...}:
{
	home.username = "manne";
	home.homeDirectory = "/home/manne";
	home.stateVersion = "25.05";
	programs.home-manager.enable = true;

	imports = [
		./home
	];
}
