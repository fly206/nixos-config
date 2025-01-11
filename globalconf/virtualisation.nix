{config, pkgs, ...}:

{
    virtualisation.virtualbox.host = {
        enable = true;
        enableExtensionPack = true;
        enableHardening = true;
        enableKvm = true;
        package = pkgs.virtualbox;
        addNetworkInterface = false;
    };
}
