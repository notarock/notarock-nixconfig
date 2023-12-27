{ config, lib, pkgs, inputs, osConfig, ... }:

{
  programs = {
    go = {
      enable = true;
      package = pkgs.go_1_20;
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

    eza = {
      enable = true;
      enableAliases = true;
    };

    feh.enable = true;

    gh = {
      enable = true;
      # settings = {
      #   git_protocol = "ssh";
      #   prompt = "enabled";
      # };
    };

    broot = {
      enable = true;
      enableZshIntegration = true;
    };

    git = {
      difftastic = {
        enable = true;
        background = "light";
        color = "always";
      };
      delta.enable = false;
      enable = true;
      userName = "Roch D'Amour";
      signing.key = "8B837A899A76EF04EED7B7BF041F365A7B126DD7";
      signing.signByDefault = true;
      extraConfig = { pull.rebase = false; };
    };

  };
}
