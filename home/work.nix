{ vars, lib, pkgs, config, ... }: {
  wayland.windowManager.sway.config = {
    startup = [
      {command = "slack";}
    ];
    assigns = {
      "4" = [{ class = "^.*Slack$"; }];
    };
  };

	home = {
		packages = [
      # for social
			pkgs.slack

      # for dev, probably will never use outside of work
      pkgs.overmind
		];
		sessionVariables = {
			NIXOS_OZONE_WL = "1";
		};
	};
}
