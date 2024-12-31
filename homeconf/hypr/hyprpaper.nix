{ config, pkgs, ... }:

{
  services.hyprpaper = {
    enable = false;
    package = pkgs.hyprpaper;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload =
        [ "~/Pictures/3feac77d82541f2e3548c6e913be3f7c.webp" ];

      wallpaper =
        [ "DP-1,~/Pictures/3feac77d82541f2e3548c6e913be3f7c.webp" ];
    };
  };
}
