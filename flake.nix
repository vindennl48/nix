{
  description = "Just to create a lock file";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.05";
  };

  outputs = { self, nixpkgs }:
  {
    nixosConfigurations.nixos-hp = nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/hp-8440p/configuration.nix
      ];
    };
  };
}
