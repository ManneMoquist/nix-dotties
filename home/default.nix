{ inputs, config, pkgs, ...}:
{
	imports = [
		./neovim
		./base.nix
		./work.nix
		./desktop.nix
    ./dev.nix
	];
}
