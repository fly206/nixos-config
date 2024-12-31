{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    # style = ''* { border: none; border-radius: 0; font-family: WenQuanYi Micro Hei; } 
    #  window#waybar { background: #16191C55; color: #AAB2BF; } #workspaces button { padding: 0 5px; }'';
    settings = {
      mainbar = {
        layer = "top";
        position = "top";
        height = 30;
	spacing = 4;

	modules-left = [ "hyprland/workspaces" "hyprland/window" ];
	modules-center = [];
	modules-right =  [ "tray" "network" "pulseaudio" "memory" "cpu" "temperature" "clock" ];

	tray = {
	  spacing = 10;
	};
	clock = {
	  tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
	  format-alt = "{:%Y-%m-%d}";
	};
	cpu = {
	  format = "{usage}% ";
          tooltip = false;
	};
	memory = {
          format = "{}% ";
        };
	temperature = {
	  critical-threshold = 80;
	  format = "{temperatureC}°C {icon}";
	  format-icons = [ "" "" "" ];
	};
	network = {
	  format-wifi = "{essid} ({signalStrength}%) ";
	  format-ethernet = "{ipaddr}/{cidr} ";
	  tooltip-format = "{ifname} via {gwaddr} ";
	  format-linked = "{ifname} (No IP) ";
	  format-disconnected = "Disconnected ⚠";
	  format-alt = "{ifname}: {ipaddr}/{cidr}";
	};
	pulseaudio = {
	  format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = [ "" "" "" ];
          };
          on-click = "pavucontrol";
	};

      };
    };
  };

  services.hyprpaper = {
    enable = true;
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
	  
	  blur = {
	    enabled = true; # 模糊效果是否启用
	    size = 5; # 模糊半径
	    passes = 1; # 模糊过滤次数
	    new_optimizations = true; # 模糊优化，通常保持打开

	  };

          shadow = {
            enabled = true; # 窗口投影是否启用
	    range = 4; # 投影大小
	    render_power = 3; # 投影强度
	    color = "rgba(f4f7f8aa)"; # 投影颜色
	  };
        };

        general = {
          gaps_in = 4;
          gaps_out = 8;
          border_size = 1;
        };

	dwindle = {
	  preserve_split=1;
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
            "$mod, mouse:272, movewindow" # 按住mod用鼠标左键拖动窗口
            #"$mod, mouse:273, resizewindow" # 按住mod用鼠标右键拖动窗口

            "$mod, Q, killactive"
            "$mod, M, exit"
            "$mod SHIFT, F, fullscreen, 0"
            "$mod SHIFT, SPACE, togglefloating"
            "$mod SHIFT, C, exec, hyprctl reload"
	    "$mod CTRL, L, changegroupactive" #分组窗口切换
	    "$mod ALT, left, workspace, -1" #上一工作区
	    "$mod ALT, right, workspace, +1" #下一工作区
	    "$mod, D, pseudo" #伪平铺
	    "$mod, V, togglesplit" #分割切换
	    "$mod, S, togglegroup" #分组切换
	    "$mod, left, movefocus, l" #焦点向左
	    "$mod, right, movefocus, r" #焦点向右
	    "$mod, up, movefocus, u" #焦点向上
	    "$mod, down, movefocus, d" #焦点向下
	    "$mod SHIFT, left, movewindow, l" #窗口向左
	    "$mod SHIFT, right, movewindow, r" #窗口向右
	    "$mod SHIFT, up, movewindow, u" #窗口向上
	    "$mod SHIFT, down, movewindow, d" #窗口向下

            "$mod, return, exec, alacritty"
            "$mod, O, exec, microsoft-edge"
            "$mod, tab, exec, wofi --show drun"

            "$mod, L, exec, hyprlock"
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
    extraConfig = ''
      # window resize
      bind = $mod, R, submap, resize
      submap = resize
        binde = , right, resizeactive, 10 0
        binde = , left, resizeactive, -10 0
        binde = , up, resizeactive, 0 -10
        binde = , down, resizeactive, 0 10
        bind = , escape, submap, reset
      submap = reset
    '';
  };



  # Optional, hint Electron apps to use Wayland:
  home.sessionVariables.NIXOS_OZONE_WL = "1";
}
