{ config, pkgs, ... }:

{
  boot.loader = {
    systemd-boot.enable = true; # 确保 systemd-boot 被禁用
    grub.enable = false;         # 确保 GRUB 被禁用
    };
  };
}
