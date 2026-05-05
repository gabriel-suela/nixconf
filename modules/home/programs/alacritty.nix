{
  flake.homeModules.alacritty = {
    programs.alacritty = {
      enable = true;

      settings = {
        env.TERM = "xterm-256color";

        font = {
          normal = {
            family = "JetBrainsMono Nerd Font";
            style = "Regular";
          };
          bold = {
            family = "JetBrainsMono Nerd Font";
            style = "Bold";
          };
          italic = {
            family = "JetBrainsMono Nerd Font";
            style = "Italic";
          };
          size = 11.5;
          offset = {
            x = 0;
            y = 0;
          };
        };

        window = {
          opacity = 0.8;
          blur = true;
          padding = {};
        };

        selection.save_to_clipboard = true;

        colors = {
          draw_bold_text_with_bright_colors = false;

          primary = {
            background = "#000000";
            foreground = "#D4D4D4";
          };

          cursor = {
            text = "#1F1F1F";
            cursor = "#D4D4D4";
          };

          normal = {
            black = "#1F1F1F";
            red = "#F44747";
            green = "#6A9955";
            yellow = "#DCDCAA";
            blue = "#569CD6";
            magenta = "#C586C0";
            cyan = "#56B6C2";
            white = "#D4D4D4";
          };

          bright.black = "#808080";
        };
      };
    };
  };
}
