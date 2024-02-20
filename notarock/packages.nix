{ config, lib, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    act
    ffmpeg

    wget
    curl
    ack
    tree
    fd
    ripgrep
    bc
    gnupg
    zip
    unzip
    rsync
    htop
    lsof
    pstree
    # parted
    inetutils
    tcpdump
    dnsutils
    mtr
    docker-compose
    xorg.xhost
    mage
    tldr
    xorg.xmessage
    librsvg
    gnumake
    cmake
    pciutils
    killall
    libnotify
    gcc
    pkg-config
    openconnect
    jre
    # python
    openvpn
    # dbeaver
    git
    tig
    bat
    pass
    colordiff
    nmap
    gimp
    neofetch

    kubectl
    minikube
    kompose
    k9s
    kubernetes-helm
    google-cloud-sdk
    # ansible

    nodePackages.prettier
    # nodejs-16_x
    ccls
    clang-tools
    wakatime
    texlive.combined.scheme-medium

    pandoc
    youtube-dl
    hunspell
    hunspellDicts.en-ca
    hunspellDicts.fr-any
    aspell
    aspellDicts.en
    aspellDicts.fr
    gitAndTools.delta
    dive
    delve
    pdftk
    jq
    nixfmt
    nix-index
    asciinema
    tmux
    kotlin
    figlet
    delve
    volumeicon
    networkmanager_dmenu
    dmenu
    blueman

    cheminot-ets
    awscli2

    # <<<<<<< HEAD
    #     (retroarch.override {
    #       cores = with libretro; [
    #         bsnes-mercury
    #         beetle-snes
    #         mgba
    #         mupen64plus
    # =======
    #     qemu

    #     (import inputs.nixpkgs-stable { inherit (pkgs) config system; }).ansible
    # >>>>>>> 99b1884 (Docker and rust)

    #         snes9x
    #         snes9x2010
    #         yabause
    #       ];
    #     })

    # (import inputs.nixpkgs-stable { inherit (pkgs) config system; }).ansible
    # (import inputs.nixpkgs-stable { inherit (pkgs) config system; }).screenkey

    # Discord doesnt work? fix is where in this line lol
    # (import inputs.nixpkgs-discord { inherit (pkgs) config system; }).discord
    # discord
  ];

}
