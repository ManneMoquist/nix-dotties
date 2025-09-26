{
  programs.nixvim = {
    plugins.conform-nvim = {
      enable = true;
      autoInstall.enable = true;
      settings = {
        formatters_by_ft = {
          javascript = ["prettier"];
          typescript = ["prettier"];
          javascriptreact = ["prettier"];
          typescriptreact = ["prettier"];
          html = ["prettier"];
          css = ["prettier"];

          nix = ["nixfmt"];
        };
      };
    };
  };
}
