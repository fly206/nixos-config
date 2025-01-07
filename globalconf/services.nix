{ config, pkgs, ... }:

{
  # List services that you want to enable:
  # Enable CUPS to print documents.
  services.printing.enable = false;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable the gvfs daemon.
  # services.gvfs.enable = true;

  security.polkit = {
    enable = true;
  };

  #udev
  #services.udev.extraRules = ''
  #  KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
  #'';

  #bluetooth
  services.blueman.enable = true;

  #greetd
  services.greetd = {
    enable = true;
    restart = false;
    settings = {
      default_session = {
      command = ''
        ${pkgs.greetd.tuigreet}/bin/tuigreet --cmd Hyprland
      '';
      };
    };
  };

}
