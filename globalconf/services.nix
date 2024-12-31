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
  services.gvfs.enable = true;

  security.polkit = {
    enable = true;
  };
  
}
