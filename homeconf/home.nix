{ config, pkgs, ... }:

{
  # 注意修改这里的用户名与用户目录
  home.username = "fly";
  home.homeDirectory = "/home/fly";

  # 引用版本库
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # 引入其他模块
  imports = [
    ./alacritty.nix
    ./bash.nix
    ./git.nix
    ./homeconf.nix
    ./hyprland.nix
    ./mako.nix
    ./mypkgs.nix
    ./startship.nix
    ./xresources.nix
  ];
}
