# these shebangs are here for reference, do not activate
# /usr/bin/env nix-shell
#  nix-shell --option extra-experimental-features nix-command flakes

{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {

  # packages = [
  #   pkgs.git
  #   pkgs.vim
  #   pkgs.wget
  # ];

  shellHook = ''
    echo "Lets Setup NixOS!"

    echo "--> Setting up partitions.."
    parted /dev/sda -- mklabel msdos
    parted /dev/sda -- mkpart primary 1MB -8GB
    parted /dev/sda -- set 1 boot on
    parted /dev/sda -- mkpart primary linux-swap -8GB 100%

    echo "--> Formatting partitions.."
    mkfs.ext4 -L nixos /dev/sda1
    mkswap -L swap /dev/sda2

    echo "--> Mounting new partitions"
    mount /dev/disk/by-label/nixos /mnt
    swapon /dev/sda2

    echo "--> Creating default config files.."
    nixos-generate-config --root /mnt

    echo "--> DONE!"
    echo "    Run nixos-install when ready"
    echo "    Then: nixos-enter --root /mnt -c '<user>' :to set new user password"
  '';
}
