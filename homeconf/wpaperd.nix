{ config, pkgs, ... }:

{
  programs.wpaperd = {
    enable = true;
    package = pkgs.wpaperd;
    settings = {
      DP-1 = {
        path = "/home/${home.username}/Pictures/Wallpaper";
        apply-shadow = true;
        duration = "5m";
      };
    };
  };
}
