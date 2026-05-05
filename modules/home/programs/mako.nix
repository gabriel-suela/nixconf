{
  flake.homeModules.mako = {
    services.mako = {
      enable = true;

      settings = {
        font = "JetBrains Mono Nerd Font 12";
        anchor = "top-right";
        layer = "overlay";
        width = 420;
        height = 120;
        margin = "10";
        padding = "10,12";
        border-size = 1;
        border-radius = 3;
        default-timeout = 5000;
        max-visible = 5;
        icons = true;
        markup = true;

        background-color = "#000000dd";
        text-color = "#ffffffdd";
        border-color = "#444444ff";
        progress-color = "over #ff5555ff";
      };
    };
  };
}
