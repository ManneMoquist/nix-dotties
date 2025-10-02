{ inputs, config, pkgs, ...}:
{
  xdg.enable = true;
	imports = [
		./neovim
		./base.nix
		./work.nix
		./desktop.nix
    ./dev.nix
	];
}
