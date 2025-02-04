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
      # ./../../modules/cinnamon-environment.nix
      # ./../../dwm-environment.nix
      # ./../../modules/networkManager.nix # dont need with cinnamon
      ./../../modules/openssh.nix
      ./../../modules/plasma-environment.nix
      ./../../modules/remoteDesktop.nix
      ./../../modules/user-mitch.nix
      # ./../../modules/user-nixhyper.nix
      ./../../modules/nvidia.nix
    ];

  ## HOST NAME ##
  networking.hostName = "nix-vm1"; # has to be included

  ## HOST SPECIFIC PROGRAMS ##
  environment.systemPackages = with pkgs; [
    home-manager
  ];
}
