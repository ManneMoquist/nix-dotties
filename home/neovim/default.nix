{inputs,...}:
{
	imports = [
		inputs.nixvim.homeModules.nixvim
		./options.nix
    ./keymaps.nix

    ./plugins/colors.nix
    ./plugins/blink.nix
    ./plugins/conform.nix
    ./plugins/fzf.nix
    ./plugins/treesitter.nix
    ./plugins/lsp.nix
	];
	home.shellAliases.v = "nvim";
	programs.nixvim = {
		enable = true;
		defaultEditor = true;

		nixpkgs.useGlobalPackages = true;
		viAlias = true;
		vimAlias = true;
	};
}
