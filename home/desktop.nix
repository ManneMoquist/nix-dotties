{ vars, lib, pkgs, config, ... }: {
	programs = {
	  firefox.enable = true;
    qutebrowser = {
      enable = true;
      settings = {
        editor.command  = [ "ghostty" "-e" "nvim" "-f" "{file}"];
        tabs.position = "right";
      };
    };
    rofi = {
      enable = true;
    };
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
          modules-center = ["sway/window"];
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
    config = with {modKey = "Mod4";}; {
      modifier = modKey;
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
        "type:pointer" = {
          accel_profile = "flat";
        };
      };
      keybindings = lib.mkOptionDefault{
        "XF86MonBrightnessDown" = "exec light -U 10";
        "XF86MonBrightnessUp" = "exec light -A 10";

        # Volume
        "XF86AudioRaiseVolume" = "exec 'pactl set-sink-volume @DEFAULT_SINK@ +5%'";
        "XF86AudioLowerVolume" = "exec 'pactl set-sink-volume @DEFAULT_SINK@ -5%'";
        "XF86AudioMute" = "exec 'pactl set-sink-mute @DEFAULT_SINK@ toggle'";

        "${modKey}+P" = "exec swaylock";
        "${modKey}+X" = "move workspace to output right";
        "${modKey}+d" = "exec rofi -show drun";

        "${modKey}+shift+s" = "exec IMG=~/Pictures/$(date +%Y-%m-%d_%H-%m-%s).png && grim -g \"$(slurp)\" $IMG && wl-copy < $IMG";
      };

      window = {
        titlebar = false;
        hideEdgeBorders = "both";
      };

      floating = {
        titlebar = false;
      };

      fonts = {
        names = ["BlexMono Nerd Font Mono"];
        size = 8.0;
      };

      colors = {
        focused = {
          background = "#282828";
          border = "#d65d03";
          childBorder = "#d65d03";
          indicator = "#cc241d";
          text = "#8ec07c";
        };
        unfocused = {
          background = "#282828";
          border = "#3c3836";
          childBorder = "#3c3836";
          indicator = "#cc241d";
          text = "#8ec07c";
        };
      };
    };
  };

  services = let 
    lock = "${pkgs.swaylock}/bin/swaylock --daemonize";
    notify = msg:"${pkgs.libnotify}/bin/notify-send --expire-time=4000 --category=\"lockwarning\" \"${msg}\"";
    in {
    swayidle = {
      enable = true;
      
      timeouts = [
        {
          timeout = 170;
          command = notify "Locking the screen";
        }
        {
          timeout = 180;
          command = lock;
        }
      ];

      events = [
        {
          event = "before-sleep";
          command = lock;
        }
        {
          event = "lock";
          command = lock;
        }
      ];
    };
    mako = {
      enable = true;
      settings = {
        background-color = "#282828";
        border-color = "#d65d03";

        border-size = 1;
        border-radius = 15;
        font = "monospace 16";

        "category=lockwarning" = {
          font = "monospace 60";
          anchor = "center";
          width = 1080;
          text-alignment="center";
        };
      };
    };
  };


  home = {
    packages = [
      pkgs.nerd-fonts.blex-mono
      pkgs.wdisplays
      pkgs.kanshi
      pkgs.pulseaudio
      pkgs.google-chrome
      pkgs.libnotify
      pkgs.audacity
      pkgs.gimp
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
