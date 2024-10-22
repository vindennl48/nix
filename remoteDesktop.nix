# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  ## REMOTE DESKTOP ##
  services.xrdp.enable = true;
  services.xrdp.openFirewall = true;

  ## set these in your GUI module of choice
  # services.xrdp.defaultWindowManager = "startplasma-x11";
  # services.xrdp.defaultWindowManager = "cinnamon";
}
