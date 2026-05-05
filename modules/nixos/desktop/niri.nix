{self, ...}: {
  flake.nixosModules.niri = {pkgs, ...}: let
    wrappedNiri = self.packages.${pkgs.stdenv.hostPlatform.system}.niri;
    niriSession = pkgs.runCommand "niri-wrapped-session" {
      passthru.providedSessions = ["niri"];
    } ''
      mkdir -p \
        $out/bin \
        $out/share/systemd/user \
        $out/share/wayland-sessions \
        $out/share/xdg-desktop-portal

      ln -s ${wrappedNiri}/bin/niri $out/bin/niri
      ln -s ${pkgs.niri}/bin/niri-session $out/bin/niri-session
      ln -s ${wrappedNiri}/share/systemd/user/niri.service $out/share/systemd/user/niri.service
      ln -s ${pkgs.niri}/share/systemd/user/niri-shutdown.target $out/share/systemd/user/niri-shutdown.target
      ln -s ${pkgs.niri}/share/wayland-sessions/niri.desktop $out/share/wayland-sessions/niri.desktop
      ln -s ${pkgs.niri}/share/xdg-desktop-portal/niri-portals.conf $out/share/xdg-desktop-portal/niri-portals.conf
    '';
  in {
    programs.niri = {
      enable = true;
      package = niriSession;
    };
  };
}
