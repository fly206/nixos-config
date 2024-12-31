{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    style = ''* { border: none; border-radius: 0; font-family: WenQuanYi Micro Hei; } 
      window#waybar { background: #16191C; color: #AAB2BF; } #workspaces button { padding: 0 5px; }'';
  };

  services.hyprpaper = {
    enable = true;
    package = pkgs.hyprpaper;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload =
      [ "~/Pictures/117edc8f215125504dcc495a12f135da.webp" ];
    };
  };

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 300;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [{
        path = "screenshot";
        blur_passes = 3;
        blur_size = 8;
      }];

      input-field = [{
        size = "200, 50";
        position = "0, -80";
        monitor = "";
        dots_center = true;
        fade_on_empty = false;
        font_color = "rgb(202, 211, 245)";
        inner_color = "rgb(91, 96, 120)";
        outer_color = "rgb(24, 25, 38)";
        outline_thickness = 5;
        placeholder_text = ''<span foreground="##cad3f5">Password...</span>'';
        shadow_passes = 2;
      }];
    };
  };
  
  services.hypridle = {
    package = pkgs.hypridle;
    enable = true;
    settings = {
      general = {
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
        lock_cmd = "hyprlock";
      };

      listener = [
        {
          timeout = 900;
          on-timeout = "hyprlock";
        }
        {
          timeout = 1200;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };

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
          rounding = 4;       # 圆角大小
          # blur = "yes";          # 模糊效果是否启用
          # blur_size = 5;       # 模糊半径
          # blur_passes = 1;     # 模糊过滤次数
          # blur_new_optimizations = "on";     # 模糊优化，通常保持打开

          # drop_shadow = "yes";   # 窗口投影是否启用
          # shadow_range = 4;    # 投影大小
          # shadow_render_power = 3;     # 投影强度，不过我不太明白这是什么意思
          # "col.shadow" = "rgba(1a1a1aee)";     # 投影颜色
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
            "mako"
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
            "$mod, L, exec, hyprlock"
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
