{ config, pkgs, ... }:

{
  nix.settings.substituters = [ "https://mirror.sjtu.edu.cn/nix-channels/store" "https://mirrors.xmcloud.io/nix-channels/store" ];
  nixpkgs.config.allowUnfree = true;

  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Automatic Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}