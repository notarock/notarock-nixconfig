{ config, lib, pkgs, ... }:

{
  programs.kitty = {
    # package = pkgs.runCommandLocal "" { } "mkdir $out";
    enable = true;
    font.name = "Essential PragmataPro";
    settings = {
      font_size = "15.0";
      enable_audio_bell = false;
      open_url_with = "firefox";
      scrollback_lines = 5000;
      cursor_shape = "block";
      cursor_blink_interval = "1.0";
      cursor_stop_blinking_after = "1.0";
      cursor_text_color = "background";
      copy_on_select = "no";
      mouse_hide_wait = "3.0";
      sync_to_monitor = "yes";
      enabled_layouts = "Vertical";

      allow_remote_control = true;

      background = config.myTheme.color0;
      foreground = config.myTheme.color7;
      selection_background = config.myTheme.color7;
      selection_foreground = config.myTheme.color0;
      url_color = config.myTheme.color12;
      cursor = config.myTheme.color1;
      active_border_color = config.myTheme.color8;
      inactive_border_color = config.myTheme.color10;
      active_tab_background = config.myTheme.color12;
      active_tab_foreground = config.myTheme.color7;
      inactive_tab_background = config.myTheme.color8;
      inactive_tab_foreground = config.myTheme.color7;
      tab_bar_background = config.myTheme.color10;

      # normal
      color0 = config.myTheme.color0;
      color1 = config.myTheme.color1;
      color2 = config.myTheme.color2;
      color3 = config.myTheme.color3;
      color4 = config.myTheme.color4;
      color5 = config.myTheme.color5;
      color6 = config.myTheme.color6;
      color7 = config.myTheme.color7;

      # bright
      color8 = config.myTheme.color8;
      color9 = config.myTheme.color9;
      color10 = config.myTheme.color10;
      color11 = config.myTheme.color11;
      color12 = config.myTheme.color12;
      color13 = config.myTheme.color13;
      color14 = config.myTheme.color14;
      color15 = config.myTheme.color15;
    };
  };

  xdg.configFile."kitty/system-theme.sh" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash

      # Get the current system appearance
      os_theme=$(defaults read -g AppleInterfaceStyle 2>/dev/null)

      if [ "$os_theme" == "Dark" ]; then
        # Set Kitty to dark theme
        kitty @ set-colors ${config.xdg.configHome}/kitty/dark.conf
      elif [ -z "$os_theme" ]; then
        # Set Kitty to light theme
        kitty @ set-colors ${config.xdg.configHome}/kitty/light.conf
      fi
    '';
  };

  xdg.configFile."kitty/light.conf" = {
    text = let day = import ../../themes/base16-gruvbox-light-medium.nix;
    in ''
      background ${day.color0}
      foreground ${day.color7}
      selection_background ${day.color7}
      selection_foreground ${day.color0}
      url_color ${day.color12}
      cursor ${day.color1}
      active_border_color ${day.color8}
      inactive_border_color ${day.color10}
      active_tab_background ${day.color12}
      active_tab_foreground ${day.color7}
      inactive_tab_background ${day.color8}
      inactive_tab_foreground ${day.color7}
      tab_bar_background ${day.color10}

      color0 ${day.color0}
      color1 ${day.color1}
      color2 ${day.color2}
      color3 ${day.color3}
      color4 ${day.color4}
      color5 ${day.color5}
      color6 ${day.color6}
      color7 ${day.color7}

      color8 ${day.color8}
      color9 ${day.color9}
      color10 ${day.color10}
      color11 ${day.color11}
      color12 ${day.color12}
      color13 ${day.color13}
      color14 ${day.color14}
      color15 ${day.color15}
    '';
  };

  xdg.configFile."kitty/dark.conf" = {
    text = let night = import ../../themes/base16-gruvbox-dark-medium.nix;
    in ''
      background ${night.color0}
      foreground ${night.color7}
      selection_background ${night.color7}
      selection_foreground ${night.color0}
      url_color ${night.color12}
      cursor ${night.color1}
      active_border_color ${night.color8}
      inactive_border_color ${night.color10}
      active_tab_background ${night.color12}
      active_tab_foreground ${night.color7}
      inactive_tab_background ${night.color8}
      inactive_tab_foreground ${night.color7}
      tab_bar_background ${night.color10}

      color0 ${night.color0}
      color1 ${night.color1}
      color2 ${night.color2}
      color3 ${night.color3}
      color4 ${night.color4}
      color5 ${night.color5}
      color6 ${night.color6}
      color7 ${night.color7}

      color8 ${night.color8}
      color9 ${night.color9}
      color10 ${night.color10}
      color11 ${night.color11}
      color12 ${night.color12}
      color13 ${night.color13}
      color14 ${night.color14}
      color15 ${night.color15}
    '';
  };

}
