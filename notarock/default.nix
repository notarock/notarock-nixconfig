{ config, pkgs, inputs, ... }:

{
  home-manager = {
    users.roch = { pkgs, config, osConfig, ... }: {
      imports = [
        ./xdg.nix
        ./activation.nix
        ./programs.nix
        ./myTheme.nix
        ./packages.nix
        ./extras/herbstluftwm.nix
        ./extras/polybar.nix
        ./extras/udiskie.nix
        ./extras/dunst.nix
        ./extras/vim.nix
        ./extras/emacs.nix
        ./extras/zsh.nix
        ./extras/fzf.nix
        ./extras/kitty.nix
        ./extras/starship.nix
        ./extras/xmonad.nix
      ];

      home.file.".background-image".source = let
        background = ../resources/bsd-grid.png;
        bgOut = "bgOut.png";
        wallpaper = pkgs.runCommandNoCC "wallpaper" { } ''
          mkdir -p $out/share;
          ${pkgs.imagemagick}/bin/convert ${background} \
          -fill "${config.myTheme.color4}" -opaque white \
          -fill "${config.myTheme.color0}" -opaque black ${bgOut} ;
          cp -Lr ${bgOut} $out/share;
        '';
      in "${wallpaper}/share/${bgOut}";

      myTheme = import ../themes/base16-snazzy.nix;

      manual = {
        html.enable = true;
        manpages.enable = true;
      };

      home = {
        stateVersion = "23.11";
        username = "notarock";
        packages = with pkgs; [ xss-lock xsecurelock ];
        enableNixpkgsReleaseCheck = true;
      };

      gtk = {
        enable = true;
        iconTheme.package = pkgs.numix-icon-theme-square;
        iconTheme.name = "Numix-Square";
        font.name = "IBM Plex Sans Text";
        font.package = pkgs.ibm-plex;
        font.size = 11;
        theme.package = pkgs.plata-theme;
        theme.name = "Plata";
      };

      home.keyboard.layout = "ca,fr";
      home.pointerCursor = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Ice";
        size = 48;
      };

      services = {
        volnoti = { enable = true; };
        cbatticon = {
          enable = true;
          commandCriticalLevel = ''
            notify-send "battery critical!"
          '';
        };
        nextcloud-client.enable = true;
        picom = {
          enable = true;
          shadow = false;
          vSync = true;
          fade = true;
          fadeDelta = 2;
        };
        flameshot = { enable = true; };
      };

    };
  };

}
