{ config, pkgs, ... }:

{
  # mako - 一个通知工具
  services.mako = {
    package = pkgs.mako
    enable = true;
    font = "WenQuanYi Micro Hei Mono 8";
    defaultTimeout = 10;
  };
}
