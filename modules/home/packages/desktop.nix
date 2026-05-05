{
  flake.homeModules.desktopPackages = {pkgs, ...}: {
    home.packages = with pkgs; [
      alacritty
      google-chrome
      protontricks
      wine
      winetricks
      wl-clipboard
    ];
  };
}
