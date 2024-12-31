{ config, pkgs, ... }:

{
  # alacritty - 一个跨平台终端，带 GPU 加速功能
  programs.alacritty = {
    enable = true;
    # 自定义配置
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
        normal = {
          family = "WenQuanYi Micro Hei Mono";
          style = "Bold";
        };
      };
      colors = {
        draw_bold_text_with_bright_colors = true;
        bright = {
          black = "0x666666";
          blue = "0x7aa6da";
          cyan = "0x54ced6";
          green = "0x9ec400";
          magenta = "0xb77ee0";
          red = "0xff3334";
          white = "0xffffff";
          yellow = "0xe7c547";
        };
        normal = {
          black = "0x000000";
          blue = "0x7aa6da";
          cyan = "0x70c0ba";
          green = "0xb9ca4a";
          magenta = "0xc397d8";
          red = "0xd54e53";
          white = "0xeaeaea";
          yellow = "0xe6c547";
        };
        primary = {
          background = "0x000606";
          foreground = "0x95aab9";
        };
        selection = {
          background = "0x404040";
          text = "0xeaeaea";
        };
      };
      scrolling = {
        history = 10000;
        multiplier = 3;
      };
      window = {
        decorations = "full";
        dynamic_padding = true;
        opacity = 0.2;
        dimensions = {
          columns = 112;
          lines = 34;
        };
        padding = {
          x = 1;
          y = 1;
        };
        position = {
          x = 600;
          y = 200;
        };
      };
      selection.save_to_clipboard = true;
    };
  };
}
