{ vars, lib, pkgs, config, ... }: {
	home = {
		packages = [
			pkgs.slack
		];
		sessionVariables = {
			NIXOS_OZONE_WL = "1";
		};
	};
}
