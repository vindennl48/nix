# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  ## PROGRAMS ##
  environment.systemPackages = with pkgs; [
    qjackctl # GUI for controlling jack connections
    # reaper # audio DAW
    # carla # can run VSTs without a DAW
  ];

  ## AUDIO ##
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true; # allow realtime audio
  services.pipewire.enable = true;
  services.pipewire.alsa.enable = true;
  services.pipewire.alsa.support32Bit = true;
  services.pipewire.pulse.enable = true;
  services.pipewire.jack.enable = true;
}
