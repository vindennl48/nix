{
  description = "Just to create a lock file";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.05";
  };

  outputs = { self, nixpkgs }:
  {
    nixosConfigurations.nix-hp-8440p = nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/hp-8440p/configuration.nix
      ];
    };

    nixosConfigurations.nix-vm1 = nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/nix-vm1/configuration.nix
      ];
    };
  };
}
