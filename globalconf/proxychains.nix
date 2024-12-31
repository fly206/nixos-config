{ config, pkgs, ... }:

{
  programs.proxychains = {
    enable = true;
    package = proxychains-ng;
    quietMode = true;
    proxies = {
      myproxy = {
        type = "socks5";
	host = "192.168.3.36";
	port = 27007;
      };
    };
  };
}
