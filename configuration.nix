# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  boot.kernelPackages = pkgs.linuxPackages_latest;
  
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];


fonts.fonts = with pkgs; [
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  liberation_ttf
  fira-code
  fira-code-symbols
  mplus-outline-fonts.githubRelease
  dina-font
  proggyfonts
  nerdfonts
];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Rome";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };



  # Configure keymap in X11
  services.xserver = {
    layout = "it";
    xkbVariant = "";
  };


xdg.mime.defaultApplications = {
"application/pdf" = "sioyek.desktop";
"image/png" = "imv.desktop";
};


programs.sway.enable = true;
programs.zsh.enable = true;
programs.fish.enable = true;

  # Configure console keymap
  console.keyMap = "it";

  users.defaultUserShell = pkgs.zsh;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.soliprem = {
    isNormalUser = true;
    description = "Francesco Prem Solidoro";
    extraGroups = [ "networkmanager" "wheel" "adisbladis"];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.shells = with pkgs; [ zsh ];
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
	neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
	wget
	git
	firefox
	sc-im
	libreoffice-fresh
	dpkg
	musescore
	font-awesome
	glib
	glibc
	gsettings-desktop-schemas
	zathura
	sxiv
	texlive.combined.scheme-full
	falkon
	pandoc
	btop
	psmisc
	libnotify
	openvpn
	ripgrep
	neomutt
	transgui
	transmission
	qbittorrent
	nchat
	lutris
	bat
	marksman
	wayshot
	slurp
	libstdcxx5
	wl-clipboard
	sioyek
	taisei
	exa
	shfmt
	shellcheck
	swaybg
	networkmanagerapplet
	networkmanager-openvpn
	neofetch
	river
	gnome.dconf-editor
	xdg-utils
	imv
	waybar
	fzf
	wpgtk
	# bibata-extra-cursors
	bibata-cursors
	whatsapp-for-linux
	rofi-wayland
	protonvpn-gui
	luajitPackages.luarocks-nix
	python3Packages.pip
	python3Packages.numpy
	julia
	go
	cargo
	tree-sitter
	nodejs
	mako
	btop
	xdragon
	fd
	htop
	rofi-calc
	thunderbird
	zsh-autosuggestions
	zsh-syntax-highlighting
	xwayland
	discord
	xournalpp
	krita
	tdesktop
	python310Packages.flake8
	wlsunset
	python3
	R
	lua
	gcc
	pcmanfm
	foot
	pamixer
	brightnessctl
	mpd
	mpc-cli
	ncmpcpp
	wlogout
  ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

hardware.bluetooth.enable = true;
services.blueman.enable = true;

# Enable the OpenSSH daemon.
  services.openssh.enable = true;

# pipewire
  security.rtkit.enable = true;
  services.pipewire = {
	  enable = true;
	  alsa.enable = true;
	  alsa.support32Bit = true;
	  pulse.enable = true;
# If you want to use JACK applications, uncomment this
# jack.enable = true;
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}
