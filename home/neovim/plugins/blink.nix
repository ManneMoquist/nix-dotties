{
	programs.nixvim = {
    plugins.blink-cmp = {
      enable = true;
      settings = {
        keymap.preset = "super-tab";
        appearance.use_nvim_cmp_as_default = true;

        completion.documentation.auto_show = true;
      };
    };
  };
}
