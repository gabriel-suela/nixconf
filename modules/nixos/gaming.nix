{
  flake.nixosModules.gaming = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      dxvk
      mangohud
      protontricks
    ];

    programs.gamemode.enable = true;
    programs.gamescope.enable = true;
    programs.steam.enable = true;
  };
}
