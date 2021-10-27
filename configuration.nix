{ config, pkgs, ... }:

{
  system.stateVersion = "21.11";
  nix.nixPath = [ "nixpkgs=${pkgs.path}" ];

  imports = [
    ./core/enableFlake.nix
    ./core/system.nix
    ./core/keychron.nix
    ./core/services.nix
    ./core/systemPackages.nix
    ./notarock/notarock.nix
  ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
  };

  # Sops config
  sops.defaultSopsFile = ./secrets/notarock.yaml;
  sops.secrets.password = {};
  sops.gnupg.home = "/home/notarock/.gnupg";
  sops.gnupg.sshKeyPaths = [];

  programs = {
    zsh.enable = true;
    ssh.startAgent = false;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryFlavor = "gtk2";
    };
  };

  fonts = {
    enableDefaultFonts = true;
    fonts = with pkgs; [ dejavu_fonts opensans-ttf font-awesome ];
  };

  environment.variables.EDITOR = "vim";
  programs.light.enable = true;

  # Fixes svg icon-theme
  # https://github.com/NixOS/nixpkgs/issues/13537#issuecomment-332327760
  # Use librsvg's gdk-pixbuf loader cache file as it enables gdk-pixbuf to load SVG files (important for icons)
  environment.sessionVariables = {
    GDK_PIXBUF_MODULE_FILE =
      "$(echo ${pkgs.librsvg.out}/lib/gdk-pixbuf-2.0/*/loaders.cache)";
  };

  # Minimal configuration for NFS support with Vagrant.
  services.nfs.server.enable = true;
  networking.firewall.extraCommands = ''
    ip46tables -I INPUT 1 -i vboxnet+ -p tcp -m tcp --dport 2049 -j ACCEPT
  '';

  programs.noisetorch.enable = true;

  security.sudo.extraRules = [
    {
      users = [ "notarock" ];
      commands = [{
        command = "/run/current-system/sw/bin/nixos-rebuild";
        options = [ "NOPASSWD" ];
      }];
    }
    {
      users = [ "ALL" ];
      commands = [
        {
          command = "${pkgs.docker}/bin/docker ps -qf status=dead";
          options = [ "NOPASSWD" ];
        }
        {
          command = "${pkgs.docker}/bin/docker ps -qf status=running";
          options = [ "NOPASSWD" ];
        }
        {
          command = "${pkgs.docker}/bin/docker ps -qf status=restarting";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];

}
