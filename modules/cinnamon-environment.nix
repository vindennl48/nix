# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  ## GUI ##
  services.xserver.enable = true;
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.variant = "";
  
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.cinnamon.enable = true;
  services.xrdp.defaultWindowManager = "cinnamon"; # in case we want remote desktop

  programs.firefox.enable = true;
}

