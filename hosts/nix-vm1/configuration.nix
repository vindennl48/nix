# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # ./../../modules/audio.nix
      ./../../modules/basic-config.nix
      ./../../modules/boot-dos.nix
      ./../../modules/cinnamon-environment.nix
      # ./../../dwm-environment.nix
      # ./../../modules/networkManager.nix
      # ./../../modules/plasma-environment.nix
      ./../../modules/remoteDesktop.nix
    ];

  ## HOST NAME ##
  networking.hostName = "nix-vm1"; # has to be included

  ## HOST SPECIFIC PROGRAMS ##
  environment.systemPackages = with pkgs; [
    home-manager
  ];

  # # trying to activate x11 serivces
  # services.xserver.enable = true;
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.variant = "";
  # services.xserver.displayManager.startx.enable = true;
}

