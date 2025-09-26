{
	programs.nixvim = {
		clipboard = {
			register = "unnamedplus";
			providers.wl-copy.enable = true;
		};
		opts = {
			relativenumber = true;
			number = true;

			tabstop = 2;
			shiftwidth = 2;
			expandtab = true;
			autoindent = true;

			wrap = false;

			ignorecase = true;
			smartcase = true;

			termguicolors = true;
			background = "dark";
			signcolumn = "yes";

			backspace = "indent,eol,start";

			mouse = "a";
			splitbelow = true;
			splitright = true;

			swapfile = false;
		};
	};
}
