{
  flake.homeModules.waybar = {pkgs, ...}: {
    programs.waybar.enable = true;

    home.packages = with pkgs; [
      brightnessctl
      pamixer
      pavucontrol
      playerctl
      wlogout
    ];

    xdg.configFile."waybar/config.jsonc".text = ''
      {
        "layer": "top",
        "position": "bottom",
        "height": 26,
        "exclusive": true,
        "passthrough": false,
        "gtk-layer-shell": true,
        "reload_style_on_change": true,

        "modules-left": ["group/os-logo", "group/media-and-volume"],
        "modules-center": ["group/workspaces-and-privacy"],
        "modules-right": ["group/misc", "group/tray-and-battery"],

        "group/os-logo": {
          "orientation": "horizontal",
          "modules": ["custom/os-logo", "niri/window"]
        },

        "group/media-and-volume": {
          "orientation": "horizontal",
          "modules": ["custom/media", "pulseaudio"]
        },

        "group/workspaces-and-privacy": {
          "orientation": "horizontal",
          "modules": ["niri/workspaces", "privacy"]
        },

        "group/misc": {
          "orientation": "horizontal",
          "modules": ["backlight", "network", "cpu", "memory", "disk"]
        },

        "group/tray-and-battery": {
          "orientation": "horizontal",
          "modules": ["tray", "clock"]
        },

        "custom/os-logo": {
          "exec": "echo '   '",
          "interval": "once",
          "tooltip": false,
          "on-click-right": "wlogout"
        },

        "niri/workspaces": {
          "format": "{icon}",
          "format-icons": {
            "1": "1",
            "2": "2",
            "3": "3",
            "4": "4",
            "5": "5",
            "6": "6",
            "7": "7",
            "8": "8",
            "9": "9",
            "10": "10"
          },
          "on-click": "activate"
        },

        "niri/window": {
          "format": "{}",
          "max-length": 54
        },

        "custom/media": {
          "exec": "playerctl metadata --format '{{artist}} - {{title}}' 2>/dev/null || echo",
          "format": "󰝚 {}",
          "on-click": "playerctl play-pause",
          "on-click-right": "playerctl next",
          "on-click-middle": "playerctl previous",
          "max-length": 52,
          "tooltip": true
        },

        "clock": {
          "format": "{:%b %d %H:%M}",
          "interval": 60,
          "tooltip-format": "<span>{calendar}</span>",
          "calendar": {
            "mode": "month",
            "mode-mon-col": 3,
            "on-scroll": 1,
            "iso8601": true
          },
          "actions": {
            "on-click": "mode",
            "on-click-right": "mode",
            "on-click-middle": "shift_reset",
            "on-scroll-up": "shift_up",
            "on-scroll-down": "shift_down"
          }
        },

        "cpu": {
          "interval": 10,
          "format": " {usage}%"
        },

        "memory": {
          "interval": 30,
          "format": " {avail}GiB",
          "tooltip": true,
          "tooltip-format": " {percentage}%\n {used:0.1f}GB/{total:0.1f}GB"
        },

        "disk": {
          "interval": 30,
          "format": "󰋊 {free}",
          "tooltip": true,
          "tooltip-format": "󰋊 {percentage_used}%\n {used}/{total}"
        },

        "network": {
          "interval": 2,
          "tooltip": true,
          "format": " {bandwidthDownBytes}  {bandwidthUpBytes}",
          "format-linked": "󰈀 {ifname}",
          "format-disconnected": "󰖪",
          "tooltip-format": "Interface: {ifname}\nIP: {ipaddr}/{cidr}"
        },

        "backlight": {
          "format": "{icon} {percent}%",
          "format-icons": ["", "", "", "", "", "", "", "", ""],
          "on-scroll-up": "brightnessctl set 1%+",
          "on-scroll-down": "brightnessctl set 1%-"
        },

        "pulseaudio": {
          "format": "{icon} {volume}%",
          "format-muted": "",
          "on-click": "pavucontrol",
          "on-click-right": "pamixer -t",
          "on-scroll-up": "pamixer -i 1",
          "on-scroll-down": "pamixer -d 1",
          "tooltip-format": "{icon} {desc} // {volume}%",
          "format-icons": {
            "headphone": "",
            "headset": "",
            "default": [" ", " ", "  "]
          }
        },

        "privacy": {
          "icon-size": 10,
          "icon-spacing": 5,
          "transition-duration": 250,
          "modules": [
            {
              "type": "screenshare",
              "tooltip": true,
              "tooltip-icon-size": 24
            },
            {
              "type": "audio-in",
              "tooltip": true,
              "tooltip-icon-size": 24
            }
          ]
        },

        "tray": {
          "icon-size": 14,
          "spacing": 5
        }
      }
    '';

    xdg.configFile."waybar/style.css".text = ''
      @define-color main-bg #212121;
      @define-color main-fg #e0e0e0;
      @define-color bar-bg rgba(0, 0, 0, 0);

      @define-color wb-act-bg #2c2c2c;
      @define-color wb-urg-bg #f38ba8;
      @define-color wb-act-fg #ffffff;

      @define-color wb-hvr-bg #2a2a2a;
      @define-color wb-hvr-fg #ffffff;


      @keyframes blink {
        to {
          background-color: rgba(0, 0, 0, 0);
        }
      }

      * {
        border: none;
        border-radius: 0px;
        font-family: "JetBrainsMono Nerd Font";
        font-feature-settings: "tnum";
        font-size: 12px;
        min-height: 12px;
        color: @main-fg;
        text-shadow: none;
      }

      window#waybar {
        background: @bar-bg;
      }

      tooltip {
        background: @main-bg;
        box-shadow:
          0 1px 3px rgba(0, 0, 0, 0.18),
          0 1px 2px rgba(0, 0, 0, 0.32);
        color: @main-fg;
        border-radius: 6px;
        border-width: 0px;
      }

      tooltip label {
        font-family: "JetBrainsMono Nerd Font Propo";
        font-weight: 500;
      }

      #workspaces * {
        font-family: "JetBrainsMono Nerd Font Propo";
        font-weight: bold;
      }

      #workspaces button {
        text-shadow: none;
        padding: 0px;
        border-radius: 4px;
        margin-top: 3px;
        margin-bottom: 3px;
        margin-left: 0px;
        padding-left: 0px;
        padding-right: 0px;
        margin-right: 0px;
        color: @main-fg;
      }

      #workspaces button.active {
        background: @wb-act-bg;
        color: @wb-act-fg;
        margin-left: 0px;
        padding-left: 5px;
        padding-right: 5px;
        margin-right: 0px;
        transition: all 0.2s cubic-bezier(0.55, -0.68, 0.48, 1.682);
      }

      #workspaces button.urgent {
        background: @wb-urg-bg;
        color: @wb-act-fg;
        margin-left: 2px;
        padding-left: 3px;
        padding-right: 3px;
        margin-right: 2px;
        animation: blink 0.6s infinite alternate;
        transition: all 0.2s cubic-bezier(0.55, -0.68, 0.48, 1.682);
      }

      #workspaces button:hover {
        background: @wb-hvr-bg;
        color: @wb-hvr-fg;
        transition: all 0.2s cubic-bezier(0.55, -0.68, 0.48, 1.682);
      }

      #tray menu {
        border-radius: 6px;
        border: none;
        background-color: rgba(0, 0, 0, 0);
        background-color: @main-bg;
        padding: 0px;
      }

      #tray * {
        border: none;
      }

      #tray menu menuitem:hover {
        background-color: @wb-act-bg;
      }

      #tray menu separator {
        background-color: @main-bg;
        min-height: 10px;
      }

      #custom-gcal,
      #privacy,
      #custom-media,
      #custom-webcam,
      #tray {
        font-weight: 500;
        padding-left: 4px;
        padding-right: 4px;
      }

      #custom-media,
      #custom-gcal {
        font-family: "SFProDisplay Nerd Font";
        font-size: 13px;
      }

      #custom-weather,
      #pulseaudio {
        font-family: "SFProDisplay Nerd Font";
      }

      #backlight,
      #battery,
      #window,
      #clock,
      #pulseaudio,
      #memory,
      #disk,
      #custom-notifications,
      #network,
      #custom-caffeinate,
      #cpu,
      #pulseaudio,
      #custom-weather {
        font-weight: 600;
        padding-left: 4px;
        padding-right: 4px;
      }

      #window {
        font-size: 13px;
        padding: 0px;
      }

      #os-logo {
        margin: 0px 4px 4px 8px;
      }

      #media-and-volume,
      #workspaces-and-privacy,
      #misc {
        margin: 0px 4px 4px 4px;
      }

      #tray-and-battery {
        margin: 0px 8px 4px 4px;
      }

      #media-and-volume,
      #os-logo,
      #media-and-volume,
      #workspaces-and-privacy,
      #misc,
      #tray-and-battery {
        box-shadow:
          0 1px 3px rgba(0, 0, 0, 0.28),
          0 1px 2px rgba(0, 0, 0, 0.42);
        color: @main-fg;
        background: @main-bg;
        opacity: 1;
        padding-left: 4px;
        padding-right: 4px;
        border-radius: 6px;
      }

      #privacy-item {
        margin-left: 4px;
      }
    '';
  };
}
