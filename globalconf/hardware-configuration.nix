# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "uas" "sd_mod"];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];
  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/62d946af-cc8a-4465-bcef-ddda9d4a601c";
      fsType = "btrfs";
    };

  zramSwap = {
    enable = true;
    memoryPercent = 10;
  };
  # swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp37s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp38s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  hardware.graphics.enable = true;
  hardware.amdgpu.amdvlk.enable = true;
  hardware.amdgpu.amdvlk.support32Bit.enable = true;
  hardware.amdgpu.amdvlk.supportExperimental.enable = true;

  hardware.graphics.extraPackages = with pkgs; [
    amdvlk
  ];
}
