{ config, lib, pkgs, inputs, osConfig, ... }:

{
  programs = {
    go = {
      enable = true;
      package = pkgs.go_1_18;
      packages = {
        "github.com/motemen/gore/cmd/gore" = inputs.gore;
        "github.com/mdempsky/gocode" = inputs.gotools;
        "golang.org/x/tools/cmd/goimports" = inputs.gotools;
        "golang.org/x/tools/cmd/godoc" = inputs.gotools;
        "golang.org/x/tools/cmd/gorename" = inputs.gotools;
        "golang.org/x/tools/cmd/guru" = inputs.gotools;
        "github.com/cweill/gotests/..." = inputs.gotests;
        "github.com/fatih/gomodifytags" = inputs.gomodifytags;
      };
    };

    command-not-found.enable = true;

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv = { enable = true; };
    };

    exa = {
      enable = true;
      enableAliases = true;
    };

    feh.enable = true;

    gh = {
      enable = true;
      settings = {
        git_protocol = "ssh";
        prompt = "enabled";
      };
    };

    broot = {
      enable = true;
      enableZshIntegration = true;
    };

    # rofi = {
    #   enable = true;
    #   # separator = "solid";
    #   font = "Essential PragmataPro 14";
    #   theme = "/etc/nixos/extras/rofi/conf";
    #   plugins = with pkgs; [ rofi-emoji ];
    #   extraConfig = { dpi = osConfig.my.dpi; };
    # };

    git = {
      difftastic = {
        enable = true;
        background = "light";
        color = "always";
      };
      delta.enable = false;
      enable = true;
      userName = "Roch D'Amour";
      userEmail = "roch.damour@arctiq.ca";
      signing.key = "05C0574AE39248FF189245A5D3EE7D152CBEACCB";
      signing.signByDefault = true;
      extraConfig = { pull.rebase = false; };
    };

  };
}
