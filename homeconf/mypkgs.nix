{ config, pkgs, ... }:

{
  # 通过 home.packages 安装一些常用的软件
  # 这些软件将仅在当前用户下可用，不会影响系统级别的配置
  # 建议将所有 GUI 软件，以及与 OS 关系不大的 CLI 软件，都通过 home.packages 安装
  home.packages = with pkgs;[
    #hyprland
    xdg-desktop-portal-hyprland
    # waybar
    hyprpaper
    # hyprlock
    hypridle
    hyprsunset
    hyprshot
    #mako
    wofi
    networkmanagerapplet

    # themes
    papirus-icon-theme
    oreo-cursors-plus

    # 如下是我常用的一些命令行工具，你可以根据自己的需要进行增删
    nnn # terminal file manager
    microsoft-edge
    qq
    xfce.thunar
    lxappearance-gtk2

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    libwebp
    libnotify

    # eza # A modern replacement for ‘ls’
    # fzf # A command-line fuzzy finder

    # networking tools
    # mtr # A network diagnostic tool
    # iperf3
    # dnsutils  # `dig` + `nslookup`
    # ldns # replacement of `dig`, it provide the command `drill`
    # aria2 # A lightweight multi-protocol & multi-source command-line download utility
    # socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    # ipcalc  # it is a calculator for the IPv4/v6 addresses

    # misc
    # cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    # hugo # static site generator
    # glow # markdown previewer in terminal

    # btop  # replacement of htop/nmon
    # iotop # io monitoring
    # iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    # sysstat
    # lm_sensors # for `sensors` command
    # ethtool
    pciutils # lspci
    usbutils # lsusb
  ];
}
