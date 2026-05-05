{
  flake.homeModules.discord = {pkgs, ...}: {
    home.packages = with pkgs; [
      vesktop
    ];
  };
}
