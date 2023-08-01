{
  description = "My system config flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

  };


  outputs = { nixpkgs, home-manager, ... }:
  let
     system = "x86_64-linux";

     pkgs = import nixpkgs {
        inherit system;
	config = { allowUnfree = true; };
     };

     lib = nixpkgs.lib;

  in {
     homeManagerConfigurations = {
      tmarcinek = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
	 modules = [ 
	 ./users/tmarcinek/home.nix
	 {
	   home = {
	      username = "tmarcinek";
	      homeDirectory = "/home/tmarcinek";
	      stateVersion = "23.05";
	      };
	 }
	   ];
	 };
       };
     
     nixosConfigurations = { 
      nixos = lib.nixosSystem { 
        inherit system;

	modules = [ 
           ./system/configuration.nix
	];
      };

     };
  };
}
