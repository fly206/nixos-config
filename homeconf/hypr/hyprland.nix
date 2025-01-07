{ config, pkgs, ... }:

{
  imports = [
    ./hypridle.nix
    ./hyprlock.nix
    # ./hyprpaper.nix
    ./mako.nix
    ./waybar.nix
    ./wofi.nix
    ./wpaperd.nix    
  ];

  home.packages = with pkgs;[
    xdg-desktop-portal-hyprland
    hypridle
    hyprsunset
    hyprshot
    networkmanagerapplet
    pavucontrol
    polkit_gnome
    playerctl
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
          rounding = 0;       # 圆角大小
	  
	  blur = {
	    enabled = false; # 模糊效果是否启用
	    size = 5; # 模糊半径
	    passes = 1; # 模糊过滤次数
	    new_optimizations = true; # 模糊优化，通常保持打开

	  };

          shadow = {
            enabled = false; # 窗口投影是否启用
	    range = 1; # 投影大小
	    render_power = 2; # 投影强度
	    color = "rgba(313132aa)"; # 投影颜色
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
            # "hyprpaper"
            "wpaperd -d"
            "waybar"
            "fcitx5"
            "nm-applet"
            "mako"
            "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
        ];

        env = [
            "QT_QPA_PLATFORM,wayland;xcb"
            "QT_SCREEN_SCALE_FACTORS,1;1"
            "XDG_SESSION_TYPE,wayland"
            "QT_QPA_PLATFORMHEME,qt6ct"
            "CLUTTER_BACKEND,wayland"
            "SDL_VIDEODRIVER,wayland"
            "GDK_BACKEND,wayland"
            "WLR_RENDERER,vulkan"
            "MOZ_ENABLE_WAYLAND,1"
            "XIM,fcitx"
            "XIM_PROGRAM,fcitx"
            "INPUT_METHOD,fcitx"
            "GTK_IM_MODULE,fcitx"
            "QT_IM_MODULE,fcitx"
            "XMODIFIERS,@im=fcitx"
        ];

	windowrulev2 = [
            # QQ
            "float, title:^(图片查看器)$"
            "float, title:^(视频播放器)$"
            "float, title:^(群聊的聊天记录)$"
	];

        "$mainMod" = "SUPER";

        bind = [
            "$mainMod, Q, killactive"
            "$mainMod SHIFT, Q, exit"
            "$mainMod, F, fullscreen, 0" #全屏
            "$mainMod SHIFT, F, togglefloating" #浮动
            "$mainMod SHIFT, E, exec, hyprctl reload" #重加载
            "$mainMod, P, pseudo" #伪平铺
            "$mainMod, H, togglesplit" #分割切换

            "$mainMod CTRL, left, moveactive, -40 0" #浮动窗口向左
	        "$mainMod CTRL, right, moveactive, 40 0" #浮动窗口向右
	        "$mainMod CTRL, up, moveactive, 0 -40" #浮动窗口向上
	        "$mainMod CTRL, down, moveactive, 0 40" #浮动窗口向下

	        "$mainMod, left, movefocus, l" #焦点向左
	        "$mainMod, right, movefocus, r" #焦点向右
	        "$mainMod, up, movefocus, u" #焦点向上
	        "$mainMod, down, movefocus, d" #焦点向下
	        "$mainMod, S, cyclenext" #焦点向后
	        "$mainMod, A, cyclenext, prev" #焦点向前


            "$mainMod SHIFT, left, movewindow, l" #窗口向左
	        "$mainMod SHIFT, right, movewindow, r" #窗口向右
	        "$mainMod SHIFT, up, movewindow, u" #窗口向上
	        "$mainMod SHIFT, down, movewindow, d" #窗口向下
	        "$mainMod SHIFT, A, swapnext, prev" #窗口向下
	        "$mainMod SHIFT, S, swapnext" #窗口向下

            # "$mainMod ALT, left, workspace, -1" #上一工作区
	        # "$mainMod ALT, right, workspace, +1" #下一工作区

            # 分组配置
            "$mainMod, W, togglegroup" #将当前活动窗口放到组中
            "$mainMod ALT, left, moveintogroup, l" #将窗口移动到左边的组
            "$mainMod ALT, right, moveintogroup, r" #将窗口移动到右边的组
            "$mainMod ALT, up, moveintogroup, u" #将窗口移动到上边的组
            "$mainMod ALT, down, moveintogroup, d" #将窗口移动到下边的组
            "$mainMod ALT, p, changegroupactive, f" #切换组内下一窗口
            "$mainMod ALT, o, changegroupactive, b" #切换组内上一窗口
            "$mainMod ALT, S,  moveoutofgroup" #切出组

            ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
            ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"
            ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 2%+"
            ", XF86AudioPlay, exec, playerctl play-pause"
            ", XF86AudioPause, exec, playerctl play-pause"
            ", XF86AudioNext, exec, playerctl next"
            ", XF86AudioPrev, exec, playerctl previous"
	    "$mainMod, F11, exec, ddcutil setvcp - 5"
	    "$mainMod, F12, exec, ddcutil setvcp + 5"

            "$mainMod, return, exec, kitty"
            "$mainMod, O, exec, microsoft-edge"
            "$mainMod, tab, exec, wofi --show drun"

            "$mainMod, N, exec, wpaperctl next"
            "$mainMod, B, exec, wpaperctl previous"
            "$mainMod SHIFT, B, exec, wget --content-disposition https://www.loliapi.com/acg/pc/ -P ~/Pictures"
            "$mainMod SHIFT, N, exec, wget --content-disposition https://img.darklotus.cn/random -P ~/Pictures"


            "$mainMod, L, exec, hyprlock"
            ", Print, exec, hyprshot -m region"
        ] ++ (
            # workspaces
            # binds $mainMod + [shift +] {1..9} to [move to] workspace {1..9}
            builtins.concatLists (builtins.genList (i:
                let ws = i + 1;
                in [
                    "$mainMod, code:1${toString i}, workspace, ${toString ws}"
                    "$mainMod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
                ]
                )
            9)
        );
    };
    extraConfig = ''
      bindm = $mainMod, mouse:272, movewindow # Move window with the mouse
      bindm = $mainMod, mouse:273, resizewindow # Resize window with the mouse
      # window resize
      bind = $mainMod, R, submap, resize
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
