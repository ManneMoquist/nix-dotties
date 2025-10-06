{ vars, lib, pkgs, config, ... }: {
	programs = {
	  firefox.enable = true;
    ghostty = {
      enable = true;
      settings = {
        theme = "Gruvbox Dark";
        font-family = "BlexMono Nerd Font Mono";
        font-size = 16;
      };
    };

    waybar = {
      enable = true;
      settings = { 
        mainBar = {
          position = "top";
          modules-left = ["sway/workspaces" "sway/mode"];
          modules-right = ["sway/language" "pulseaudio" "network" "battery" "clock"];

          network = {
            format-wifi = "{essid}";
          };

          battery = {
            format = "{capacity} {icon}";
            format-icons = ["" "" "" "" ""];
          };
        };
      };
    };
    swaylock = {
      enable = true;
      settings = {
        color = "363836";
      };
    };
  };

  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = "Mod4";
      terminal = "ghostty";
      bars = [
        {
          command = "waybar";
        }
      ];
      input = {
        "*" = {
          xkb_layout = "us,se";
          xkb_options = "grp:win_space_toggle,caps:escape";
        };
      };
      keybindings = lib.mkOptionDefault{
        "XF86MonBrightnessDown" = "exec light -U 10";
        "XF86MonBrightnessUp" = "exec light -A 10";

        # Volume
        "XF86AudioRaiseVolume" = "exec 'pactl set-sink-volume @DEFAULT_SINK@ +5%'";
        "XF86AudioLowerVolume" = "exec 'pactl set-sink-volume @DEFAULT_SINK@ -5%'";
        "XF86AudioMute" = "exec 'pactl set-sink-mute @DEFAULT_SINK@ toggle'";

        "Mod4+P" = "exec swaylock";
        "Mod4+X" = "move workspace to output right";
      };

      window = {
        titlebar = false;
      };
    };
  };

  services = {
    swayidle = {
      enable = true;

      events = [
        {
          event = "before-sleep";
          command = "swaylock";
        }
      ];
    };
    dunst.enable = true;
  };


  home = {
    packages = [
      pkgs.nerd-fonts.blex-mono
      pkgs.wdisplays
      pkgs.kanshi
      pkgs.pulseaudio
      pkgs.google-chrome
      pkgs.libnotify
    ];


    pointerCursor = {
      gtk.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 22;
    };
  };

  xdg.configFile."waybar/style.css".source = ./waybar/style.css;
}
