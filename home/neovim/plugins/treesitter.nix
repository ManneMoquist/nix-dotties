{
  programs.nixvim = {
    dependencies.gcc.enable = true;
    plugins.treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
    };
  };
}
