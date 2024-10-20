# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./../../basic-config.nix
      ./../../audio.nix
      ./../../boot-dos.nix
      # ./../../networkManager.nix
      ./../../cinnamon-environment.nix
      # ./../../dwm-environment.nix
    ];

  ## HOST NAME ##
  networking.hostName = "nix-hp-8440p"; # has to be included

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

