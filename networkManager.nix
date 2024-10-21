# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  ## NETWORKING ##
  # Must define your own hostName
  # networking.hostName = "nixos-hp"; # Define your hostname.

  ## Pick only one of the below networking options.

  # option 1:
  # Make sure to create the /etc/wpa_supplicant.conf file for the wifi network
  # example: wpa_passphrase <wifi name> <wifi password> > /etc/wpa_supplicant.conf
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # option 2:
  # This option needs to be turned off if we are using cinnamon; it uses its own thing
  # should be used for plasma
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
