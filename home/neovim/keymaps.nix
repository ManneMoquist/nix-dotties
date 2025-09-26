{
	programs.nixvim = {
    globals.mapleader = " ";
    keymaps = [
      {
        mode = [ "n" ""];
        key = ";";
        action = ":";
      }
      {
        mode = [ "n" ""];
        key = ":";
        action = ";";
      }

      {
        mode = ["n" ""];
        key = "<leader>nh";
        action = ":nohl<CR>";
      }
      {
        mode = ["n" ""];
        key = "<leader>ee";
        action = ":Explore<CR>";
      }
    ];
  };
}
