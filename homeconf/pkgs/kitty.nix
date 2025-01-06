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
    
    font = {
      package = pkgs.cascadia-code;
      name = "Cascadia Mono";
    };

    environment = {
      "TERM" = "xterm-256color";
    };

    extraConfig = ''
      background_opacity 0.7
      # font_family      Cascadia Mono
      # bold_font        auto
      # italic_font      auto
      # bold_italic_font auto
      symbol_map U+4E00-U+9FA5 WenQuanYi Micro Hei
    '';
  };
}
