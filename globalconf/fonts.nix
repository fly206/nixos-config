{ config, pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [ 
      wqy_microhei
      font-awesome
    ];

    fontconfig = {
      defaultFonts = {
        serif = [ "WenQuanYi Micro Hei" ];
        sansSerif = [ "WenQuanYi Micro Hei"];
        monospace = [ "WenQuanYi Micro Hei Mono" ];
      };
    };
  };
}
