{
  description = "Home Manager configuration";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      # Each profile is a file in ./profiles/<name>.nix holding per-user
      # settings (home.username, home.homeDirectory, identity, ...).
      # Shared configuration lives in ./home.nix and ./modules.
      mkProfile =
        name:
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [
            ./home.nix
            ./modules
            ./profiles/${name}.nix
          ];

          extraSpecialArgs = {
            inherit name;
          };
        };
    in
    {
      homeConfigurations = {
        aleshka = mkProfile "aleshka";
        asheludchenkov = mkProfile "asheludchenkov";
      };
    };
}
