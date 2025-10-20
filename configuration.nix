{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking = {
    hostName = "onua"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    networkmanager.enable = true;
    hosts = {
      "127.0.0.1" = [
        "se.readly.test"
        "de.readly.test"
        "gb.readly.test"
        "go.readly.test"
      ];
    };
  };

  # Set your time zone.
  time.timeZone = "Europe/Stockholm";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "sv_SE.UTF-8";
      LC_IDENTIFICATION = "sv_SE.UTF-8";
      LC_MEASUREMENT = "sv_SE.UTF-8";
      LC_MONETARY = "sv_SE.UTF-8";
      LC_NAME = "sv_SE.UTF-8";
      LC_NUMERIC = "sv_SE.UTF-8";
      LC_PAPER = "sv_SE.UTF-8";
      LC_TELEPHONE = "sv_SE.UTF-8";
      LC_TIME = "sv_SE.UTF-8";
    };
  };

  # Configure keymap in X11


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.manne = {
    isNormalUser = true;
    description = "manne";
    extraGroups = [ "networkmanager" "wheel" "video" "docker"];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;
  environment.etc = {
    "1password/custom_allowed_browsers" = {
      text = ''
      firefox
      '';
      mode = "0755";
    };
  };

  environment.systemPackages = with pkgs; [
    wget

    grim
    slurp
    wl-clipboard
  ];

  services = {
    gnome.gnome-keyring.enable = true;
    xserver = {
      xkb = {
        layout = "us";
        variant = "";
        options = "caps:escape";
      };
      videoDrivers = ["nvidia"];
    };
    displayManager.ly = {
      enable = true;
      settings = {
        animation = "colormix";
        colormix_col1 = "0x00fe8019";
        colormix_col2 = "0x00fb4934";
        colormix_col3 = "0x00928374";
      };
    };
    tailscale = {
      enable = true;
      useRoutingFeatures = "both";
    };
  };

  hardware = {
    bluetooth.enable = true;
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = false;
      nvidiaSettings = true;
      open = true;
    };
  };

  system.stateVersion = "25.05"; # Did you read the comment?
  systemd.services.fprintd = {
    wantedBy = [ "multi-user.target" ];
    serviceConfig.Type = "simple";
  };


  nix.settings.experimental-features = ["nix-command" "flakes"];
  # needed for sway
  security.polkit.enable = true;
  programs = {
    _1password.enable = true;
    _1password-gui.enable = true;
    zsh.enable = true;
    sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };
  };

  virtualisation = {
    docker.enable = true;
  };
}

