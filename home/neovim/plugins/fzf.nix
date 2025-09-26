{
  programs.nixvim = {
    dependencies.fzf.enable = true;
    plugins.fzf-lua = {
      enable = true; 
      keymaps = {
        "<leader>ff" = "files";
        "<leader>fg" = "live_grep";
        "<leader>fb" = "buffers";
        "<leader>fd" = "lsp_workspace_diagnostics";
        "<leader>fc" = "builtin";
        "<leader>fl" = "lsp_finder";
      }; 
    };
  };
}
