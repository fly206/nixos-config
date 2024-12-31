{ config, pkgs, ... }:

{
  imports = [
    ./waybar.nix
    ./hyprpaper.nix
    ./hyprlock.nix
    ./hypridle.nix
  ];

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
