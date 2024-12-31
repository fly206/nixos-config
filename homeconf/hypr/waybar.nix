{ config, pkgs, ... }:

{
  home.file.".config/waybar/style.css".source = ./waybar.css;
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    # style = '' * { border: none; border-radius: 0; font-family: WenQuanYi Micro Hei; }'';

    settings = {
      mainbar = {
        layer = "top";
        position = "top";
        height = 30;
	spacing = 4;

	modules-left = [ "hyprland/workspaces" "hyprland/window" ];
	modules-center = [];
	modules-right =  [ "tray" "network" "pulseaudio" "memory" "cpu" "temperature" "clock" ];

	tray = {
	  spacing = 10;
	};
	clock = {
	  tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
	  format-alt = "{:%Y-%m-%d}";
	};
	cpu = {
	  format = "{usage}% ";
          tooltip = false;
	};
	memory = {
          format = "{}% ";
        };
	temperature = {
	  critical-threshold = 80;
	  format = "{temperatureC}°C {icon}";
	  format-icons = [ "" "" "" ];
	};
	network = {
	  format-wifi = "{essid} ({signalStrength}%) ";
	  format-ethernet = "{ipaddr}/{cidr} ";
	  tooltip-format = "{ifname} via {gwaddr} ";
	  format-linked = "{ifname} (No IP) ";
	  format-disconnected = "Disconnected ⚠";
	  format-alt = "{ifname}: {ipaddr}/{cidr}";
	};
	pulseaudio = {
	  format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = [ "" "" "" ];
          };
          on-click = "pavucontrol";
	};

      };
    };
  };
}
