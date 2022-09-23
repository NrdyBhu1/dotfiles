{ lib, pkgs, config, ... }:
with lib;
let
	cfg = config.services.xdgPortal;
in {
	options.services.xdgPortal = {
		enable = mkEnableOption "xdgPortal service";
	};

	config = mkIf cfg.enable {
		systemd.services.xdgPortal = {
			description = "Portal service (wlroots implementation)";
			partOf = [ "graphical-session.target" ];
			after = [ "graphical-session.target" ];
			wantedBy = [ "multi-user.target" ];

			serviceConfig = {
				ExecStart = "${pkgs.xdg-desktop-portal-wlr}/libexec/xdg-desktop-portal-wlr";
				Restart = "on-failure";
			};
		};
	};
}
