{ config, pkgs, ... }:

{
  home.file.".config/waybar/style.css".source = ./waybar.css;
  home.file.".config/waybar/config".source = ./waybar.config;
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
  };
}
