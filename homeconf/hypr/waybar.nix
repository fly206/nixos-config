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

        "hyparland/window" = {
          format = "{title}";
        };
	tray = {
	  spacing = 10;
	};
	clock = {
          interval = 1;
	  tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
	  # format-alt = "{:%Y-%m-%d}";
          format = "{:%Y-%m-%d %H:%M:%S}";
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
          min-length = 38;
          max-length = 38;
          justify = "right";
          align = 1;
          interval = 2;
	  format-wifi = "{bandwidthUpBytes}↑ {bandwidthDownBytes}↓    {essid} ({signalStrength}%) ";
	  format-ethernet = "{bandwidthUpBytes}↑ {bandwidthDownBytes}↓    {ipaddr}/{cidr} ";
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
