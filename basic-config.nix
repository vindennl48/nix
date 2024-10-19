# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  options = {
    isHeadless.enable = lib.mkEnableOption "Enables Headless Mode";
    isBootDos.enable = lib.mkEnableOption "Enables Dos Boot Mode";
    isBootUEFI.enable = lib.mkEnableOption "Enables UEFI Boot Mode";
  };

  configHeadless = lib.mkIf (config.isHeadless.enable == false) {
    programs.firefox.enable = true;
  };

  configBootDos = lib.mkIf config.isBootDos.enable {
    ## BOOTLOADER ##
    # Use the GRUB 2 boot loader.
    boot.loader.grub.enable = true;
    # boot.loader.grub.efiSupport = true;
    # boot.loader.grub.efiInstallAsRemovable = true;
    # boot.loader.efi.efiSysMountPoint = "/boot/efi";
    # Define on which hard drive you want to install Grub.
    boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only
  };

  configBootUEFI = lib.mkIf config.isBootUEFI.enable {
    # need to configure still

    ## BOOTLOADER ##
    # Use the GRUB 2 boot loader.
    # boot.loader.grub.enable = true;
    # boot.loader.grub.efiSupport = true;
    # boot.loader.grub.efiInstallAsRemovable = true;
    # boot.loader.efi.efiSysMountPoint = "/boot/efi";
    # Define on which hard drive you want to install Grub.
    # boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only
  };

  config = {
    ## PROGRAMS ##
    environment.systemPackages = with pkgs; [
      neovim
      wget
      git
      nh
    ];

    ## USERS ##
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.mitch = {
      isNormalUser = true;
      extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
      packages = with pkgs; [
      ];
    };

    ## SYSTEMD SERVICES ##
    systemd.targets.sleep.enable = false;
    systemd.targets.suspend.enable = false;
    systemd.targets.hibernate.enable = false;
    systemd.targets.hybrid-sleep.enable = false;

    ## BASICS ##
    # Set your time zone.
    time.timeZone = "America/New_York";

    # allow packages that cost money
    nixpkgs.config.allowUnfree = true;

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
    nix.settings.experimental-features = [ "flakes" ];
    system.stateVersion = "24.05";
  };
}

