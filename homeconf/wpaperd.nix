{ config, pkgs, ... }:

{
  programs.wpaperd = {
    enable = true;
    package = pkgs.wpaperd;
    settings = {
      DP-1 = {
        path = "~/Pictures";
        apply-shadow = true;
        duration = "5m";
      };
    };
  };
}
