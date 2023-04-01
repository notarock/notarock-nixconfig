{ config, pkgs, inputs, ... }:

{


  home-manager = {
    users.roch = { pkgs, config, osConfig, ... }: {
      imports = [
        ./programs.nix
        ./myTheme.nix
        ./packages.nix
        ./extras/vim.nix
        ./extras/emacs.nix
        ./extras/zsh.nix
        ./extras/fzf.nix
        ./extras/kitty.nix
        ./extras/starship.nix
      ];

      myTheme = import ../themes/base16-snazzy.nix;

      manual = {
        html.enable = true;
        manpages.enable = true;
      };

      home = {
        stateVersion = "22.11";
        username = "roch";
        enableNixpkgsReleaseCheck = true;
      };

      home.keyboard.layout = "ca,fr";

    };
  };

}
