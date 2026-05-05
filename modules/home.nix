{self, ...}: {
  flake.nixosModules.suelaHome = {
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.backupFileExtension = "hm-backup";

    home-manager.users.suela = {pkgs, ...}: {
      imports = [
        self.homeModules.alacritty
        self.homeModules.desktopPackages
        self.homeModules.devPackages
        self.homeModules.discord
        self.homeModules.firefox
        self.homeModules.fuzzel
        self.homeModules.git
        self.homeModules.mako
        self.homeModules.zsh
      ];

      home.username = "suela";
      home.homeDirectory = "/home/suela";
      home.stateVersion = "25.11";

      home.pointerCursor = {
        gtk.enable = true;
        x11.enable = true;
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Classic";
        size = 24;
      };

      home.sessionVariables = {
        XCURSOR_SIZE = "24";
        XCURSOR_THEME = "Bibata-Modern-Classic";
      };
    };
  };
}
