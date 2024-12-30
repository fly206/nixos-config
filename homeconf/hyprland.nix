{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    # The hyprland package to use
    package = pkgs.hyprland;

    # Whether to enable XWayland
    xwayland.enable = true;

    # Optional
    # Whether to enable hyprland-session.target on hyprland startup
    systemd.enable = true;
    systemd.variables = ["--all"];

    settings = {
        decoration = {
        #    shadow_offset = "0 5";
        #   "col.shadow" = "rgba(1a1a1aee)";
        };
        general = {
          gaps_in = 4;
          gaps_out = 8;
          border_size = 1;
        };

        exec-once = [
            "hyprpaper"
            "waybar"
            "fcitx5"
            "nm-applet"
        ];

        env = [
            "QT_QPA_PLATFORM,wayland;xcb"
            "XIM,fcitx"
            "XIM_PROGRAM,fcitx"
            "INPUT_METHOD,fcitx"
            "GTK_IM_MODULE,fcitx"
            "QT_IM_MODULE,fcitx"
            "XMODIFIERS,@im=fcitx"
        ];

        "$mod" = "SUPER";

        bind = [
            "$mod, return, exec, alacritty"
            "$mod, Q, killactive"
            "$mod, M, exit"
            "$mod, F, fullscreen, 0"
            "$mod, D, exec, wofi --show drun"
            "SUPERSHIFT, SPACE, togglefloating"
            "SUPERSHIFT, C, exec, hyprctl reload"
            "$mod, O, exec, microsoft-edge"
            ", Print, exec, hyprshot -m region"
        ] ++ (
            # workspaces
            # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
            builtins.concatLists (builtins.genList (i:
                let ws = i + 1;
                in [
                    "$mod, code:1${toString i}, workspace, ${toString ws}"
                    "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
                ]
                )
            9)
        );
    };
  };

  # Optional, hint Electron apps to use Wayland:
  home.sessionVariables.NIXOS_OZONE_WL = "1";
}
