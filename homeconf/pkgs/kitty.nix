{ config, pkgs, ... }:

{
  # kitty - 一个跨平台终端，带 GPU 加速功能
  programs.kitty = {
    enable = true;
    # 自定义配置
    settings = {
      scrollback_lines = 10000;
      enable_audio_bell = false;
      update_check_interval = 0;
    };
    
    environment = {
      "TERM" = "xterm-256color";
    };

    font = {
      size = 12;
      name = "WenQuanYi Micro Hei";
    };
    extraConfig = "background_opacity 1.0";
  };
}
