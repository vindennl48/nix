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
      ./../../gui-environment.nix
      ./../../networking.nix
    ];

  networking.hostName = "nix-hp-8440p"; # has to be included

  # basic-config
  isHeadless.enable = false;
  isBootDos.enable = true;

  # audio
  reaper.enable = false;
  carla.enable = false;

  # GUI
  plasma.enable = false;
  cinnamon.enable = false;

  # Networking
  networking.enable = false; # set to false if using cinnamon GUI
}

