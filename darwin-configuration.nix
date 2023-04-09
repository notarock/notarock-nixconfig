{ config, pkgs, inputs, lib, ... }:

{
  nix.nixPath = [ "nixpkgs=${pkgs.path}" ];

  imports = [ ./core/enableFlake.nix ./core/systemPackages.nix ];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [ pkgs.vim ];

  fonts = {
    fontDir = { enable = true; };
    fonts = with pkgs; [
      nerdfonts
      dejavu_fonts
      open-sans
      font-awesome
      ibm-plex
    ];
  };

  environment.variables = { EDITOR = "vim"; };

  programs.zsh.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Homebrew integration
  homebrew = {
    enable = true;
    brewPrefix = "/usr/local/bin";
    brews = [ ];
    onActivation = {
      cleanup = "zap";
      upgrade = true;
    };
    taps = [ "homebrew/cask" "homebrew/cask-drivers" ];
    casks = [
      "steam"
      "raycast"
      "1password"
      "discord"
      "spotify"
      "slack"
      "kitty"
      "rectangle"
      "firefox"
      "google-chrome"
      "lens"
      "mpv"
      "yubico-authenticator"
    ];
  };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix = {
    configureBuildUsers = true;
    gc.automatic = true;
    settings = {
      # package = pkgs.nix;
      max-jobs = lib.mkDefault 8;

      sandbox = false;
      extra-sandbox-paths = [
        "/System/Library/Frameworks"
        "/System/Library/PrivateFrameworks"
        "/usr/lib"
        "/private/tmp"
        "/private/var/tmp"
        "/usr/bin/env"
      ];
    };
  };

  services.activate-system.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

}
