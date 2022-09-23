{ config, pkgs, ... }:
{
	services.xserver = {
		videoDrivers = [ "nvidia" ];
		libinput.enable = true;
		enable = true;
		layout = "us";
		xkbVariant = "";
		displayManager = {
			autoLogin = {
				enable = true;
				user = "nrdybhu1";
			};
			defaultSession = "sway";
		};
		desktopManager = {
			gnome.enable = true;
		};
	};
}
