# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  ## GUI ##
  services.xserver.enable = true;
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.variant = "";
  ## This is to start at CLI prompt instead of going to login screen
  # services.xserver.displayManager.startx.enable = true;
  
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.windowManager.dwm.enable = true;
  services.xserver.windowManager.dwm.package = pkgs.dwm.overrideAttrs {
    src = ~/.config/suck/dwm;
  };

  programs.firefox.enable = true;
}

