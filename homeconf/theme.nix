{ config, pkgs, ... }:

{
  home.pointerCursor = {
    gtk.enable = false;
    x11.enable = true;
    package = pkgs.oreo-cursors-plus;
    name = "oreo_spark_blue_cursors";
    size = 16;
  };
 
  gtk = {
    enable = true;
    theme = {
      name = "Arc-Darker";
      package = pkgs.arc-theme;
      #.override {
        #accents = [ "pink" ];
        #size = "standard";
        #tweaks = [ "rimless" "normal" "black" ];
        #variant = "frappe";
      #};
    };
    
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
    
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    font = {
      name = "WenQuanYi Micro Hei";
      size = 11;
    };
  };
    
  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };
}
