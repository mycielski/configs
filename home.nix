{ config, pkgs, ... }:

{
  home.username = "tomaszjm";
  home.homeDirectory = "/home/tomaszjm";

  home.packages = with pkgs; [
    bat
    btop
    bun
    curl
    eternal-terminal
    fd
    file
    fzf
    htop
    k9s
    kubectl
    kubernetes-helm
    neovim
    nmap
    pandoc
    podman
    prettier
    pv
    rclone
    ripgrep
    tmux
    tree
    uv
    wget
    zoxide

    anki
    audacity
    firefox
    gimp
    qbittorrent
    signal-desktop
    spotify
    steam
    telegram-desktop
    vlc
    vscode
    zed
  ];

  dconf.settings = {
    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-timeout = 0;
      sleep-inactive-ac-type = "nothing";
    };
  };

  home.stateVersion = "25.11";
}
