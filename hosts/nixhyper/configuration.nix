# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./../../modules/audio.nix
      ./../../modules/basic-config.nix
      # ./../../modules/boot-dos.nix
      # ./../../modules/cinnamon-environment.nix
      # ./../../dwm-environment.nix
      # ./../../modules/networkManager.nix
      ./../../modules/openssh.nix
      ./../../modules/plasma-environment.nix
      ./../../modules/remoteDesktop.nix
      # ./../../modules/user-mitch.nix
      ./../../modules/user-nixhyper.nix
    ];

  ## HOST NAME ##
  networking.hostName = "nixhyper"; # has to be included

  ## HOST SPECIFIC PROGRAMS ##
  environment.systemPackages = with pkgs; [
    home-manager
    spice spice-gtk spice-protocol spice-vdagent
    virt-manager virt-viewer win-virtio win-spice pciutils virtiofsd
    looking-glass-client
  ];

  # Environment Variables
  environment.variables = {
    # EXAMPLE_VAR = true;
  };

  ## libvirt and virt-manager
  # programs.virt-manager.enable = true; # Install virt-manager
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.qemu.swtpm.enable = true;
  virtualisation.libvirtd.qemu.ovmf.enable = true;
  virtualisation.libvirtd.qemu.ovmf.packages = [ pkgs.OVMFFull.fd ];
  virtualisation.spiceUSBRedirection.enable = true;
  services.spice-vdagentd.enable = true;

  # shim for looking-glass to work
  systemd.tmpfiles.rules = [
    "f /dev/shm/looking-glass 0660 nixhyper qemu-libvirtd -"
    "f /dev/shm/looking-glass 0660 nixhyper kvm -"
  ];

  # Network Bridge Setup
  systemd.network = {
    enable = true;
    wait-online.enable = false;
    netdevs = {
      "1-br0" = {
        enable = true;
        netdevConfig = {
          Name = "br0";
          Kind = "bridge";
        };
      };
    };
    networks = {
      "2-br0-bind" = {
        matchConfig.Name = "enp6s0";
        networkConfig.Bridge = "br0";
      };
      "3-br0-dhcp" = {
        matchConfig.Name = "br0";
        networkConfig.DHCP = "ipv4";
      };
      "20-wlan" = {
        matchConfig.Name = "wl*";
        linkConfig.RequiredForOnline = "routable";
        networkConfig.DHCP = "yes";
        networkConfig.MulticastDNS = "yes";
      };
    };
  };

  networking.networkmanager.enable = true;
  networking.networkmanager.unmanaged = [ "br0" ];
  networking.firewall.allowedTCPPorts = [ 22 8000 5901 ];

  # Additional Hardware Setup
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true; # bluetooth GUI

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [
      "intel_iommu=on"
      "iommu=pt"
      "pcie_aspm=off"
      ''vfio-pci.ids="10de:2705,10de:22bb"''
  ];
  boot.kernelModules = [ "kvm-intel" ];

  boot.initrd.availableKernelModules = [ "nvidiafb" "vfio-pci" ];
  boot.initrd.preDeviceCommands = ''
    DEVS="0000:01:00.0 0000:01:00.1"
    for DEV in $DEVS; do
      echo "vfio-pci" > /sys/bus/pci/devices/$DEV/driver_override
    done
    modprobe -i vfio-pci
  '';
}

