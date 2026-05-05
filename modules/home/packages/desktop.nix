{
  flake.homeModules.desktopPackages = {pkgs, ...}: {
    home.packages = with pkgs; [
      google-chrome
      wine
      winetricks
      wl-clipboard
    ];
  };
}
