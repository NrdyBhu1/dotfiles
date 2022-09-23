# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }: 
# let
# 	dbus-sway-environment = pkgs.writeTextFile {
# 		name = "dbus-sway-environment";
# 		destination = "/bin/dbus-sway-environment";
# 		executable = true;
# 
# 		text = ''
# 		dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway
# 		systemctl --user stop pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
# 		systemctl --user start pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
# 		'';
# 	};
# 
# 	configure-gtk = pkgs.writeTextFile {
# 		name = "configure-gtk";
# 		destination = "/bin/configure-gtk";
# 		executable = true;
# 		text = let
# 			schema = pkgs.gsettings-desktop-schemas;
# 			datadir = "${schema}/share/gsettings-schemas/${schema.name}";
# 		in ''
# 		export XDG_DATA_DIRS="${datadir}:$XDG_DATA_DIRS"
# 		gnome_schema=org.gnome.desktop.interface
# 		gsettings set $gnome_schema icon-theme 'Papirus-Dark'
# 		gsettings set $gnome_schema gtk-theme 'Orchis-Dark-Compact'
# 		gsettings set $gnome_schema cursor-theme 'Capitaine Cursors'
# 		'';
# 	};
# in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./xserver.nix
      ./services.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN.utf8";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nrdybhu1 = {
    isNormalUser = true;
    description = "nrdybhu1";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
	# sway
	# dbus-sway-enviroment
	# configure-gtk
	glib

    # window manager stuff
    waybar
    slurp
    wl-clipboard
    bemenu
    dwl
    wayfire
    wcm
    appimage-run
    # steam-run

    # libraries
    # gtk3
    # gtk4
    # cairo
    # gobject-introspection
    # pkgconfig
    # alsa-lib
    # udev
    # xlibsWrapper
    # xorg.libXcursor
    # xorg.libXrandr
    # xorg.libXi
    # vulkan-tools
    # vulkan-headers
    # vulkan-loader
    # vulkan-validation-layers
    # libinput
    # libappindicator
    patchelf
    
    # programming stuff
    dialog
    nodejs
    alacritty
    python310
    python310Packages.pip
    python310Packages.tkinter
    tk
    git
    emacs
    vscode
    silver-searcher
    ripgrep
    fzf

    # other
    capitaine-cursors
    orchis-theme
    papirus-icon-theme
    tela-icon-theme
    plata-theme
    fff
    grim
    spotify
    spotify-tray
    irssi

    # A/V stuff
    ffmpeg
    ffcast
    imagemagick
    cava
    mpd
    mpc-cli
    playerctl
    mpv
    feh
    pulseaudio
    brave
    google-chrome
    teams
    zathura
    gimp
    trash-cli
    wine
    playonlinux
    neovim
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    firefox
    noisetorch
    p7zip
  ];

  # started in user sessions.
  # programs.mtr.enable = true;
  # List services that you want to enable:

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leavecatenate(variables, "bootdev", bootdev)
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}
