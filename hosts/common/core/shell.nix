{ self, config, pkgs, lib, ... }:

{
  environment.enableAllTerminfo = true;

  services.fwupd.enable = true;

  environment.defaultPackages = lib.mkForce [];
  environment.systemPackages = with pkgs; [
    bash
    tmux

    # Utils
    bat
    curl
    duf
    fd
    file
    fzf
    hexyl
    htop
    nix-tree
    ripgrep
    rsync
    tcpdump
    wget

    # Archive Utils
    _7zz
    bzip2
    gnutar
    gzip
    unzip
    zstd


    # Dev Tools
    # csvlens
    git
    jless
    jq
    tokei
    yj
  ];
}
