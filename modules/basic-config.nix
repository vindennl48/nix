# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  ## PROGRAMS ##
  environment.systemPackages = with pkgs; [
    ## Only set basic programs here to run the OS, custom programs that require
    ## dotfiles should go in home-manager
    # home-manager # set this in the configuration.nix file for your host
    vim
    htop
    wget
    git
    less
    tree
    nh # helper for shortening nix commands
    nvd # helper for comparing nix versions and building new ones
  ];
  programs.zsh.enable = true;
  # programs.firefox.enable = true; # set this in the GUI module

  ## FONTS ##
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "RobotoMono" "FiraCode" "DroidSansMono" ]; })
  ];

  ## SYSTEMD SERVICES ##
  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;

  ## BASICS ##
  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings.LC_ADDRESS = "en_US.UTF-8";
  i18n.extraLocaleSettings.LC_IDENTIFICATION = "en_US.UTF-8";
  i18n.extraLocaleSettings.LC_MEASUREMENT = "en_US.UTF-8";
  i18n.extraLocaleSettings.LC_MONETARY = "en_US.UTF-8";
  i18n.extraLocaleSettings.LC_NAME = "en_US.UTF-8";
  i18n.extraLocaleSettings.LC_NUMERIC = "en_US.UTF-8";
  i18n.extraLocaleSettings.LC_PAPER = "en_US.UTF-8";
  i18n.extraLocaleSettings.LC_TELEPHONE = "en_US.UTF-8";
  i18n.extraLocaleSettings.LC_TIME = "en_US.UTF-8";
  # console.font = "Lat2-Terminus16";
  # console.keyMap = "us";
  # console.useXkbConfig = true; # use xkb.options in tty.

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # DO NOT TOUCH
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true; # allow packages that cost money
  system.stateVersion = "24.05";
}
