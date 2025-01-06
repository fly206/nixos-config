{ config, pkgs, ... }:

{
  # yazi - 终端文件管理器
  programs.yazi = {
    enable = true;
    
    theme = {
      filetype = {
        rules = [
          { fg = "#7AD9E5"; mime = "image/*"; }
          { fg = "#F3D398"; mime = "video/*"; }
          { fg = "#F3D398"; mime = "audio/*"; }
          { fg = "#CD9EFC"; mime = "application/x-bzip"; }
        ];
      };
    };
  };
}
