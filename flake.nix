{
  description = "Just to create a lock file";

  inputs = {
    # nixpkgsUnstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    # nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.05";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    ## DARWIN/MAC ##
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, nix-homebrew }:
  {
    nixosConfigurations."nix-hp-8440p" = nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/hp-8440p/configuration.nix
      ];
    };

    nixosConfigurations."nix-vm1" = nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/nix-vm1/configuration.nix
      ];
    };

    nixosConfigurations."nixhyper" = nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/nixhyper/configuration.nix
      ];
    };

    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."macnix" = nix-darwin.lib.darwinSystem {
      specialArgs = {
        inherit self; 
        inherit nix-homebrew;
      };
      modules = [
        ./hosts/macnix/configuration.nix
      ];
    };
  };
}
