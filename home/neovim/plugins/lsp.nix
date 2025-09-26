{
  programs.nixvim = {
    lsp = {
      inlayHints.enable = true;
      keymaps = [
        {
          key = "gD";
          lspBufAction = "declaration";
        }
        {
          key = "<leader>ca";
          lspBufAction = "code_action";
        }
        {
          key = "<leader>rn";
          lspBufAction = "rename";
        }
        {
          key = "K";
          lspBufAction = "hover";
        }
      ];
    };
    plugins.lsp = {
      enable = true;
      servers = {
        nil_ls.enable = true;
        gopls.enable = true;
        tailwindcss.enable = true;
        ts_ls.enable = true;
        terraformls.enable = true;
      };
    };
  };
}
