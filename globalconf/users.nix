{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.fly = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    # packages = with pkgs; [
    #   alacritty tree microsoft-edge libwebp papirus-nord oreo-cursors-plus
    # ];
  };
}