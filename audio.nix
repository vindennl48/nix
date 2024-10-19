# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  options = {
    reaper.enable = lib.mkEnableOption "Enables Reaper";
    carla.enable = lib.mkEnableOption "Enables Carla";
  };

  configReaper = lib.mkIf config.reaper.enable {
    environment.systemPackages = with pkgs; [
      reaper # audio DAW
    ];
  };

  configCarla = lib.mkIf config.carla.enable {
    environment.systemPackages = with pkgs; [
      carla # can run VSTs without a DAW
    ];
  };

  config = {
    ## PROGRAMS ##
    environment.systemPackages = with pkgs; [
      qjackctl # GUI for controlling jack connections
    ];

    ## AUDIO ##
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true; # allow realtime audio
    services.pipewire.enable = true;
    services.pipewire.alsa.enable = true;
    services.pipewire.alsa.support32Bit = true;
    services.pipewire.pulse.enable = true;
    services.pipewire.jack.enable = true;
  };
}

