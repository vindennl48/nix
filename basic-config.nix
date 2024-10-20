# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  ## PROGRAMS ##
  environment.systemPackages = with pkgs; [
    # home-manager
    # vim
    neovim gcc nodejs yarn xclip
    htop
    fzf
    alacritty
    wget
    git
    nh # helper for shortening nix commands
    nvd # helper for comparing nix versions and building new ones
  ];
  programs.zsh.enable = true;
  # programs.firefox.enable = true; # set this in the GUI module

  ## USERS ##
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mitch = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
    ];
    shell = pkgs.zsh;
  };

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
