# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  system.stateVersion = "24.11";
  
  imports = [ # Include the results of the hardware scan.
    ./nix.nix
    ./hardware-configuration.nix
    ./boot.nix
    ./network.nix
    ./i18n.nix
    ./audio.nix
    ./xserver.nix
    ./users.nix
    ./systempkgs.nix
    ./tz.nix
    ./services.nix
    ./fonts.nix
    ./proxychains.nix
    ./virtualisation.nix
  ];
}
