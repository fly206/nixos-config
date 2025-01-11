{ config, pkgs, ... }:

{
  boot.loader = {
    systemd-boot.enable = false; # 确保 systemd-boot 被禁用
    grub.enable = false;         # 确保 GRUB 被禁用
    refind = {
      enable = true;
      useNvram = false; # 如果你的系统支持 NVRAM
      # extraConfig 可以用于添加额外的 rEFInd 配置
      extraConfig = ''
        timeout 20
      '';
    };
  };
}
