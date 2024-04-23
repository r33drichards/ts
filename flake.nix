{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-23.11";
    flakery.url = "github:getflakery/flakes";
  };

  outputs = { self, nixpkgs, flakery }: {
    nixosConfigurations.hello-flakery = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        flakery.nixosModules.flakery
        ./configuration.nix
      ];
    };
  };
}