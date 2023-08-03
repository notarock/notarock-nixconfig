{ config, lib, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    act

    wget
    curl
    ack
    tree
    fd
    ripgrep
    bc
    # finger_bsd
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
    vagrant
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

    ripgrep
    sqlite
    wordnet
    awscli2

    qemu

    (import inputs.nixpkgs-stable { inherit (pkgs) config system; }).ansible

  ];

}
