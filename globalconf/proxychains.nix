{ config, pkgs, ... }:

{
  programs.proxychains = {
    enable = true;
    package = pkgs.proxychains-ng;
    quietMode = true;
    proxies = {
      myproxy = {
        enable = true;
        type = "socks5";
	host = "192.168.3.36";
	port = 27007;
      };
    };
  };
}
