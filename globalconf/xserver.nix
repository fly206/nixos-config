{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;

    videoDrivers = [ "amdgpu" ];

    # Configure keymap in X11
    xkb = {
      layout = "us";
      options = "eurosign:e,caps:escape";
    };
  
    displayManager = {
      lightdm.enable = false;
    };
    desktopManager = {
      xterm.enable = false;
  #    cinnamon.enable = true;
  #    plasma5.enable = false;
    };
  
    excludePackages = with pkgs; [
      xterm
    ];
  };
  # services.displayManager.defaultSession = "cinnamon";
  # services.xserver.excludePackages = [ pkgs.xterm ];

  # environment.cinnamon.excludePackages = (with pkgs; [
  #  mint-cursor-themes
  #  mint-themes mint-l-theme mint-x-icons mint-y-icons mint-l-icons
  #  celluloid onboard xreader bulky xviewer warpinator
  #  gnome-screenshot gnome-terminal gnome-disk-utility
  #]) ++ ( with pkgs.gnome; [
  #  # screenshot
  #]);
}
