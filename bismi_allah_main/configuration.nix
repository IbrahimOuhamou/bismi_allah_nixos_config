# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, audio, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  users.extraUsers.ibrahimo.extraGroups = ["audio"];

  networking.hostName = "ibrahimo"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = pkgs.lib.mkForce false;

  # Set your time zone.
  time.timeZone = "Africa/Casablanca";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ar_MA.UTF-8";
    LC_IDENTIFICATION = "ar_MA.UTF-8";
    LC_MEASUREMENT = "ar_MA.UTF-8";
    LC_MONETARY = "ar_MA.UTF-8";
    LC_NAME = "ar_MA.UTF-8";
    LC_NUMERIC = "ar_MA.UTF-8";
    LC_PAPER = "ar_MA.UTF-8";
    LC_TELEPHONE = "ar_MA.UTF-8";
    LC_TIME = "ar_MA.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

#Sound
hardware.pulseaudio.package = pkgs.pulseaudioFull; # support for bluetooth headsets
hardware.pulseaudio.enable = true;
hardware.pulseaudio.support32Bit = true;    ## If compatibility with 32-bit applications is desired.
nixpkgs.config.pulseaudio = true;
hardware.bluetooth.enable = true;

# Enable the X11 windowing system
services.xserver.enable = true;
services.xserver.displayManager.gdm.enable = true;
services.xserver.desktopManager.gnome.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ibrahimo = {
    isNormalUser = true;
    description = "Ibrahim Ouhamou";
    extraGroups = [ "networkmanager" "wheel" "audio" "libvirtd"];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  neovim
  git
  tmux
  #  wget

  #programming
  libgcc
  gcc
  gnumake
  pkg-config
  gdb
  clang
  llvmPackages_9.clang-unwrapped
  #conan
  yasm
  #python3
  #(python311.withPackages(ps: with ps; [ tkinter ]))
  (pkgs.python3.withPackages (python-pkgs: [ python-pkgs.tkinter ]))
  #python311Packages.pip
  #python311Packages.tkinter
  #pip

  #libraries
  #SDL2
  #SDL2_ttf

  #building and testing
  qemu

  #cyber
  nmap
  ipscan

  #desktop
  brightnessctl
  waybar
  pcmanfm
  
  #apps
  chromium #web browser
  gimp
  discord
  telegram-desktop
  #bismi Allah
  gparted

];

fonts.packages = with pkgs; [
  font-awesome
];

programs.sway.enable = true;
xdg.portal.wlr.enable = true;

#bar
programs.waybar.enable = true;

programs.neovim = {
  enable = true;
  defaultEditor = true;
};

programs.tmux.enable = true;

programs.steam.enable = true;

#for gparted to work by the will of Allah
#security.polkit.enable = true;

#c dev
#nixpkgs.nativeBuildInput = [ pkgs.pkg-config ];
#nixpkgs.mkDerivation.nativeBuildInput = [ pkgs.pkg-config ];

#with import <nixpkgs> {};
#nixpkgs.stdenv.mkDerivation.name = "env";
#stdenv.mkDerivation {
#  name = "env";
#  nativeBuildInputs = [ pkg-config ];
#  buildInputs = [
#    cryptsetup
#  ];
#}

#virtualisation
virtualisation.libvirtd.enable = true;
programs.virt-manager.enable = true;
services.qemuGuest.enable = true;
#users.users.ibrahimo.extraGroups = ["libvirtd"];

#virtualisation.virtualbox.host.enable = true;
#virtualisation.virtualbox.host.enableExtensionPack = true;
#users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];
#programs.virtualbox.enable = true;


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

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
  system.stateVersion = "23.11"; # Did you read the comment?

}
