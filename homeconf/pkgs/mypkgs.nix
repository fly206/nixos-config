{ config, pkgs, ... }:

{
  imports = [
    # ./alacritty.nix
    ./fcitx5/fcitx5.nix
    ./joplin.nix
    ./kitty.nix
    ./mpv.nix
    ./neovim.nix
    ./obs.nix
    ./startship.nix
    ./vscode.nix
    # ./yazi.nix
  ];

  services.blueman-applet.enable = true;
  services.playerctld.enable = true;

  # 通过 home.packages 安装一些常用的软件
  # 这些软件将仅在当前用户下可用，不会影响系统级别的配置
  # 建议将所有 GUI 软件，以及与 OS 关系不大的 CLI 软件，都通过 home.packages 安装
  home.packages = with pkgs;[
    # 常用GUI软件
    microsoft-edge
    qq
    wechat-uos
    krita
    krita-plugin-gmic
    wpsoffice-cn
    xfce.thunar
    showmethekey
    spotify
    thunderbird
    mihomo-party

    # game
    hmcl
    glfw-wayland-minecraft

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    libwebp
    libnotify
    kdePackages.qt6ct
    # eza # A modern replacement for ‘ls’
    # fzf # A command-line fuzzy finder
    android-tools # adb fastboot

    # filesystem
    # cifs-utils # Tools for managing Linux CIFS client filesystems.
    # sshfs-fuse # FUSE-based filesystem that allows remote filesystems to be mounted over SSH.
    # jmtpfs # FUSE Filesystem providing access to MTP devices.

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    # dnsutils  # `dig` + `nslookup`
    # ldns # replacement of `dig`, it provide the command `drill`
    # aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc  # it is a calculator for the IPv4/v6 addresses

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
    clang
    killall

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
    bottom # show system status

    # system tools
    # sysstat
    # lm_sensors # for `sensors` command
    # ethtool
    pciutils # lspci
    usbutils # lsusb
  ];
}
