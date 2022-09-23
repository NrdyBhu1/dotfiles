{ config, pkgs, lib, ... }: 
{
	imports = [
		./xdgPortal.nix
	];

	#############################################
	#                 Services                  #
	#############################################

	# Enable the OpenSSH daemon.
	services.openssh.enable = true;

	# dbus & xdg-portal
	services.dbus.enable = true;
	xdg.portal = {
		enable = true;
		wlr.enable = true;
		extraPortals = with pkgs; [ xdg-desktop-portal-wlr ];
		gtkUsePortal = true;
	};

	# Enable CUPS to print documents.
	services.printing.enable = true;
	services.mysql.enable = true;
	services.mysql.package = pkgs.mariadb;
	services.clamav = {
		daemon.enable = true;
		updater.enable = true;
	};
	# Enable sound with pipewire.
	sound.enable = true;
	hardware.pulseaudio.enable = false;
	hardware.opengl.enable = true;
	hardware.steam-hardware.enable = true;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		# If you want to use JACK applications, uncomment this
		jack.enable = true;

		# use the example session manager (no others are packaged yet so this is enabled by default,
		# no need to redefine it in your config for now)
		# media-session.enable = true;
	};
	# services.greetd = {
	#	enable = true;
	#	settings = {
	#			default_session = {
	#					command = "${pkgs.greetd.greetd}/bin/agreety --cmd sway";
	#		    };
	#	};
	# };

	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	# virtualisation
	# virtualisation.virtualbox.host.enable = true;
	# virtualisation.virtualbox.host.enableExtensionPack = true;
	# virtualisation.docker.enable = true;
	# virtualisation.docker.rootless.enable = true;

	###############################
	#   xdg-desktop-portal-wlr    #
	###############################
	services.xdgPortal.enable = true;

	###############################
	#          Programs           #
	###############################

	programs.gnupg.agent = {
		enable = true;
		enableSSHSupport = true;
	};
	programs.ssh.forwardX11 = true;
	programs.sway = {
		enable = true;
			extraPackages = with pkgs; [
			swaylock
			swayidle
			wl-clipboard
			wf-recorder
			mako # notification daemon
			grim
			kanshi
			slurp
			bemenu
			foot
		];
		wrapperFeatures.gtk = true;
		extraSessionCommands = ''
		export SDL_VIDEODRIVER=wayland
		export QT_QPA_PLATFORM=wayland
		export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
		export _JAVA_AWT_WM_NONREPARENTING=1
		export MOZ_ENABLE_WAYLAND=1
		'';
	};

	programs.xwayland.enable = true;
	programs.dconf.enable = true;
	# programs.steam.enable = true;
}
