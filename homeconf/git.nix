{ config, pkgs, ... }:

{
  # git 相关配置
  programs.git = {
    enable = true;
    userName = "fly206";
    userEmail = "flyflyan@outlook.com";
  };
}