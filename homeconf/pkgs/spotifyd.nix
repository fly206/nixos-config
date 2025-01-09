{ config, pkgs, ... }:

{
    services.spotifyd = {
        enable = true;
        settings = {
            bitrate = 160;
            volume_normalisation = true;
            username = "fly206";
            password_cmd = "cat ~/.config/spotifyd/passwd";
            use_mpris = true;
            dbus_type = "session";
        };
    };
}
