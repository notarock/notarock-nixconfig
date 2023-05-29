{ config, pkgs, inputs, ... }:

{
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

  myTheme = import ../themes/base16-solarflare-light.nix;

  manual = {
    html.enable = true;
    manpages.enable = true;
  };

  home = {
    stateVersion = "22.11";
    enableNixpkgsReleaseCheck = true;
  };

  home.keyboard.layout = "ca,fr";
}
