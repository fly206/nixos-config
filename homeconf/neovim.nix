{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    # 自定义配置
    extraConfig = ''
      set number relativenumber
    ''; 
  };
}
