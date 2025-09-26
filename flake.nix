{
	description = "manne-dotfiles";
	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
		nixpkgs-stable.url = "nixpkgs/nixos-25.05";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nixvim = {
			url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, nixpkgs-stable, home-manager, nixvim, ...}@inputs: {
		nixosConfigurations = {
			onua = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [ 
					./configuration.nix
					home-manager.nixosModules.home-manager {
						home-manager = {
							extraSpecialArgs = {inherit inputs; };
							useGlobalPkgs = true;
							useUserPackages = true;
							users.manne = import ./home.nix;
							backupFileExtension = "bkup";
						};
					}
				];
			};
		};
	};
}
